package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.TicketingDTO;

public class TicketingDAO {
	private static TicketingDAO instance = null;

	public static TicketingDAO getInstance() {
		if (instance == null) {
			instance = new TicketingDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int ticketing(TicketingDTO dto) throws Exception {
		String sql = "insert into ticketing values(ticketing_seq.nextval,?,?,?,sysdate)";
		try (Connection con = this.getConnection(); 
			 PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, dto.getEmail());
			pstat.setInt(2, dto.getPerformSeq());
			pstat.setString(3, dto.getPerformTitle());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public int getSeq() throws Exception {
		String sql = "select ticketing_seq.nextval from dual";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
}
