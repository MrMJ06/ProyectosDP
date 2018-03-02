
package controllers.manager;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

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
import services.LusitService;
import services.TripService;
import controllers.AbstractController;
import domain.Lusit;
import domain.Manager;
import domain.Trip;

@Controller
@RequestMapping("/lusit/manager")
public class LusitManagerController extends AbstractController {

	@Autowired
	private LusitService	lusitService;

	@Autowired
	private ActorService	actorService;

	@Autowired
	private TripService		tripService;


	// Listing ---------------------------------------------------------------		

	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView result;

		result = new ModelAndView("lusit/list");

		final Manager actor = (Manager) this.actorService.findActorByPrincipal();
		Collection<Lusit> lusits = new ArrayList<Lusit>();
		final Collection<Trip> trips = new ArrayList<Trip>();

		lusits = actor.getLusits();
		for (final Lusit a : lusits)
			trips.add(this.lusitService.findTripByAlert(a));

		result.addObject("lusits", lusits);
		result.addObject("trips", trips);
		return result;
	}
	// Editing ---------------------------------------------------------------	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int lusitId) {
		ModelAndView result;
		Lusit alert;
		Trip trip;
		try {
			alert = this.lusitService.findOne(lusitId);
			trip = this.lusitService.findTripByAlert(alert);
			Assert.isTrue(alert.getMoment() != null && alert.getMoment().after(new Date()));
			result = this.createEditModelAndView(alert);
			result.addObject("tripId", trip.getId());
		} catch (final Throwable oops) {
			result = new ModelAndView("redirect:/misc/index.do");

		}

		return result;
	}
	// Saving -------------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView reject(@RequestParam final int tripId, @Valid final Lusit lusit, final BindingResult binding) {
		ModelAndView result;
		Trip trip;
		Manager manager;

		if (binding.hasErrors()) {
			result = this.createEditModelAndView(lusit, "application.params.error");
			result.addObject("tripId", tripId);
		} else
			try {
				manager = (Manager) this.actorService.findActorByPrincipal();
				trip = this.tripService.findOne(tripId);
				Assert.isTrue(trip.getManagers().contains(manager));
				Assert.isTrue(lusit.getMoment() == null || lusit.getMoment().after(new Date()), "The moment must be in future");
				Assert.isTrue(lusit.getTitle().length() <= 100, "Title too long");
				Assert.isTrue(lusit.getDescription().length() <= 250, "Description too long");
				this.lusitService.save(lusit, trip);
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				if (oops.getMessage().contains("The moment must be in future"))
					result = this.createEditModelAndView(lusit, "lusit.future.error");
				else if (oops.getMessage().contains("Title too long"))
					result = this.createEditModelAndView(lusit, "lusit.title.error");
				else if (oops.getMessage().contains("Description too long"))
					result = this.createEditModelAndView(lusit, "lusit.description.error");
				else
					result = this.createEditModelAndView(lusit, "lusit.commit.error");
				result.addObject("tripId", tripId);
			}

		return result;
	}

	// Deleting ------------------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(final Lusit lusit, final BindingResult binding) {
		ModelAndView result;

		try {
			this.lusitService.delete(lusit);
			result = new ModelAndView("redirect:list.do");

		} catch (final Throwable oops) {
			result = this.createEditModelAndView(lusit, "lusit.commit.error");
		}

		return result;
	}

	// Creating -----------------------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int tripId) {
		ModelAndView result;
		Lusit lusit;
		Trip trip;
		Manager manager;
		try {
			trip = this.tripService.findOne(tripId);
			manager = (Manager) this.actorService.findActorByPrincipal();
			Assert.isTrue(trip.getManagers().contains(manager));
			Assert.isTrue(trip.getStartDate().after(new Date()));
			lusit = this.lusitService.create();
			result = this.createEditModelAndView(lusit);
			result.addObject("tripId", tripId);
		} catch (final Throwable oops) {
			result = new ModelAndView("redirect:/misc/index.do");
		}
		return result;
	}
	// Ancillary methods ---------------------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Lusit lusit) {
		ModelAndView result;

		result = this.createEditModelAndView(lusit, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Lusit lusit, final String messageCode) {
		ModelAndView result;

		result = new ModelAndView("lusit/edit");

		result.addObject("lusit", lusit);
		result.addObject("message", messageCode);

		return result;
	}

}
