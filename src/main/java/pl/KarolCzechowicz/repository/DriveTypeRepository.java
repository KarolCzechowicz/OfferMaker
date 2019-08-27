package pl.KarolCzechowicz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KarolCzechowicz.model.DriveType;

public interface DriveTypeRepository extends JpaRepository<DriveType, Long> {
}
