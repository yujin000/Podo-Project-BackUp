package DTO;

import java.sql.Timestamp;

public class PerformanceDTO {
	private int performSeq;
	private String theaterSeq;
	private String performTitle;
	private String poster;
	private int showtime;
	private Timestamp startDate;
	private Timestamp endDate;
	private String performPrice;

	public PerformanceDTO() {

	}

	public PerformanceDTO(int performSeq, String theaterSeq, String performTitle, String poster, int showtime,
			Timestamp startDate, Timestamp endDate, String performPrice) {
		super();
		this.performSeq = performSeq;
		this.theaterSeq = theaterSeq;
		this.performTitle = performTitle;
		this.poster = poster;
		this.showtime = showtime;
		this.startDate = startDate;
		this.endDate = endDate;
		this.performPrice = performPrice;
	}

	public int getPerformSeq() {
		return performSeq;
	}

	public void setPerformSeq(int performSeq) {
		this.performSeq = performSeq;
	}

	public String getTheaterSeq() {
		return theaterSeq;
	}

	public void setTheaterSeq(String theaterSeq) {
		this.theaterSeq = theaterSeq;
	}

	public String getPerformTitle() {
		return performTitle;
	}

	public void setPerformTitle(String performTitle) {
		this.performTitle = performTitle;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getShowtime() {
		return showtime;
	}

	public void setShowtime(int showtime) {
		this.showtime = showtime;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public String getPerformPrice() {
		return performPrice;
	}

	public void setPerformPrice(String performPrice) {
		this.performPrice = performPrice;
	}
}
