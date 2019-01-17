package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String getLogin(Model model) {
        model.addAttribute("user", new User());
        return "/login";
    }


    @RequestMapping(value = "", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String login(@RequestParam String login, @RequestParam String password, HttpSession session) {
        if (userService.authenticate(login, password)) {
            session.setAttribute("userLogin", login);
            session.setAttribute("userEmail", userRepository.findByLogin(login).getEmail());
            return "redirect: /homePage";
        }
        return "redirect:/?";
    }

    @RequestMapping(value = "/register", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String getRegister(Model model) {
        model.addAttribute("user", new User());
        return "/register";
    }

    @RequestMapping(value = "/register", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String register(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/register";
        }
        if (!userService.userExists(user.getLogin())) {
            userService.register(user);
            return "redirect: /";
        }
        return "redirect:/register/?";
    }
}
