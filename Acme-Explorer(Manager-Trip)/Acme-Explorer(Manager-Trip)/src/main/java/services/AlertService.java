
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

	@Autowired
	private TripService		tripService;

	@Autowired
	private ManagerService	managerService;


	// Simple CRUD methods --------------------------------------------------

	public Alert create() {

		Alert result;
		String ticker;

		ticker = this.generateTicker();
		result = new Alert();
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

		Manager manager;

		manager = (Manager) this.actorService.findActorByPrincipal();
		Assert.notNull(manager);

		Alert result;

		result = this.alertRepository.findOne(alertId);
		Assert.isTrue(manager.getAlerts().contains(result));
		return result;

	}

	public Alert save(final Alert alert, final Trip trip) {

		assert alert != null;

		Alert result;
		Manager manager;

		//Checking spamwords
		this.actorService.checkSpamWords(alert.getTitle());
		this.actorService.checkSpamWords(alert.getDescription());

		manager = (Manager) this.actorService.findActorByPrincipal();

		result = this.alertRepository.save(alert);

		if (trip.getAlerts().contains(alert))
			trip.getAlerts().remove(alert);
		trip.getAlerts().add(result);
		this.tripService.save(trip);

		if (manager.getAlerts().contains(alert))
			manager.getAlerts().remove(alert);
		manager.getAlerts().add(result);
		this.managerService.save(manager);

		return result;

	}
	public void delete(final Alert alert) {

		assert alert != null;
		assert alert.getId() != 0;

		Manager manager;
		final Trip trip;

		manager = (Manager) this.actorService.findActorByPrincipal();
		trip = this.alertRepository.findTripByAlert(alert.getId());

		Assert.isTrue(manager.getAlerts().contains(alert));
		Assert.isTrue(this.alertRepository.exists(alert.getId()));

		trip.getAlerts().remove(alert);
		this.tripService.save(trip);

		manager.getAlerts().remove(alert);
		this.managerService.save(manager);

		this.alertRepository.delete(alert);

	}

	public Manager findManagerByAlert(final Alert alert) {

		Assert.notNull(alert);

		Manager result;

		result = this.alertRepository.findManagerByAlert(alert.getId());

		Assert.notNull(result);

		return result;
	}

	public Trip findTripByAlert(final Alert alert) {

		Assert.notNull(alert);

		Trip result;

		result = this.alertRepository.findTripByAlert(alert.getId());

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