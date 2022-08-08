package firstTry.repositories;

import firstTry.models.Game;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GameRepository extends JpaRepository<Game, Long> {
    List<Game> findByHero(String hero);
    List<Game> findByUserId(Long userId);
}
