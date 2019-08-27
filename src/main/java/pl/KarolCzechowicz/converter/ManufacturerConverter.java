package pl.KarolCzechowicz.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.KarolCzechowicz.model.Manufacturer;
import pl.KarolCzechowicz.repository.ManufacturerRepository;

public class ManufacturerConverter implements Converter<String, Manufacturer> {
    @Autowired
    private ManufacturerRepository manufacturerRepository;

    @Override
    public Manufacturer convert(String s) {
        return manufacturerRepository.findOne(Long.parseLong(s));
    }
}

