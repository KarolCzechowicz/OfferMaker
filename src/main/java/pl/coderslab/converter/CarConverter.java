package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Car;
import pl.coderslab.model.User;
import pl.coderslab.repository.CarRepository;
import pl.coderslab.repository.UserRepository;

public class CarConverter implements Converter<String, Car> {
    @Autowired
    private CarRepository carRepository;

    @Override
    public Car convert(String s) {
        return carRepository.findOne(Long.parseLong(s));
    }
}

