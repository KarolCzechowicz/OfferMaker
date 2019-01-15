package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Car;
import pl.coderslab.model.Transmission;

public interface CarRepository extends JpaRepository<Car, Long> {
}
