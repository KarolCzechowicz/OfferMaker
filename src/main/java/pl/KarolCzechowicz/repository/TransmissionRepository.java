package pl.KarolCzechowicz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KarolCzechowicz.model.Transmission;

public interface TransmissionRepository extends JpaRepository<Transmission, Long> {
}
