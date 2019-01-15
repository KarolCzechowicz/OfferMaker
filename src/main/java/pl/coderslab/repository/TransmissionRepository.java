package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Fuel;
import pl.coderslab.model.Transmission;

public interface TransmissionRepository extends JpaRepository<Transmission, Long> {
}
