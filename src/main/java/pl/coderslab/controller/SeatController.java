package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.model.Seat;
import pl.coderslab.repository.SeatRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
@RequestMapping("/seat")
public class SeatController {
    @Autowired
    private Validator validator;

    @Autowired
    private SeatRepository seatRepository;

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {

        model.addAttribute("seat", new Seat());
        List<Seat> seats = seatRepository.findAll();
        model.addAttribute("seats", seats);
        return "/seat/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String save(@Valid Seat seat, BindingResult result) {

        if (result.hasErrors()) {
            return "/seat/add";
        }
        seatRepository.save(seat);
        return "redirect:/seat/all";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String viewSeats(Model model) {

        List<Seat> seats = seatRepository.findAll();
        model.addAttribute("seats", seats);
        return "/seat/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String editSeat(@PathVariable Long id, Model model) {
        model.addAttribute("seat", seatRepository.findOne(id));
        return "/seat/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid Seat seat, BindingResult result) {

        if (result.hasErrors()) {
            return "/seat/add";
        }
        seatRepository.save(seat);
        return "redirect:/seat/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteSeat(@PathVariable Long id) {
        seatRepository.delete(seatRepository.findOne(id));
        return "redirect:/seat/all";
    }
}
