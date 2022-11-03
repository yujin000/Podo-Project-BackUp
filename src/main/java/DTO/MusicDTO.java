package MusicDTO;

public class MusicDTO {
	int musicSeq;
	String musicName;
	String musicArtist;
	String musicImg;
	String musicMp3;
	int musicChart;
	String musicgenre;
	String musicLilycs;
	
	public MusicDTO() {}
	public MusicDTO(int musicSeq, String musicName, String musicArtist, String musicImg, String musicMp3,
			int musicChart, String musicgenre, String musicLilycs) {
		super();
		this.musicSeq = musicSeq;
		this.musicName = musicName;
		this.musicArtist = musicArtist;
		this.musicImg = musicImg;
		this.musicMp3 = musicMp3;
		this.musicChart = musicChart;
		this.musicgenre = musicgenre;
		this.musicLilycs = musicLilycs;
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
	public String getMusicLilycs() {
		return musicLilycs;
	}
	public void setMusicLilycs(String musicLilycs) {
		this.musicLilycs = musicLilycs;
	}
	
	
	
	
}
