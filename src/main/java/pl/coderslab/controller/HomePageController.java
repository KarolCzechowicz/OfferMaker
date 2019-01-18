package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class HomePageController {

    @RequestMapping(value = "/homePage", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String homePage(Model model, HttpSession session) {

        String login = (String) session.getAttribute("userLogin");
        model.addAttribute("login", login);
        return "/homePage";
    }
}
