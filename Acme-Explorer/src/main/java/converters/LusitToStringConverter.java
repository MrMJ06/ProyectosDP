
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.Lusit;

@Component
@Transactional
public class LusitToStringConverter implements Converter<Lusit, String> {

	@Override
	public String convert(final Lusit lusit) {
		String result;

		if (lusit == null)
			result = null;
		else
			result = String.valueOf(lusit.getId());

		return result;
	}

}
