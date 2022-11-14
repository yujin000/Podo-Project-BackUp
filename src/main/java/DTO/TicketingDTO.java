package DTO;

import java.sql.Timestamp;

public class TicketingDTO {
	private int ticketSeq;
	private String email;
	private int performSeq;
	private String performTitle;
	private String theaterName;
	private String performPrice;
	private int seatNum;
	private Timestamp ticketDate;
	private String rating;
	
	public TicketingDTO() {
		
	}

	public TicketingDTO(int ticketSeq, String email, int performSeq, String performTitle, String theaterName,
			String performPrice, int seatNum, Timestamp ticketDate, String rating) {
		super();
		this.ticketSeq = ticketSeq;
		this.email = email;
		this.performSeq = performSeq;
		this.performTitle = performTitle;
		this.theaterName = theaterName;
		this.performPrice = performPrice;
		this.seatNum = seatNum;
		this.ticketDate = ticketDate;
		this.rating = rating;
	}

	public int getTicketSeq() {
		return ticketSeq;
	}

	public void setTicketSeq(int ticketSeq) {
		this.ticketSeq = ticketSeq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPerformSeq() {
		return performSeq;
	}

	public void setPerformSeq(int performSeq) {
		this.performSeq = performSeq;
	}

	public String getPerformTitle() {
		return performTitle;
	}

	public void setPerformTitle(String performTitle) {
		this.performTitle = performTitle;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public String getPerformPrice() {
		return performPrice;
	}

	public void setPerformPrice(String performPrice) {
		this.performPrice = performPrice;
	}

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}

	public Timestamp getTicketDate() {
		return ticketDate;
	}

	public void setTicketDate(Timestamp ticketDate) {
		this.ticketDate = ticketDate;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}
	
}
