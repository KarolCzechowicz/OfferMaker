package pl.KarolCzechowicz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParamPageController {

    @RequestMapping(value = "/paramPage", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String paramPage() {
     return "/paramPage";
    }
}
