
package controllers.manager;

import java.util.ArrayList;
import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.AlertService;
import services.TripService;
import controllers.AbstractController;
import domain.Alert;
import domain.Manager;
import domain.Trip;

@Controller
@RequestMapping("/alert/manager")
public class AlertManagerController extends AbstractController {

	@Autowired
	private AlertService	alertService;

	@Autowired
	private ActorService	actorService;

	@Autowired
	private TripService		tripService;


	// Listing ---------------------------------------------------------------		

	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView result;

		result = new ModelAndView("alert/list");

		final Manager actor = (Manager) this.actorService.findActorByPrincipal();
		Collection<Alert> alerts = new ArrayList<Alert>();

		alerts = actor.getAlerts();

		result.addObject("alerts", alerts);
		return result;
	}
	// Editing ---------------------------------------------------------------	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int alertId) {
		ModelAndView result;
		Alert alert;
		Trip trip;
		try {
			alert = this.alertService.findOne(alertId);
			trip = this.alertService.findTripByAlert(alert);
			result = this.createEditModelAndView(alert);
			result.addObject("tripId", trip.getId());
		} catch (final Throwable oops) {
			result = new ModelAndView("redirect:/misc/index.do");

		}

		return result;
	}
	// Saving -------------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView reject(@RequestParam final int tripId, @Valid final Alert alert, final BindingResult binding) {
		ModelAndView result;
		Trip trip;
		Manager manager;

		if (binding.hasErrors()) {
			result = this.createEditModelAndView(alert, "application.params.error");
			result.addObject("tripId", tripId);
		} else
			try {
				manager = (Manager) this.actorService.findActorByPrincipal();
				trip = this.tripService.findOne(tripId);
				Assert.isTrue(trip.getManagers().contains(manager));
				this.alertService.save(alert, trip);
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				result = this.createEditModelAndView(alert, "application.commit.error");
				result.addObject("tripId", tripId);
			}

		return result;
	}

	// Deleting ------------------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(final Alert alert, final BindingResult binding) {
		ModelAndView result;

		try {
			this.alertService.delete(alert);
			result = new ModelAndView("redirect:list.do");

		} catch (final Throwable oops) {
			result = this.createEditModelAndView(alert, "alert.commit.error");
		}

		return result;
	}

	// Creating -----------------------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int tripId) {
		ModelAndView result;
		Alert alert;
		Trip trip;
		Manager manager;
		try {
			trip = this.tripService.findOne(tripId);
			manager = (Manager) this.actorService.findActorByPrincipal();
			Assert.isTrue(trip.getManagers().contains(manager));
			alert = this.alertService.create();
			result = this.createEditModelAndView(alert);
			result.addObject("tripId", tripId);
		} catch (final Throwable oops) {
			result = new ModelAndView("redirect:/misc/index.do");
		}
		return result;
	}
	// Ancillary methods ---------------------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Alert alert) {
		ModelAndView result;

		result = this.createEditModelAndView(alert, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Alert alert, final String messageCode) {
		ModelAndView result;

		result = new ModelAndView("alert/edit");

		result.addObject("alert", alert);
		result.addObject("message", messageCode);

		return result;
	}

}