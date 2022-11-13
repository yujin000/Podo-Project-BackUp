package DTO;

import java.sql.Timestamp;

public class TicketingDTO {
	private int ticketSeq;
	private String email;
	private int performSeq;
	private String performTitle;
	private Timestamp ticketDate;
	public TicketingDTO() {
		
	}
	public TicketingDTO(int ticketSeq, String email, int performSeq, String performTitle, Timestamp ticketDate) {
		super();
		this.ticketSeq = ticketSeq;
		this.email = email;
		this.performSeq = performSeq;
		this.performTitle = performTitle;
		this.ticketDate = ticketDate;
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
	public Timestamp getTicketDate() {
		return ticketDate;
	}
	public void setTicketDate(Timestamp ticketDate) {
		this.ticketDate = ticketDate;
	}
}
