
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Alert;

@Repository
public interface AlertRepository extends JpaRepository<Alert, Integer> {

	@Query("select a from Alert a where a.trip.id = ?1")
	Collection<Alert> findAlertsByTrip(int tripId);

	@Query("select a from Alert a where a.manager.id = ?1")
	Collection<Alert> findAlertsByManager(int managerId);

	@Query("select count(distinct a.trip)*1.0/(select count(t) from Trip t) from Alert a;")
	String getRatioTripsWithOneAlert();

	@Query("select a.trip from Alert a from group by a.trip;")
	String getMaxCountAlerts();
}
