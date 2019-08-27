package pl.KarolCzechowicz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KarolCzechowicz.model.Car;



public interface CarRepository extends JpaRepository<Car, Long> {
    Car findFirstByOrderByUpdated();
}
