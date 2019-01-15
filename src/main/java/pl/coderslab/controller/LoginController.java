package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.coderslab.model.User;

import java.util.List;

@Controller
public class LoginController {



    @RequestMapping(value = "/login", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute("user", new User());
        return "/login";
    }
}
