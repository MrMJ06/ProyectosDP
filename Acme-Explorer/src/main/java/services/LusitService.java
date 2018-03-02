
package services;

import java.util.Collection;
import java.util.Date;
import java.util.Random;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.LusitRepository;
import domain.Actor;
import domain.Lusit;
import domain.Manager;
import domain.Trip;

@Service
@Transactional
public class LusitService {

	// Managed repository --------------------------------------------------

	@Autowired
	private LusitRepository	alertRepository;

	// Supporting services --------------------------------------------------

	@Autowired
	private ActorService	actorService;

	@Autowired
	private TripService		tripService;

	@Autowired
	private ManagerService	managerService;


	// Simple CRUD methods --------------------------------------------------

	public Lusit create() {

		Lusit result;
		String ticker;

		ticker = this.generateTicker();
		result = new Lusit();
		result.setTicker(ticker);
		//result.setMoment(new Date(System.currentTimeMillis()+1));

		return result;
	}
	public Collection<Lusit> findAll() {

		Collection<Lusit> result;
		Actor actor;

		actor = this.actorService.findActorByPrincipal();
		Assert.notNull(actor);

		result = this.alertRepository.findAll();
		Assert.notNull(result);

		return result;

	}

	public Lusit findOne(final int alertId) {

		Assert.isTrue(alertId != 0);
		Assert.isTrue(this.alertRepository.exists(alertId));

		Manager manager;

		manager = (Manager) this.actorService.findActorByPrincipal();
		Assert.notNull(manager);

		Lusit result;

		result = this.alertRepository.findOne(alertId);
		Assert.isTrue(manager.getLusits().contains(result));
		return result;

	}

	public Lusit save(final Lusit alert, final Trip trip) {

		assert alert != null;
		//Assert.isTrue(alert.getMoment() == null || alert.getMoment().after(new Date()));

		Lusit result;
		Manager manager;

		//Checking spamwords
		this.actorService.checkSpamWords(alert.getTitle());
		this.actorService.checkSpamWords(alert.getDescription());

		manager = (Manager) this.actorService.findActorByPrincipal();
		if (alert.getMoment() == null)
			alert.setMoment(new Date());
		result = this.alertRepository.save(alert);

		if (trip.getLusits().contains(alert))
			trip.getLusits().remove(alert);
		trip.getLusits().add(result);
		this.tripService.save(trip);

		if (manager.getLusits().contains(alert))
			manager.getLusits().remove(alert);
		manager.getLusits().add(result);
		this.managerService.save(manager);

		return result;

	}
	public void delete(final Lusit alert) {

		assert alert != null;
		assert alert.getId() != 0;

		Manager manager;
		final Trip trip;

		manager = (Manager) this.actorService.findActorByPrincipal();
		trip = this.alertRepository.findTripByLusit(alert.getId());

		Assert.isTrue(manager.getLusits().contains(alert));
		Assert.isTrue(this.alertRepository.exists(alert.getId()));

		trip.getLusits().remove(alert);
		this.tripService.save(trip);

		manager.getLusits().remove(alert);
		this.managerService.save(manager);

		this.alertRepository.delete(alert);

	}

	public Manager findManagerByAlert(final Lusit alert) {

		Assert.notNull(alert);

		Manager result;

		result = this.alertRepository.findManagerByLusit(alert.getId());

		Assert.notNull(result);

		return result;
	}

	public Trip findTripByAlert(final Lusit alert) {

		Assert.notNull(alert);

		Trip result;

		result = this.alertRepository.findTripByLusit(alert.getId());

		Assert.notNull(result);

		return result;
	}
	//Other Business Methods-----------------------------------------------------------------

	public String generateTicker() {
		String result;
		final int year, month, day;
		final String alphabet;
		final LocalDate currDate;
		Random random;

		currDate = new LocalDate();
		year = currDate.getYear() % 100;
		month = currDate.getMonthOfYear();
		day = currDate.getDayOfMonth();
		random = new Random();

		alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";

		result = (year < 10 ? "0" + year : year) + "-";

		for (int i = 0; i < 4; i++)
			result += alphabet.charAt(random.nextInt(alphabet.length()));

		result += "-" + (month < 10 ? "0" + month : month) + "" + (day < 10 ? "0" + day : day);

		return result;
	}
}
