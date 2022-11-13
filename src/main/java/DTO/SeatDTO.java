package DTO;

public class SeatDTO {
	private int seatSeq;
	private int theaterSeq;
	private String seatRow;
	private int seatNum;
	private String saleState;
	
	public SeatDTO() {
		
	}

	public SeatDTO(int seatSeq, int theaterSeq, String seatRow, int seatNum, String saleState) {
		super();
		this.seatSeq = seatSeq;
		this.theaterSeq = theaterSeq;
		this.seatRow = seatRow;
		this.seatNum = seatNum;
		this.saleState = saleState;
	}

	public int getSeatSeq() {
		return seatSeq;
	}

	public void setSeatSeq(int seatSeq) {
		this.seatSeq = seatSeq;
	}

	public int getTheaterSeq() {
		return theaterSeq;
	}

	public void setTheaterSeq(int theaterSeq) {
		this.theaterSeq = theaterSeq;
	}

	public String getSeatRow() {
		return seatRow;
	}

	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}

	public String getSaleState() {
		return saleState;
	}

	public void setSaleState(String saleState) {
		this.saleState = saleState;
	}
	
}
