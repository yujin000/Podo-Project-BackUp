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
	
	public int saleSeat(int seatSeq) throws Exception {
		String sql = "update seat set saleState = where seatSeq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seatSeq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public SeatDTO seatDetail(int seatSeq) throws Exception {
		String sql = "select * from seat where seatSeq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seatSeq);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				SeatDTO dto = new SeatDTO();
				dto.setTheaterSeq(rs.getInt("theaterSeq"));
				dto.setSeatRow(rs.getString("seatRow"));
				dto.setSeatNum(rs.getInt("seatNum"));
				dto.setSaleState(rs.getString("saleState"));
				return dto;
			}
		}
	}
}
