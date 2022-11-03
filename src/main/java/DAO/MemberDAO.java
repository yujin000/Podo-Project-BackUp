package DAO;

import java.sql.Connection;

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
	
	public int insert() {
		return 0;
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
