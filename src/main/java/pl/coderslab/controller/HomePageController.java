package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomePageController {

    @RequestMapping(value = "/homePage", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String homePage() {
        return "/homePage";
    }
}
