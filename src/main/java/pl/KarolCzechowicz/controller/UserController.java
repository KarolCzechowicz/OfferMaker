package pl.KarolCzechowicz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.KarolCzechowicz.model.User;
import pl.KarolCzechowicz.repository.UserRepository;
import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private Validator validator;

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {

        model.addAttribute("user", new User());
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "/user/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String save(@Valid User user, BindingResult result) {

        if (result.hasErrors()) {
            return "/user/add";
        }
        userRepository.save(user);
        return "redirect:/user/all";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String viewUsers(Model model) {

        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "/user/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String editUser(@PathVariable Long id, Model model) {
        model.addAttribute("user", userRepository.findOne(id));
        return "/user/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid User user, BindingResult result) {

        if (result.hasErrors()) {
            return "/user/add";
        }
        userRepository.save(user);
        return "redirect:/user/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userRepository.delete(userRepository.findOne(id));
        return "redirect:/logout";
    }
}
