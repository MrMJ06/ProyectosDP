
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Lusit extends DomainEntity {

	// Attributes -------------------------------------------------------------
	private String	ticker;
	private String	title;
	private String	description;
	private int		gauge;
	private Date	moment;


	@NotBlank
	@Pattern(regexp = "^[0-9]{2}-\\w{2}\\w{2}-(0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01])$")
	@Column(unique = true)
	public String getTicker() {
		return this.ticker;
	}

	public void setTicker(final String ticker) {
		this.ticker = ticker;
	}

	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotBlank
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	@Range(min = 0, max = 3)
	public int getGauge() {
		return this.gauge;
	}

	public void setGauge(final int gauge) {
		this.gauge = gauge;
	}

	//@Future
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getMoment() {
		return this.moment;
	}

	public void setMoment(final Date moment) {
		this.moment = moment;
	}

}
