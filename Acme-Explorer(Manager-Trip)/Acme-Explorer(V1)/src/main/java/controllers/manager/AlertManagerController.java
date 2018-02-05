
package controllers.manager;

import java.util.ArrayList;
import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

		alerts = this.alertService.findAlertsByManager(actor);

		result.addObject("alerts", alerts);
		return result;
	}
	// Editing ---------------------------------------------------------------	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int alertId) {
		ModelAndView result;
		Alert alert;
		try {
			alert = this.alertService.findOne(alertId);
			result = this.createEditModelAndView(alert);
		} catch (final Throwable oops) {
			result = new ModelAndView("redirect:/misc/index.do");
		}

		return result;
	}
	// Saving -------------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView reject(@Valid final Alert alert, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(alert, "application.params.error");
		else
			try {
				this.alertService.save(alert);
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				result = this.createEditModelAndView(alert, "application.commit.error");
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
		final ModelAndView result;
		Alert alert;
		Trip trip;

		trip = this.tripService.findOne(tripId);

		alert = this.alertService.create(trip);

		result = this.createEditModelAndView(alert);

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