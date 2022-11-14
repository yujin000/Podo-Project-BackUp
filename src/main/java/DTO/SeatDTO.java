package DTO;

public class SeatDTO {
	private int seatSeq;
	private int performSeq;
	private int seatNum;
	
	public SeatDTO() {
		
	}

	public SeatDTO(int seatSeq, int performSeq, int seatNum) {
		super();
		this.seatSeq = seatSeq;
		this.performSeq = performSeq;
		this.seatNum = seatNum;
	}

	public int getSeatSeq() {
		return seatSeq;
	}

	public void setSeatSeq(int seatSeq) {
		this.seatSeq = seatSeq;
	}

	public int getPerformSeq() {
		return performSeq;
	}

	public void setPerformSeq(int performSeq) {
		this.performSeq = performSeq;
	}

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}

	
	
	
}
