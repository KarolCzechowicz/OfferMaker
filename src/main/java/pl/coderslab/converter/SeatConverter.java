package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Seat;
import pl.coderslab.repository.SeatRepository;

public class SeatConverter implements Converter<String, Seat> {
    @Autowired
    private SeatRepository seatRepository;

    @Override
    public Seat convert(String s) {
        return seatRepository.findOne(Long.parseLong(s));
    }
}

