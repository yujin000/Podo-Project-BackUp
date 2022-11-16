package DAO;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.MemberDTO;

public class MemberDAO {

	private static MemberDAO instance;

	public synchronized static MemberDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new MemberDAO();
		}
		return instance;

	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public static String getSHA512(String input) {
		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toReturn;
	}

	public int signup(String email, String pw, String nickname, String name, String phone) throws Exception {
		String sql = "insert into member values(?,?,'basic',null,sysdate,'profile-default.jpg',?,?,?)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, email);
			pstat.setString(2, getSHA512(pw));
			pstat.setString(3, nickname);
			pstat.setString(4, name);
			pstat.setString(5, phone);

			int result = pstat.executeUpdate();
			con.commit();
			con.close();
			return result;
		}

	}
      
              
	public boolean emailDupleCheck(String email) throws Exception{
		// 이메일 중복체크
		String sql = "select * from member where email =?";
		
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, email);
			ResultSet rs = pstat.executeQuery();
				return rs.next();
			
		}
		
	}
	
	public String MailSender(String email) throws Exception{
	
		// gmail smtp 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // g메일 연결
		props.put("mail.smtp.port", "587"); // port 번호
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // protocols 없을시 오류
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("dnfqh98@gmail.com", "edzofkldspdupiko");
				// gmail id , gmail app password 
			} 
		});
		String key = codeMaker(); // 인증번호 생성
		String receiver = email; // 메일 받을 주소
		String title = "podo music 인증번호";
		String content = "<h2 style='color:blue'>"+"인증번호:"+key+"</h2>";
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("dnfqh98@gmail.com", "관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html; charset=utf-8");

			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return key; // 인증번호 호출
	}
	public String codeMaker() {
		// 인증번호 생성 코드
		String authCode = null;
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		
		authCode = temp.toString();
		
		return authCode;
	}
	// 비밀번호 찾기 시 임시비밀번호 전송 
	public String newPassword(String email) throws Exception{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("dnfqh98@gmail.com", "edzofkldspdupiko");
			}
		});
		String key = codeMaker();
		String receiver = email; // 메일 받을 주소
		String title = "podo music 임시비밀번호";
		String content = "<h2 style='color:blue'>"+"임시비밀번호:"+key+"</h2>";
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("dnfqh98@gmail.com", "관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html; charset=utf-8");

			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return key;
	}

	// 이메일 인증 메일 전송
	public void signupMail(String email, String nickname) throws Exception{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("dnfqh98@gmail.com", "edzofkldspdupiko");
			}
		});
		String receiver = email; // 메일 받을 주소
		String title = "podo music 가입을 축하드립니다!";
		String content = "<h2 style='color:blue'>"+nickname+"님 회원가입을 축하합니다!"+"</h2>";
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("dnfqh98@gmail.com", "관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html; charset=utf-8");

			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}

	public boolean login(String email, String pw) throws Exception {
		String sql = "select * from member where email=? and pw=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			pstat.setString(2, getSHA512(pw));

			ResultSet rs = pstat.executeQuery();
			return rs.next();

		}
	}

	
	// Mypage 닉네임, 멤버십, 구독기간 정보 불러오기
		public MemberDTO getMypage(String email) throws Exception {
			String sql = "select * from member where email = ?";
			try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				pstat.setString(1, email);

				try (ResultSet rs = pstat.executeQuery();) {
					rs.next();
					MemberDTO dto = new MemberDTO();

					dto.setEmail(rs.getString("email"));
					dto.setMembership(rs.getString("membership"));
					dto.setScribeDate(rs.getTimestamp("scribeDate"));
					dto.setProfileImg(rs.getString("profileimg"));
					dto.setNickname(rs.getString("nickname"));
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					return dto;
				}
			}
		}
	
	//회원 정보 수정 sql
	public int update(MemberDTO dto) throws Exception {
		String sql = "update member set profileimg=?, nickname=?, phone=? where email=? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setString(1, dto.getProfileImg());
			pstat.setString(2, dto.getNickname());
			pstat.setString(3, dto.getPhone());
			pstat.setString(4, dto.getEmail());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//프로필 이미지 삭제 시 회원 정보 수정 sql
	public int delUpdate(MemberDTO dto) throws Exception {
		String sql = "update member set profileimg=?, nickname=?, phone=? where email=? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getProfileImg());
			pstat.setString(2, dto.getNickname());
			pstat.setString(3, dto.getPhone());
			pstat.setString(4, dto.getEmail());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int updatePw(String email, String pw) throws Exception {
		String sql = "update member set pw=? where email=? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, getSHA512(pw));
			pstat.setString(2, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int startMemberShip(String email) throws Exception {
		String sql = "update member set membership=vip ,scribedate = sysdate where email=? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
		
	}
	
	//회원 탈퇴
	public int delete(String email) throws Exception {
		String sql = "delete from member where email=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	

	//현재 비밀번호 일치하는지 찾는 sql
	public boolean selectPw(String email, String pw) throws Exception{
	      String sql="select * from member where email=? and pw=?";
	      try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
	         pstat.setString(1, email);
	         pstat.setString(2, getSHA512(pw));

			 ResultSet rs = pstat.executeQuery();
			 return rs.next();
	      }
	   }
	
	//비밀번호 수정 sql
	public int modifyPw(String email, String pw) throws Exception {
		String sql = "update member set pw=? where email=? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, getSHA512(pw));
			pstat.setString(2, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<MemberDTO> selectAllMember(int start, int end) throws Exception {
		String sql = "select * from (select member.*, row_number() over(order by joinDate desc) rn from member) where rn between ? and ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			
			ResultSet rs = pstat.executeQuery();
			List<MemberDTO> memberList = new ArrayList<>();
			
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setEmail(rs.getString("email"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setMembership(rs.getString("membership"));
				dto.setNickname(rs.getString("nickname"));
				dto.setScribeDate(rs.getTimestamp("scribeDate"));
				dto.setJoinDate(rs.getTimestamp("joinDate"));
				memberList.add(dto);
			}
			
			return memberList;
		}
	}
	
	public int getMemberCount() throws Exception {
		String sql = "select count(*) from member";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
	
	public String getPageNavi(int currentPage, int rcpp, int ncpp) throws Exception {
		int recordTotalCount = this.getMemberCount();
		int recordCountPerPage = rcpp;
		int naviCountPerPage = ncpp;
				
		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;			
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		
		int endNavi = startNavi + naviCountPerPage - 1;
		
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
				
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
			
		StringBuilder sb = new StringBuilder();
		
		if (needPrev) {
			sb.append("<a href='/list.member?cpage="+(startNavi-1)+"'> < </a> ");
		}
		
		for (int i=startNavi; i<=endNavi; i++) {
			sb.append("<a href='/list.member?cpage=" + i + "'>" + i + "</a> ");
		}
		
		if (needNext) {
			sb.append("<a href='/list.member?cpage=" + (endNavi+1) + "'> > </a>");
		}
		
		return sb.toString();
	}
	
	// 현재 회원 수 추출
	public int memberCount()throws Exception{
		String sql = "select count(*) from member";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			int result = 0;
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}else{
				result = 0;
			};
			return result;
		}
	}

}
