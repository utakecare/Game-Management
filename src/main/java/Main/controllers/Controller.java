package Main.controllers;

import Main.model.User;
import Main.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class Controller {
    private final UserService userService;

    @GetMapping("/hello/{id}")
    public User sayHello(@PathVariable int id) {
        return userService.getUser(id);
    }
}
