package DTO;

public class CastDTO {
	private int castSeq;
	private int performSeq;
	private String castSrc;
	private String castName;
	
	public CastDTO() {
		
	}
	
	public CastDTO(int castSeq, int performSeq, String castSrc, String castName) {
		super();
		this.castSeq = castSeq;
		this.performSeq = performSeq;
		this.castSrc = castSrc;
		this.castName = castName;
	}
	public int getCastSeq() {
		return castSeq;
	}
	public void setCastSeq(int castSeq) {
		this.castSeq = castSeq;
	}
	public int getPerformSeq() {
		return performSeq;
	}
	public void setPerformSeq(int performSeq) {
		this.performSeq = performSeq;
	}
	public String getCastSrc() {
		return castSrc;
	}
	public void setCastSrc(String castSrc) {
		this.castSrc = castSrc;
	}
	public String getCastName() {
		return castName;
	}
	public void setCastName(String castName) {
		this.castName = castName;
	}
}
