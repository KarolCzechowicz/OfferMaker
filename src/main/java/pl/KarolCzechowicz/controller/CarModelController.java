package pl.KarolCzechowicz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.KarolCzechowicz.model.CarModel;
import pl.KarolCzechowicz.repository.CarModelRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
@RequestMapping("/model")
public class CarModelController {

    @Autowired
    private Validator validator;

    @Autowired
    private CarModelRepository carModelRepository;

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {

        model.addAttribute("model", new CarModel());
        List<CarModel> carModels = carModelRepository.findAll();
        model.addAttribute("models", carModels);
        return "/model/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String save(@Valid CarModel carModel, BindingResult result) {

        if (result.hasErrors()) {
            return "/model/add";
        }
        carModelRepository.save(carModel);
        return "redirect:/model/all";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String viewCarModels(Model model) {

        List<CarModel> carModels = carModelRepository.findAll();
        model.addAttribute("carModels", carModels);
        return "/model/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String editCarModel(@PathVariable Long id, Model model) {
        model.addAttribute("model", carModelRepository.findOne(id));
        return "/model/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid CarModel carModel, BindingResult result) {

        if (result.hasErrors()) {
            return "/model/add";
        }
        carModelRepository.save(carModel);
        return "redirect:/model/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteCarModel(@PathVariable Long id) {
        carModelRepository.delete(carModelRepository.findOne(id));
        return "redirect:/model/all";
    }
}
