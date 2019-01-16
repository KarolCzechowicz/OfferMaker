package pl.coderslab.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean authenticate(String login, String password) {
        User user = userRepository.findByLogin(login);
        if (user != null) {
            if (BCrypt.checkpw(password, user.getPassword())) {
                return true;
            }
        }
        return false;
    }

    public boolean userExists(String login) {
        if (userRepository.findByLogin(login) != null) {
            return true;
        }
        return false;
    }

    public void register(User user) {
        String password = user.getPassword();
        user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
        userRepository.save(user);
    }
}
