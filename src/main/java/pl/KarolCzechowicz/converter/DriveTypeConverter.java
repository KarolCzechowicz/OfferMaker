package pl.KarolCzechowicz.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.KarolCzechowicz.model.DriveType;
import pl.KarolCzechowicz.repository.DriveTypeRepository;

public class DriveTypeConverter implements Converter<String, DriveType> {
    @Autowired
    private DriveTypeRepository driveTypeRepository;

    @Override
    public DriveType convert(String s) {
        return driveTypeRepository.findOne(Long.parseLong(s));
    }
}

