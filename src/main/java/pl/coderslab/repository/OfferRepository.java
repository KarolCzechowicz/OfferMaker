package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Offer;
import pl.coderslab.model.Seat;

public interface OfferRepository extends JpaRepository<Offer, Long> {
}
