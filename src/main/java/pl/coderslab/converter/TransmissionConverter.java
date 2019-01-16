package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Transmission;
import pl.coderslab.repository.TransmissionRepository;

public class TransmissionConverter implements Converter<String, Transmission> {
    @Autowired
    private TransmissionRepository transmissionRepository;

    @Override
    public Transmission convert(String s) {
        return transmissionRepository.findOne(Long.parseLong(s));
    }
}

