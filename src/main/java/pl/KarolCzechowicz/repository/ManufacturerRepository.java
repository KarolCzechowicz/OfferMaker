package pl.KarolCzechowicz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KarolCzechowicz.model.Manufacturer;

public interface ManufacturerRepository extends JpaRepository<Manufacturer, Long> {
}
