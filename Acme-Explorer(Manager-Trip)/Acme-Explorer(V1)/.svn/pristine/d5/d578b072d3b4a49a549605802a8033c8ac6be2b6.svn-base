
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CategoryService;
import domain.Category;

@Controller
@RequestMapping("/category")
public class CategoryController extends AbstractController {

	// Services ---------------------------------------------------

	@Autowired
	private CategoryService	categoryService;


	// Listing ----------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		final Collection<Category> categories;
		Category category, fatherCategory;

		try {
			categories = this.categoryService.getChildrenFromRoot();
			if (categories.size() > 0) {
				category = (Category) categories.toArray()[0];
				fatherCategory = category.getFatherCategory();
			} else
				fatherCategory = null;

			result = new ModelAndView("category/list");
			result.addObject("categories", categories);
			result.addObject("fatherCategory", fatherCategory);
		} catch (final Throwable oops) {
			result = new ModelAndView("redirect:/misc/403");
		}

		return result;
	}

	// listing children ----------------------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET, params = "categoryId")
	public ModelAndView list(@RequestParam final int categoryId) {
		ModelAndView result;
		final Collection<Category> categories;
		Category fatherCategory;

		try {
			fatherCategory = this.categoryService.findOne(categoryId);
			Assert.notNull(fatherCategory);
			categories = fatherCategory.getCategories();

			result = new ModelAndView("category/list");
			result.addObject("categories", categories);
			result.addObject("fatherCategory", fatherCategory);
		} catch (final Throwable oops) {
			result = new ModelAndView("redirect:/misc/403");
		}

		return result;
	}

}
