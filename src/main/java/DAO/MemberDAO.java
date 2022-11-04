package DAO;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	private static MemberDAO instance;
	
	public synchronized static MemberDAO getInstance() throws Exception {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
		
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
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
	
	public int signup(String email,	String pw, 
	  String nickname,String name,
	 int phone
			) throws Exception {
		String sql = "insert into member values(?,?,'basic',null,sysdate,null,?,?,?,null,1)";

		try(	Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);) {
					
				pstat.setString(1, email);
				pstat.setString(2, getSHA512(pw));
				pstat.setString(3, nickname);
				pstat.setString(4,name);
				pstat.setInt(5, phone);
					
					
				int result = pstat.executeUpdate();
				con.commit();
				con.close();
				return result;
			} 
		
	}
	public int delete() {
		return 0;
	}
	public int update() {
		return 0;
	}
	public int mypage() {
		return 0;
	}
	
	public boolean login(String email, String pw) throws Exception{
		String sql = "select * from member where email=? and pw=?";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1,email);
			pstat.setString(2,getSHA512(pw));
			
			System.out.println(email+pw);
			ResultSet rs = pstat.executeQuery();
			return rs.next();
				
				}
			}
		
	public String getNick(String email) throws Exception{
		String sql = "select * from member where email = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, email);
			System.out.println(email);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getString("nickname");
			}
		}
	}
	
	
		
	public boolean emailCheck() {
		return false;
	}
	
}
