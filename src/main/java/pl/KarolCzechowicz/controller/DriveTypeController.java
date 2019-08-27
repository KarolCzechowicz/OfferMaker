package pl.KarolCzechowicz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.KarolCzechowicz.model.DriveType;
import pl.KarolCzechowicz.repository.DriveTypeRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
@RequestMapping("/driveType")
public class DriveTypeController {

    @Autowired
    private Validator validator;

    @Autowired
    private DriveTypeRepository driveTypeRepository;

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {

        model.addAttribute("driveType", new DriveType());
        List<DriveType> driveTypes = driveTypeRepository.findAll();
        model.addAttribute("driveTypes", driveTypes);
        return "/driveType/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String save(@Valid DriveType driveType, BindingResult result) {

        if (result.hasErrors()) {
            return "/driveType/add";
        }
        driveTypeRepository.save(driveType);
        return "redirect:/driveType/all";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String viewDriveTypes(Model model) {

        List<DriveType> driveTypes = driveTypeRepository.findAll();
        model.addAttribute("driveTypes", driveTypes);
        return "/driveType/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String editDriveType(@PathVariable Long id, Model model) {
        model.addAttribute("driveType", driveTypeRepository.findOne(id));
        return "/driveType/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid DriveType driveType, BindingResult result) {

        if (result.hasErrors()) {
            return "/driveType/add";
        }
        driveTypeRepository.save(driveType);
        return "redirect:/driveType/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteDriveType(@PathVariable Long id) {
        driveTypeRepository.delete(driveTypeRepository.findOne(id));
        return "redirect:/driveType/all";
    }
}
