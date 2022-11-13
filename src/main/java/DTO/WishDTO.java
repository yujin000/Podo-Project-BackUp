package DTO;

public class WishDTO {
	String wishEmail;
	int parentMusicSeq;
	
	public WishDTO() {}
	public WishDTO(String wishEmail, int parentMusicSeq) {
		this.wishEmail = wishEmail;
		this.parentMusicSeq = parentMusicSeq;
	}
	public String getWishEmail() {
		return wishEmail;
	}
	public void setWishEmail(String wishEmail) {
		this.wishEmail = wishEmail;
	}
	public int getParentMusicSeq() {
		return parentMusicSeq;
	}
	public void setParentMusicSeq(int parentMusicSeq) {
		this.parentMusicSeq = parentMusicSeq;
	}		
}
