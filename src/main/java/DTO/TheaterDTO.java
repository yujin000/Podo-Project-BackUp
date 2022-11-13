package DTO;

public class TheaterDTO {
	private int theaterSeq;
	private int performSeq;
	private String theaterName;
	private int seatCount;

	public TheaterDTO() {

	}

	public TheaterDTO(int theaterSeq, int performSeq, String theaterName, int seatCount) {
		super();
		this.theaterSeq = theaterSeq;
		this.performSeq = performSeq;
		this.theaterName = theaterName;
		this.seatCount = seatCount;
	}

	public int getTheaterSeq() {
		return theaterSeq;
	}

	public void setTheaterSeq(int theaterSeq) {
		this.theaterSeq = theaterSeq;
	}

	public int getPerformSeq() {
		return performSeq;
	}

	public void setPerformSeq(int performSeq) {
		this.performSeq = performSeq;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public int getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(int seatCount) {
		this.seatCount = seatCount;
	}
}
