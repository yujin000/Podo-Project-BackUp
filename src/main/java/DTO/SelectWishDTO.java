package DTO;

public class SelectWishDTO {
	private WishDTO dtoWish;
	private String wishEmail;
	private int parentMusicSeq;
	private int musicSeq;
	private String musicName;
	private String musicArtist;
	private String musicAlbum;
	
	public SelectWishDTO() {}

	public WishDTO getDtoWish() {
		return dtoWish;
	}

	public void setDtoWish(WishDTO dtoWish) {
		this.dtoWish = dtoWish;
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

	public int getMusicSeq() {
		return musicSeq;
	}

	public void setMusicSeq(int musicSeq) {
		this.musicSeq = musicSeq;
	}

	public String getMusicName() {
		return musicName;
	}

	public void setMusicName(String musicName) {
		this.musicName = musicName;
	}

	public String getMusicArtist() {
		return musicArtist;
	}

	public void setMusicArtist(String musicArtist) {
		this.musicArtist = musicArtist;
	}

	public String getMusicAlbum() {
		return musicAlbum;
	}

	public void setMusicAlbum(String musicAlbum) {
		this.musicAlbum = musicAlbum;
	}

	public SelectWishDTO(WishDTO dtoWish, String wishEmail, int parentMusicSeq, int musicSeq, String musicName,
			String musicArtist, String musicAlbum) {
		super();
		this.dtoWish = dtoWish;
		this.wishEmail = wishEmail;
		this.parentMusicSeq = parentMusicSeq;
		this.musicSeq = musicSeq;
		this.musicName = musicName;
		this.musicArtist = musicArtist;
		this.musicAlbum = musicAlbum;
	}
}
