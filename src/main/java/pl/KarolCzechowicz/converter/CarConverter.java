package pl.KarolCzechowicz.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.KarolCzechowicz.model.Car;
import pl.KarolCzechowicz.repository.CarRepository;

public class CarConverter implements Converter<String, Car> {
    @Autowired
    private CarRepository carRepository;

    @Override
    public Car convert(String s) {
        return carRepository.findOne(Long.parseLong(s));
    }
}

