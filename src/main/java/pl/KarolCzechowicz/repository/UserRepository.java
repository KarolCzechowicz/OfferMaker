package pl.KarolCzechowicz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KarolCzechowicz.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByLogin(String login);
}
