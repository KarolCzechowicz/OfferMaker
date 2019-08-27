package pl.KarolCzechowicz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KarolCzechowicz.model.Seat;

public interface SeatRepository extends JpaRepository<Seat, Long> {
}
