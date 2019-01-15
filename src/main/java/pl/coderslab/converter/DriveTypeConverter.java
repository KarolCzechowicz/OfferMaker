package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.DriveType;
import pl.coderslab.repository.DriveTypeRepository;

public class DriveTypeConverter implements Converter<String, DriveType> {
    @Autowired
    private DriveTypeRepository driveTypeRepository;

    @Override
    public DriveType convert(String s) {
        return driveTypeRepository.findOne(Long.parseLong(s));
    }
}

