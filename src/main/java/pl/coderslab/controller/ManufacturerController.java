package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.model.CarModel;
import pl.coderslab.model.Manufacturer;
import pl.coderslab.repository.CarModelRepository;
import pl.coderslab.repository.ManufacturerRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
@RequestMapping("/manufacturer")
public class ManufacturerController {

    @Autowired
    private Validator validator;

    @Autowired
    private ManufacturerRepository manufacturerRepository;

    @Autowired
    private CarModelRepository carModelRepository;

    @ModelAttribute("carModels")
    public List<CarModel> getCarModels() {
        return carModelRepository.findAll();
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {

        model.addAttribute("manufacturer", new Manufacturer());
        List<Manufacturer> manufacturers = manufacturerRepository.findAll();
        model.addAttribute("manufacturers", manufacturers);
        return "/manufacturer/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String save(@Valid Manufacturer manufacturer, BindingResult result) {

        if (result.hasErrors()) {
            return "/manufacturer/add";
        }
        manufacturerRepository.save(manufacturer);
        return "redirect:/manufacturer/all";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String viewManufacturers(Model model) {

        List<Manufacturer> manufacturers = manufacturerRepository.findAll();
        model.addAttribute("manufacturers", manufacturers);
        return "/manufacturer/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String editManufacturer(@PathVariable Long id, Model model) {
        model.addAttribute("manufacturer", manufacturerRepository.findOne(id));
        return "/manufacturer/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid Manufacturer manufacturer, BindingResult result) {

        if (result.hasErrors()) {
            return "/manufacturer/add";
        }
        manufacturerRepository.save(manufacturer);
        return "redirect:/manufacturer/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteManufacturer(@PathVariable Long id) {
        manufacturerRepository.delete(manufacturerRepository.findOne(id));
        return "redirect:/manufacturer/all";
    }
}
