package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.DriveType;
import pl.coderslab.model.Fuel;

public interface FuelRepository extends JpaRepository<Fuel, Long> {
}
