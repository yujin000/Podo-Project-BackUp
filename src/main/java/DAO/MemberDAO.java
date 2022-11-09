package DAO;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
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
		String sql = "insert into member values(?,?,'basic',null,sysdate,null,?,?,?)";

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
	
	public String getUserEmail(String email) throws Exception {
		 String sql =
				 "select email from member where email = ?"; 
				 try (Connection con =
				 this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql); )
				 {
				 pstat.setString(1, email); 
				 
				 try(ResultSet rs =pstat.executeQuery();){ 
					 rs.next();
					 return rs.getString("email"); 
					 } } 
    }
	
	   public boolean getUserEmailChecked(String email) throws Exception { 
		   //사용자 이메일 검증, 검증 없이 사용하지 못하게 할것이기 때문에 이 함수가 필요
		   String sql =
					 "select emailchecked from member where email = ?"; 
					 try (Connection con =
					 this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql); )
					 {
					 pstat.setString(1, email); 
					 
					ResultSet rs =pstat.executeQuery();
						 rs.next();
						 return rs.getBoolean(1); 
						  } 
          }
	   
	   public int setUserEmailChecked(String email) throws Exception{ //이메일 인증을 완료해주는 함수
           String sql = "UPDATE member SET emailchecked = true WHERE email = ?";    
           try (Connection con =
					 this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql); )
					 {          
               pstat.setString(1, email);
               int result = pstat.executeUpdate();
               
               con.commit();
               con.close();
				 return result;
           
           }
      
          }          
	public boolean emailDupleCheck(String email) throws Exception{
		String sql = "select * from member where email =?";
		
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, email);
			ResultSet rs = pstat.executeQuery();
				return rs.next();
			
		}
		
	}
	
	public String naverMailSend(String email) throws Exception{
		String key = codeMaker();
		
		// mail server 설정
		String host = "smtp.naver.com";
		String user = "wjdxorrn";// 자신의  계정
		String password = "wjd3669!";// 자신의  패스워드
		
		// 메일 받을 주소
		System.out.println("inputedEmail : " + email);
		
		// SMTP 서버 정보를 설정한다.
		 Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", 587);
	        props.put("mail.smtp.auth", "true");
	        
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });
		
	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

	            // 메일 제목
	            message.setSubject("PODO SOUND 인증번호");

	            // 메일 내용
	            message.setText("인증번호"+key);

	            // send the message
	            Transport.send(message);
	            System.out.println("Success Message Send");
	            

	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
	        return key;
	}
	public String codeMaker() {
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
		System.out.println(authCode);
		
		return authCode;
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
					dto.setEamil(rs.getString("email"));
					dto.setPw(rs.getString("pw"));
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
	
	
	public int update(MemberDTO dto) throws Exception {
		String sql = "update member set pw=?, profileimg=?, nickname=?, phone=? where email=? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, getSHA512(dto.getPw()));
			pstat.setString(2, dto.getProfileImg());
			pstat.setString(3, dto.getNickname());
			pstat.setString(4, dto.getPhone());
			pstat.setString(5, dto.getEamil());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int delete(String email) throws Exception {
		String sql = "delete from member where email=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

}
