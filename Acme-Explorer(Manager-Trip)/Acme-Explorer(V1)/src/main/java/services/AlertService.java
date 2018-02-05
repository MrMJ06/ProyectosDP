
package services;

import java.util.Collection;
import java.util.Random;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.AlertRepository;
import domain.Actor;
import domain.Alert;
import domain.Manager;
import domain.Trip;

@Service
@Transactional
public class AlertService {

	// Managed repository --------------------------------------------------

	@Autowired
	private AlertRepository	alertRepository;

	// Supporting services --------------------------------------------------

	@Autowired
	private ActorService	actorService;


	// Simple CRUD methods --------------------------------------------------

	public Alert create(final Trip trip) {

		Manager manager;
		Alert result;
		String ticker;

		manager = (Manager) this.actorService.findActorByPrincipal();
		ticker = this.generateTicker();
		result = new Alert();
		result.setManager(manager);
		result.setTrip(trip);
		result.setTicker(ticker);

		return result;
	}
	public Collection<Alert> findAll() {

		Collection<Alert> result;
		Actor actor;

		actor = this.actorService.findActorByPrincipal();
		Assert.notNull(actor);

		result = this.alertRepository.findAll();
		Assert.notNull(result);

		return result;

	}

	public Alert findOne(final int alertId) {

		Assert.isTrue(alertId != 0);
		Assert.isTrue(this.alertRepository.exists(alertId));

		Actor actor;

		actor = this.actorService.findActorByPrincipal();
		Assert.notNull(actor);

		Alert result;

		result = this.alertRepository.findOne(alertId);

		return result;

	}

	public Alert save(final Alert alert) {

		assert alert != null;

		Alert result;
		Manager manager;

		manager = (Manager) this.actorService.findActorByPrincipal();

		Assert.isTrue(alert.getManager().equals(manager));

		result = this.alertRepository.save(alert);

		return result;

	}

	public void delete(final Alert alert) {

		assert alert != null;
		assert alert.getId() != 0;

		Manager manager;
		manager = (Manager) this.actorService.findActorByPrincipal();

		Assert.isTrue(alert.getManager().equals(manager));
		Assert.isTrue(this.alertRepository.exists(alert.getId()));

		this.alertRepository.delete(alert);

	}

	public Collection<Alert> findAlertsByManager(final Manager manager) {

		Assert.notNull(manager);

		Collection<Alert> result;

		result = this.alertRepository.findAlertsByManager(manager.getId());

		Assert.notNull(result);

		return result;
	}

	public Collection<Alert> findAlertsByTrip(final Trip trip) {

		Assert.notNull(trip);

		Collection<Alert> result;

		result = this.alertRepository.findAlertsByTrip(trip.getId());

		Assert.notNull(result);

		return result;
	}
	//Other Business Methods-----------------------------------------------------------------

	public String generateTicker() {
		String res;
		final int year, month, day;
		final String alphabet;
		final LocalDate currDate;
		Random random;

		currDate = new LocalDate();
		year = currDate.getYear() % 100;
		month = currDate.getMonthOfYear();
		day = currDate.getDayOfMonth();
		random = new Random();

		alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

		res = (year < 10 ? "0" + year : year) + "" + (month < 10 ? "0" + month : month) + "" + (day < 10 ? "0" + day : day) + "-";

		for (int i = 0; i < 4; i++)
			res += alphabet.charAt(random.nextInt(alphabet.length()));

		return res;
	}

}
