
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.AlertRepository;
import domain.Alert;

@Component
@Transactional
public class StringToAlertConverter implements Converter<String, Alert> {

	@Autowired
	AlertRepository	alertRepository;


	@Override
	public Alert convert(final String text) {
		Alert result;
		int id;

		try {
			id = Integer.valueOf(text);
			result = this.alertRepository.findOne(id);
		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}

}
