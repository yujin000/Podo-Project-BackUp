package DTO;

import java.sql.Timestamp;

public class MemberDTO {
	
	private String email;
	private String pw;
	private String membership;
	private Timestamp scribeDate;
	private Timestamp joinDate;
	private String profileImg;
	private String nickname;
	private String name;
	private String phone;
	
	public MemberDTO() {
	}
	
	public MemberDTO(String email, String pw, String membership, Timestamp scribeDate, Timestamp joinDate,
			String profileImg, String nickname, String name, String phone) {
		super();
		this.email = email;
		this.pw = pw;
		this.membership = membership;
		this.scribeDate = scribeDate;
		this.joinDate = joinDate;
		this.profileImg = profileImg;
		this.nickname = nickname;
		this.name = name;
		this.phone = phone;
	}


	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Timestamp getScribeDate() {
		return scribeDate;
	}
	public void setScribeDate(Timestamp scribeDate) {
		this.scribeDate = scribeDate;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
