package pl.KarolCzechowicz.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.KarolCzechowicz.model.Transmission;
import pl.KarolCzechowicz.repository.TransmissionRepository;

public class TransmissionConverter implements Converter<String, Transmission> {
    @Autowired
    private TransmissionRepository transmissionRepository;

    @Override
    public Transmission convert(String s) {
        return transmissionRepository.findOne(Long.parseLong(s));
    }
}

