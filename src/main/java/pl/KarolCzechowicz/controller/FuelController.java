package pl.KarolCzechowicz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.KarolCzechowicz.model.Fuel;
import pl.KarolCzechowicz.repository.FuelRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
@RequestMapping("/fuel")
public class FuelController {

    @Autowired
    private Validator validator;

    @Autowired
    private FuelRepository fuelRepository;

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {

        model.addAttribute("fuel", new Fuel());
        List<Fuel> fuels = fuelRepository.findAll();
        model.addAttribute("fuels", fuels);
        return "/fuel/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String save(@Valid Fuel fuel, BindingResult result) {

        if (result.hasErrors()) {
            return "/fuel/add";
        }
        fuelRepository.save(fuel);
        return "redirect:/fuel/all";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String viewFuels(Model model) {

        List<Fuel> fuels = fuelRepository.findAll();
        model.addAttribute("fuels", fuels);
        return "/fuel/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String editFuel(@PathVariable Long id, Model model) {
        model.addAttribute("fuel", fuelRepository.findOne(id));
        return "/fuel/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid Fuel fuel, BindingResult result) {

        if (result.hasErrors()) {
            return "/fuel/add";
        }
        fuelRepository.save(fuel);
        return "redirect:/fuel/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteFuel(@PathVariable Long id) {
        fuelRepository.delete(fuelRepository.findOne(id));
        return "redirect:/fuel/all";
    }
}
