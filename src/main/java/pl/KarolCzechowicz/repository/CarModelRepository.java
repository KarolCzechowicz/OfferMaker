package pl.KarolCzechowicz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KarolCzechowicz.model.CarModel;

public interface CarModelRepository extends JpaRepository<CarModel, Long> {
}
