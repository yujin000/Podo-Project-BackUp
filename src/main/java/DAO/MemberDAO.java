package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	public int signup(String email,	String pw, 
	  String nickname,String name,
	 int phone
			) throws Exception {
		String sql = "insert into member values(?,?,'기본등급',null,sysdate,null,?,?,?)";

		try(	Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);) {
					
				pstat.setString(1, email);
				pstat.setString(2, pw);
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
	
	public boolean login() {
		return false; 
	}
	
	public boolean emailCheck() {
		return false;
	}
	
}
