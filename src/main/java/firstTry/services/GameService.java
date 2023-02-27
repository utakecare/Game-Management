package firstTry.services;

import firstTry.models.Game;
import firstTry.models.User;
import firstTry.repositories.GameRepository;
import firstTry.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

import static java.lang.Math.round;

@Service
@Slf4j
@RequiredArgsConstructor
public class GameService {
    private final GameRepository gameRepository;
    private final UserRepository userRepository;

    public List<Game> listGamesByHeroAndUserId(Long id, String hero) {
        if (id == null) {
            if (gameRepository.findByHero(hero).isEmpty()) {
                return gameRepository.findAll();
            }
            return gameRepository.findByHero(hero);
        }
        if (gameRepository.findByHero(hero).isEmpty()) {
            return gameRepository.findByUserId(id);
        }
        return gameRepository.findByUserId(id)
                .stream()
                .filter(i -> i.getHero().equals(hero))
                .collect(Collectors.toList());
    }

    public List<Game> listGamesById(User user) {
        return gameRepository.findByUserId(user.getId());
    }

    public void saveGame(Principal principal, Game game) {
        game.setUser(getUserByPrincipal(principal));
        log.info("Новая игра добавлена в базу. Id: {}; Автор: {}", game.getGameId(), game.getUser().getName());
        gameRepository.save(game);
    }

    public void deleteGame(User user, Long id) {
        Game game = gameRepository.findById(id).orElse(null);
        if (game != null) {
            if (game.getUser().getId().equals(user.getId())) {
                gameRepository.delete(game);
                log.info("Игра с id: {} удалена", id);
            } else {
                log.error("Пользователь: {} не имеет игры с id: {}", user.getName(), id);
            }
        } else {
            log.error("Игра с id: {} не найдена", id);
        }
    }

    public Game getGameById(Long id) {
        return gameRepository.findById(id).orElse(null);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByName(principal.getName());
    }

    public double winRate(User user) {
        long gameCount = listGamesById(user).size();
        long gameWin = listGamesById(user).stream()
                .map(Game::getResult)
                .filter(i -> i.equals("Победа"))
                .count();
        if (gameWin == 0) {
            return 0;
        }
        return round((double) gameWin / gameCount * 1000.0) / 10.0;
    }
}
