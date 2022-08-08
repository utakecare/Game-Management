package firstTry.services;

import firstTry.models.User;
import firstTry.models.enums.Role;
import firstTry.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    @Value("${upload.path}")
    private String uploadPath;

    public boolean createUser(User user) {
        String userName = user.getName();
        if (userRepository.findByName(userName) != null) {
            return false;
        }
        user.getRoles().add(Role.ROLE_USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setAvatar("avatar.png");
        log.info("Saving new user: {}", userName);
        userRepository.save(user);
        return true;
    }

    public List<User> listAllUsers() {
        return userRepository.findAll();
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByName(principal.getName());
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public void setUserAvatar(Principal principal, MultipartFile file) throws IOException {
        if (file != null) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFileName));
            getUserByPrincipal(principal).setAvatar(resultFileName);
            userRepository.save(getUserByPrincipal(principal));
        }
    }

    public boolean isAvatarExist(User user) {
        File file = new File(uploadPath + "/" + user.getAvatar());
        return file.exists();
    }
}
