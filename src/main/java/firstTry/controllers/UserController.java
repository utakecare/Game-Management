package firstTry.controllers;

import firstTry.models.User;
import firstTry.services.GameService;
import firstTry.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final GameService gameService;

    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";

    }

    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с именем: " + user.getName() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/profile")
    public String profile(Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("winRate", gameService.winRate(user));
        model.addAttribute("avatarExist", userService.isAvatarExist(user));
        return "profile";
    }

    @PostMapping("/profile")
    public String addAvatar(Principal principal,
                            @RequestParam("file") MultipartFile file, Model model) throws IOException {
        userService.setUserAvatar(principal, file);
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "redirect:/profile";
    }

    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model, Principal principal) {
        model.addAttribute("user", user);
        model.addAttribute("userByPrincipal", userService.getUserByPrincipal(principal));
        model.addAttribute("games", user.getGames());
        model.addAttribute("avatarExist", userService.isAvatarExist(user));
        return "user-info";
    }
}
