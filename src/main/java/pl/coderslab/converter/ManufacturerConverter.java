package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Manufacturer;
import pl.coderslab.repository.ManufacturerRepository;

public class ManufacturerConverter implements Converter<String, Manufacturer> {
    @Autowired
    private ManufacturerRepository manufacturerRepository;

    @Override
    public Manufacturer convert(String s) {
        return manufacturerRepository.findOne(Long.parseLong(s));
    }
}

