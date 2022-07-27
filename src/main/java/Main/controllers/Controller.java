package Main.controllers;

import Main.model.User;
import Main.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
public class Controller {
    private final UserRepository userRepository;
    @GetMapping("/users/{id}")
    public Optional<User> userFindOne(@PathVariable("id")Integer id){
        return userRepository.findById(id);
    }
    @GetMapping("/users")
    public List<User> userList(){
        List<User> list = new ArrayList<>();
        int id = 1;
        while(userRepository.findById(id).isPresent()){
            list.add(userRepository.findById(id).get());
            id++;
        }
        return list;
    }
}
