package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.PerformanceDTO;

public class PerformanceDAO {

	private static PerformanceDAO instance;

	public synchronized static PerformanceDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new PerformanceDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public List<PerformanceDTO> selectPerform() throws Exception {
		String sql = "select * from performance";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery(sql);) {

			List<PerformanceDTO> result = new ArrayList<PerformanceDTO>();

			while (rs.next()) {
				PerformanceDTO dto = new PerformanceDTO();
				dto.setPerformSeq(rs.getInt("performSeq"));
				dto.setPerformTitle(rs.getString("performTitle"));
				dto.setTheaterName(rs.getString("theaterName"));
				dto.setPoster(rs.getString("poster"));
				dto.setStartDate(rs.getTimestamp("startDate"));
				dto.setEndDate(rs.getTimestamp("endDate"));
				result.add(dto);
			}
			return result;
		}
	}

	public PerformanceDTO selectDetail(int performSeq) throws Exception {
		String sql = "select * from performance where performSeq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, performSeq);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				PerformanceDTO dto = new PerformanceDTO();
				dto.setPerformTitle(rs.getString("performTitle"));
				dto.setTheaterName(rs.getString("TheaterName"));
				dto.setStartDate(rs.getTimestamp("startDate"));
				dto.setEndDate(rs.getTimestamp("endDate"));
				dto.setShowtime(rs.getInt("showtime"));
				dto.setPoster(rs.getString("poster"));
				dto.setRating(rs.getString("rating"));
				dto.setGenre(rs.getString("genre"));
				dto.setPerformPoster(rs.getString("performPoster"));
				return dto;
			}
		}
	}
}
