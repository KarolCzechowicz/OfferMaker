package pl.KarolCzechowicz.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.KarolCzechowicz.model.Fuel;
import pl.KarolCzechowicz.repository.FuelRepository;

public class FuelConverter implements Converter<String, Fuel> {
    @Autowired
    private FuelRepository fuelRepository;

    @Override
    public Fuel convert(String s) {
        return fuelRepository.findOne(Long.parseLong(s));
    }
}

