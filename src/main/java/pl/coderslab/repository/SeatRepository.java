package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Seat;
import pl.coderslab.model.Transmission;

public interface SeatRepository extends JpaRepository<Seat, Long> {
}
