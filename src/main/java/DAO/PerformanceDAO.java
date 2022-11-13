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

import DTO.MusicDTO;
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
	
	public int deletePerform(int seq) throws Exception {
		String sql = "delete from performance where performSeq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int updatePerform(String theaterName, String performTitle, int showtime, Timestamp startDate, Timestamp endDate,String performPrice,String rating,String genre,int seq)
			throws Exception {
		String sql = "update performance set theaterName = ?, performTitle = ?, showtime = ?, startDate = ? ,endDate = ?, performPrice=?, rating=?, genre=? where performSeq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, theaterName);
			pstat.setString(2, performTitle);
			pstat.setInt(3, showtime);
			pstat.setTimestamp(4, startDate);
			pstat.setTimestamp(5, endDate);
			pstat.setString(6, performPrice);
			pstat.setString(7, rating);
			pstat.setString(8, genre);
			pstat.setInt(9, seq);
			System.out.println("dao : "+theaterName+performTitle+showtime+startDate+endDate+performPrice+rating+genre+seq);
			int result = pstat.executeUpdate();
			con.commit();
			System.out.println(result);
			return result;
		
		}
	}

	public int addPerform(PerformanceDTO dto) throws Exception {
		String sql = "insert into performance values(performance_seq.nextval,1,?,?,?,?,?,?,?,?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, dto.getTheaterName());
			pstat.setString(2, dto.getPerformTitle());
			pstat.setString(3, dto.getPoster());
			pstat.setInt(4, dto.getShowtime());
			pstat.setTimestamp(5, dto.getStartDate());
			pstat.setTimestamp(6, dto.getEndDate());
			pstat.setString(7, dto.getPerformPrice());
			pstat.setString(8, dto.getRating());
			pstat.setString(9, dto.getGenre());
			pstat.setString(10, dto.getPerformPoster());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public List<PerformanceDTO> selectAllPerform() throws Exception {
		String sql = "select * from performance";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery(sql);) {

			List<PerformanceDTO> result = new ArrayList<PerformanceDTO>();

			while (rs.next()) {
				PerformanceDTO dto = new PerformanceDTO();
				dto.setPerformSeq(rs.getInt("performSeq"));
				dto.setTheaterName(rs.getString("theaterName"));
				dto.setPerformTitle(rs.getString("performTitle"));
				dto.setTheaterName(rs.getString("theaterName"));
				dto.setPoster(rs.getString("poster"));
				dto.setShowtime(rs.getInt("showtime"));
				dto.setStartDate(rs.getTimestamp("startDate"));
				dto.setEndDate(rs.getTimestamp("endDate"));
				dto.setPerformPrice(rs.getString("performPrice"));
				dto.setRating(rs.getString("rating"));
				dto.setGenre(rs.getString("genre"));
				dto.setPerformPoster(rs.getString("performPoster"));
				result.add(dto);
			}
			return result;
		}
	}
}
