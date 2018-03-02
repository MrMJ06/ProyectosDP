
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Lusit;
import domain.Manager;
import domain.Trip;

@Repository
public interface LusitRepository extends JpaRepository<Lusit, Integer> {

	@Query("select t from Trip t join t.lusits l where l.id=?1")
	Trip findTripByLusit(int lusitId);

	@Query("select m from Manager m join m.lusits l where l.id = ?1")
	Manager findManagerByLusit(int lusitId);

}
