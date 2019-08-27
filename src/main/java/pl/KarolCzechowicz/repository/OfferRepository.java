package pl.KarolCzechowicz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KarolCzechowicz.model.Offer;

public interface OfferRepository extends JpaRepository<Offer, Long> {
}
