package DTO;

import java.sql.Timestamp;

public class PerformanceDTO {
	private int performSeq;
	private int theterSeq;
	private String theaterName;
	private String performTitle;
	private String poster;
	private int showtime;
	private Timestamp startDate;
	private Timestamp endDate;
	private String performPrice;
	private String rating; 
	
	public PerformanceDTO() {

	}

	public PerformanceDTO(int performSeq, int theterSeq, String theaterName, String performTitle, String poster,
			int showtime, Timestamp startDate, Timestamp endDate, String performPrice, String rating) {
		super();
		this.performSeq = performSeq;
		this.theterSeq = theterSeq;
		this.theaterName = theaterName;
		this.performTitle = performTitle;
		this.poster = poster;
		this.showtime = showtime;
		this.startDate = startDate;
		this.endDate = endDate;
		this.performPrice = performPrice;
		this.rating = rating;
	}

	public int getPerformSeq() {
		return performSeq;
	}

	public void setPerformSeq(int performSeq) {
		this.performSeq = performSeq;
	}

	public int getTheterSeq() {
		return theterSeq;
	}

	public void setTheterSeq(int theterSeq) {
		this.theterSeq = theterSeq;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
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

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}
}