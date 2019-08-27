package pl.KarolCzechowicz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KarolCzechowicz.model.Fuel;

public interface FuelRepository extends JpaRepository<Fuel, Long> {
}
