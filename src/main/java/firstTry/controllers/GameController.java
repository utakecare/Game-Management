package firstTry.controllers;

import firstTry.models.Game;
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

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class GameController {
    private final GameService gameService;
    private final UserService userService;

    @GetMapping("/")
    public String games(@RequestParam(name = "searchWord", required = false) String hero,
                        @RequestParam(name = "searchUser", required = false) Long id,
                        Principal principal, Model model) {
        model.addAttribute("games", gameService.listGamesByHeroAndUserId(id,hero));
        model.addAttribute("user", gameService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", hero);
        model.addAttribute("users", userService.listAllUsers());
        model.addAttribute("searchUser", id);
        return "games";
    }

    @GetMapping("/my/games")
    public String userGames(Principal principal, Model model) {
        User user = gameService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("games", user.getGames());
        return "my-games";
    }
    @PostMapping("/game/create")
    public String createGame(Game game, Principal principal) {
        gameService.saveGame(principal, game);
        return "redirect:/my/games";
    }
    @GetMapping("/game/{id}")
    public String gameInfo(@PathVariable Long id, Model model, Principal principal){
        Game game = gameService.getGameById(id);
        model.addAttribute("user", gameService.getUserByPrincipal(principal));
        model.addAttribute("game", game);
        model.addAttribute("whoseGame", game.getUser());
        return "game-info";
    }
    @PostMapping("/game/delete/{id}")
    public String deleteGame(@PathVariable Long id, Principal principal) {
        gameService.deleteGame(gameService.getUserByPrincipal(principal), id);
        return "redirect:/my/games";
    }
}
