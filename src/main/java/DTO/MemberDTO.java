package DTO;

import java.sql.Timestamp;

public class MemberDTO {
	
	private String eamil;
	private String pw;
	private String membership;
	private Timestamp scribedate;
	private Timestamp joindate;
	private String profileimg;
	private String nickname;
	private String name;
	private int phone;
	private String emailHash;
	private boolean emailChecked;
	
	public MemberDTO() {
	}
	public MemberDTO(String eamil, String pw, String membership, Timestamp scribedate, Timestamp joindate,
			String profileimg, String nickname, String name, int phone, String emailHash, boolean emailChecked) {
		super();
		this.eamil = eamil;
		this.pw = pw;
		this.membership = membership;
		this.scribedate = scribedate;
		this.joindate = joindate;
		this.profileimg = profileimg;
		this.nickname = nickname;
		this.name = name;
		this.phone = phone;
		this.emailHash = emailHash;
		this.emailChecked = emailChecked;
	}
	public String getEamil() {
		return eamil;
	}
	public void setEamil(String eamil) {
		this.eamil = eamil;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMembership() {
		return membership;
	}
	public void setMembership(String membership) {
		this.membership = membership;
	}
	public Timestamp getScribedate() {
		return scribedate;
	}
	public void setScribedate(Timestamp scribedate) {
		this.scribedate = scribedate;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getEmailHash() {
		return emailHash;
	}
	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}
	public boolean isEmailChecked() {
		return emailChecked;
	}
	public void setEmailChecked(boolean emailChecked) {
		this.emailChecked = emailChecked;
	}

	
	
	
}
