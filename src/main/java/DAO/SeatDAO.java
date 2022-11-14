package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.SeatDTO;

public class SeatDAO {
	private static SeatDAO instance = null;

	public static SeatDAO getInstance() {
		if (instance == null) {
			instance = new SeatDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}	
	
	public SeatDTO seatDetail(int performSeq) throws Exception {
		String sql = "select * from seat where performSeq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, performSeq);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				SeatDTO dto = new SeatDTO();
				dto.setSeatNum(rs.getInt("seatNum"));
				return dto;
			}
		}
	}
}
