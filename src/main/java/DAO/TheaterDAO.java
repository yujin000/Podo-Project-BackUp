package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import DTO.PerformanceDTO;
import DTO.TheaterDTO;

import javax.naming.Context;
import javax.naming.InitialContext;

public class TheaterDAO {
	private static TheaterDAO instance;
	
	public synchronized static TheaterDAO getInstance()throws Exception{
		if(instance == null) {
			instance = new TheaterDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
		}
	
	public TheaterDTO selectSeat(int performSeq) throws Exception {
		String sql = "select * from theater where performSeq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, performSeq);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				TheaterDTO dto = new TheaterDTO();
				
				dto.setTheaterSeq(rs.getInt("theaterSeq"));
				dto.setTheaterName(rs.getString("TheaterName"));
				dto.setSeatCount(rs.getInt("seatCount"));
				return dto;
			}
		}
	}
}
