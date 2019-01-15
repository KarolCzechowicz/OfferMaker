package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.CarModel;

public interface CarModelRepository extends JpaRepository<CarModel, Long> {
}
