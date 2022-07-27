package Main.services;

import Main.model.User;
import Main.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    public  UserRepository userRepository;

    @Override
    public User getUser(int id) {
        return userRepository.findById(id).get();
    }
}
