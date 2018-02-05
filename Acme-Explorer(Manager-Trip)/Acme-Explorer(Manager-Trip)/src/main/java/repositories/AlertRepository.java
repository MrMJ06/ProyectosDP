
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Alert;
import domain.Manager;
import domain.Trip;

@Repository
public interface AlertRepository extends JpaRepository<Alert, Integer> {

	@Query("select t from Trip t join t.alerts a where a.id=?1")
	Trip findTripByAlert(int alertId);

	@Query("select m from Manager m join m.alerts a where a.id = ?1")
	Manager findManagerByAlert(int alertId);


}
