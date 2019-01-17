package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.model.*;
import pl.coderslab.repository.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.Validator;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/car")
public class CarController {
    @Autowired
    private Validator validator;

    @Autowired
    private CarRepository carRepository;

    @Autowired
    private ManufacturerRepository manufacturerRepository;

    @Autowired
    private CarModelRepository carModelRepository;

    @Autowired
    private TransmissionRepository transmissionRepository;

    @Autowired
    private FuelRepository fuelRepository;

    @Autowired
    private DriveTypeRepository driveTypeRepository;

    @Autowired
    private SeatRepository seatRepository;

    @ModelAttribute("manufacturers")
    public List<Manufacturer> getManufacturers() {
        return manufacturerRepository.findAll();
    }

    @ModelAttribute("carModels")
    public List<CarModel> getCarModels() {
        return carModelRepository.findAll();
    }

    @ModelAttribute("transmissions")
    public List<Transmission> getTransmissions() {
        return transmissionRepository.findAll();
    }

    @ModelAttribute("fuels")
    public List<Fuel> getFuels() {
        return fuelRepository.findAll();
    }

    @ModelAttribute("driveTypes")
    public List<DriveType> getDriveTypes() {
        return driveTypeRepository.findAll();
    }

    @ModelAttribute("seats")
    public List<Seat> getSeats() {
        return seatRepository.findAll();
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {

        model.addAttribute("car", new Car());
        List<Car> cars = carRepository.findAll();
        model.addAttribute("cars", cars);
        return "/car/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String save(@Valid Car car, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            return "/car/add";
        }
        String login = (String) session.getAttribute("userLogin");
        String email = (String) session.getAttribute("userEmail");
        car.setUserLogin(login);
        car.setUserEmail(email);

        Date date = Calendar.getInstance().getTime();
        car.setCreated(date);
        car.setUpdated(date);
        carRepository.save(car);
        return "redirect:/car/all";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String viewCars(Model model) {

        List<Car> cars = carRepository.findAll();
        model.addAttribute("cars", cars);
        return "/car/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String editCar(@PathVariable Long id, Model model) {
        model.addAttribute("car", carRepository.findOne(id));
        return "/car/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid Car car, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            return "/car/add";
        }
        String login = (String) session.getAttribute("userLogin");
        String email = (String) session.getAttribute("userEmail");
        car.setUserLogin(login);
        car.setUserEmail(email);

        Date date = Calendar.getInstance().getTime();
        car.setUpdated(date);
        carRepository.save(car);
        return "redirect:/car/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteCar(@PathVariable Long id) {
        carRepository.delete(carRepository.findOne(id));
        return "redirect:/car/all";
    }
}
