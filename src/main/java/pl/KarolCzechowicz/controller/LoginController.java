package pl.KarolCzechowicz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import pl.KarolCzechowicz.model.User;
import pl.KarolCzechowicz.repository.UserRepository;
import pl.KarolCzechowicz.service.UserService;

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

    @RequestMapping(value = "/account", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String getAccount(Model model, Model model2, HttpSession session) {
        model.addAttribute("user", new User());
        String login = (String) session.getAttribute("userLogin");
        model2.addAttribute("login", login);
        return "/account";
    }

    @RequestMapping(value = "/account", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String account(@Valid User user, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "/account";
        }
        String login = (String) session.getAttribute("userLogin");
        String password = user.getPassword();
        if (userService.authenticate(login, password)) {
            return "redirect:/account2";
        }
        return "redirect:/account/?";
    }

    @RequestMapping(value = "/account2", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String getRegister2(Model model, Model model2, Model model3, HttpSession session) {
        model.addAttribute("user", new User());
        String login = (String) session.getAttribute("userLogin");
        model2.addAttribute("login", login);
        User current = userRepository.findByLogin(login);
        Long id = current.getId();
        model3.addAttribute("id", id);
        return "/account2";
    }

    @RequestMapping(value = "/account2", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String register2(@Valid User user, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "/account2";
        }
        String login = (String) session.getAttribute("userLogin");
        String password = user.getPassword();

        User newUser = userRepository.findByLogin(login);

        newUser.setPassword(password);
        if (user.getEmail() == "" || user.getEmail() == null) {

        } else {
            String email = (String) session.getAttribute("userEmail");
            newUser.setEmail(email);
        }
        userService.register(newUser);
        return "redirect: /homePage";

    }
}
