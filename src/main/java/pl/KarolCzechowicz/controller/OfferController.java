package pl.KarolCzechowicz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.KarolCzechowicz.model.*;
import pl.KarolCzechowicz.repository.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.Validator;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/offer")
public class OfferController {
    @Autowired
    private Validator validator;

    @Autowired
    private OfferRepository offerRepository;

    @Autowired
    private CarRepository carRepository;

    @ModelAttribute("cars")
    public List<Car> getCars() {
        return carRepository.findAll();
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {

        model.addAttribute("offer", new Offer());
        List<Offer> offers = offerRepository.findAll();
        model.addAttribute("offers", offers);
        return "/offer/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String save(@Valid Offer offer, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            return "/offer/add";
        }

        String login = (String) session.getAttribute("userLogin");
        String email = (String) session.getAttribute("userEmail");
        offer.setUserLogin(login);
        offer.setUserEmail(email);

        Date date = Calendar.getInstance().getTime();
        offer.setCreated(date);

        offerRepository.save(offer);
        return "redirect:/offer/all";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String viewOffers(Model model) {

        List<Offer> offers = offerRepository.findAll();
        model.addAttribute("offers", offers);
        return "/offer/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String editOffer(@PathVariable Long id, Model model) {
        model.addAttribute("offer", offerRepository.findOne(id));
        return "/offer/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid Offer offer, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            return "/offer/add";
        }
        String login = (String) session.getAttribute("userLogin");
        String email = (String) session.getAttribute("userEmail");
        offer.setUserLogin(login);
        offer.setUserEmail(email);

        Date dateUpdated = Calendar.getInstance().getTime();
        offer.setUpdated(dateUpdated);

        offerRepository.save(offer);
        return "redirect:/offer/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteOffer(@PathVariable Long id) {
        offerRepository.delete(offerRepository.findOne(id));
        return "redirect:/offer/all";
    }

    @RequestMapping(value = "/view/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String viewOffer(@PathVariable Long id, Model model) {
        model.addAttribute("offer", offerRepository.findOne(id));
        return "/offer/view";
    }
}
