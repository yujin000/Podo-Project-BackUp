package DTO;

public class WishDTO {
	String wishEmail;
	String parentMusicSeq;
	
	public WishDTO() {}
	public WishDTO(String wishEmail, String parentMusicSeq) {
		this.wishEmail = wishEmail;
		this.parentMusicSeq = parentMusicSeq;
	}
	public String getWishEmail() {
		return wishEmail;
	}
	public void setWishEmail(String wishEmail) {
		this.wishEmail = wishEmail;
	}
	public String getParentMusicSeq() {
		return parentMusicSeq;
	}
	public void setParentMusicSeq(String parentMusicSeq) {
		this.parentMusicSeq = parentMusicSeq;
	}		
}
