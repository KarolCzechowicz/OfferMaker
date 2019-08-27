package pl.KarolCzechowicz.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.KarolCzechowicz.model.CarModel;
import pl.KarolCzechowicz.repository.CarModelRepository;

public class CarModelConverter implements Converter<String, CarModel> {
    @Autowired
    private CarModelRepository carModelRepository;

    @Override
    public CarModel convert(String s) {
        return carModelRepository.findOne(Long.parseLong(s));
    }
}

