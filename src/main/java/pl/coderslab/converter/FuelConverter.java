package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.DriveType;
import pl.coderslab.model.Fuel;
import pl.coderslab.repository.DriveTypeRepository;
import pl.coderslab.repository.FuelRepository;

public class FuelConverter implements Converter<String, Fuel> {
    @Autowired
    private FuelRepository fuelRepository;

    @Override
    public Fuel convert(String s) {
        return fuelRepository.findOne(Long.parseLong(s));
    }
}

