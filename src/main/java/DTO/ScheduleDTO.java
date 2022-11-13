package DTO;

public class ScheduleDTO {
	private int scheduleSeq;
	private int performSeq;
	private String scheDate;
	private String scheTime;

	public ScheduleDTO() {

	}

	public ScheduleDTO(int scheduleSeq, int performSeq, String scheDate, String scheTime) {
		super();
		this.scheduleSeq = scheduleSeq;
		this.performSeq = performSeq;
		this.scheDate = scheDate;
		this.scheTime = scheTime;
	}

	public int getScheduleSeq() {
		return scheduleSeq;
	}

	public void setScheduleSeq(int scheduleSeq) {
		this.scheduleSeq = scheduleSeq;
	}

	public int getPerformSeq() {
		return performSeq;
	}

	public void setPerformSeq(int performSeq) {
		this.performSeq = performSeq;
	}

	public String getScheDate() {
		return scheDate;
	}

	public void setScheDate(String scheDate) {
		this.scheDate = scheDate;
	}

	public String getScheTime() {
		return scheTime;
	}

	public void setScheTime(String scheTime) {
		this.scheTime = scheTime;
	}

}
