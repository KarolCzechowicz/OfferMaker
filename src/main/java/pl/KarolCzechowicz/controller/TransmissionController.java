package pl.KarolCzechowicz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.KarolCzechowicz.model.Transmission;
import pl.KarolCzechowicz.repository.TransmissionRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
@RequestMapping("/transmission")
public class TransmissionController {
    @Autowired
    private Validator validator;

    @Autowired
    private TransmissionRepository transmissionRepository;

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {

        model.addAttribute("transmission", new Transmission());
        List<Transmission> transmissions = transmissionRepository.findAll();
        model.addAttribute("transmissions", transmissions);
        return "/transmission/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String save(@Valid Transmission transmission, BindingResult result) {

        if (result.hasErrors()) {
            return "/transmission/add";
        }
        transmissionRepository.save(transmission);
        return "redirect:/transmission/all";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String viewTransmissions(Model model) {

        List<Transmission> transmissions = transmissionRepository.findAll();
        model.addAttribute("transmissions", transmissions);
        return "/transmission/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String editTransmission(@PathVariable Long id, Model model) {
        model.addAttribute("transmission", transmissionRepository.findOne(id));
        return "/transmission/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid Transmission transmission, BindingResult result) {

        if (result.hasErrors()) {
            return "/transmission/add";
        }
        transmissionRepository.save(transmission);
        return "redirect:/transmission/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteTransmission(@PathVariable Long id) {
        transmissionRepository.delete(transmissionRepository.findOne(id));
        return "redirect:/transmission/all";
    }
}
