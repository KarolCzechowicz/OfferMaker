package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.CarModel;
import pl.coderslab.model.DriveType;

public interface DriveTypeRepository extends JpaRepository<DriveType, Long> {
}
