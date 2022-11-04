package DTO;

public class MusicDTO {
	int musicSeq;
	String musicName;
	String musicArtist;
	String musicAlbum;
	String musicImg;
	String musicMp3;
	int musicChart;
	String musicgenre;
	String musicLylics;
	
	public MusicDTO() {}
	public MusicDTO(int musicSeq, String musicName, String musicArtist, String musicAlbum, String musicImg,
			String musicMp3, int musicChart, String musicgenre, String musicLylics) {
		super();
		this.musicSeq = musicSeq;
		this.musicName = musicName;
		this.musicArtist = musicArtist;
		this.musicAlbum = musicAlbum;
		this.musicImg = musicImg;
		this.musicMp3 = musicMp3;
		this.musicChart = musicChart;
		this.musicgenre = musicgenre;
		this.musicLylics = musicLylics;
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
	public String getMusicImg() {
		return musicImg;
	}
	public void setMusicImg(String musicImg) {
		this.musicImg = musicImg;
	}
	public String getMusicMp3() {
		return musicMp3;
	}
	public void setMusicMp3(String musicMp3) {
		this.musicMp3 = musicMp3;
	}
	public int getMusicChart() {
		return musicChart;
	}
	public void setMusicChart(int musicChart) {
		this.musicChart = musicChart;
	}
	public String getMusicgenre() {
		return musicgenre;
	}
	public void setMusicgenre(String musicgenre) {
		this.musicgenre = musicgenre;
	}
	public String getMusicLylics() {
		return musicLylics;
	}
	public void setMusicLylics(String musicLylics) {
		this.musicLylics = musicLylics;
	}	
}
