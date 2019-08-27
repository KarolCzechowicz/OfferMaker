package pl.KarolCzechowicz.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.KarolCzechowicz.model.Offer;
import pl.KarolCzechowicz.repository.OfferRepository;

public class OfferConverter implements Converter<String, Offer> {
    @Autowired
    private OfferRepository offerRepository;

    @Override
    public Offer convert(String s) {
        return offerRepository.findOne(Long.parseLong(s));
    }
}

