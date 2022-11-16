package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.PerformanceDTO;
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
		String sql = "insert into ticketing values(ticketing_seq.nextval,?,?,?,?,?,?,?,sysdate)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, dto.getEmail());
			pstat.setInt(2, dto.getPerformSeq());
			pstat.setString(3, dto.getPerformTitle());
			pstat.setString(4, dto.getTheaterName());
			pstat.setString(5, dto.getPerformPrice());
			pstat.setInt(6, dto.getSeatNum());
			pstat.setString(7, dto.getRating());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public List<TicketingDTO> TicketingList(String email) throws Exception {
		String sql = "select * from ticketing t inner join performance p on t.performSeq=p.performSeq where email = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			try (ResultSet rs = pstat.executeQuery();) {

				List<TicketingDTO> result = new ArrayList<TicketingDTO>();

				while (rs.next()) {
					TicketingDTO dto = new TicketingDTO();
					dto.setTicketSeq(rs.getInt("ticketSeq"));
					dto.setPerformSeq(rs.getInt("performSeq"));
					dto.setPerformTitle(rs.getString("performTitle"));
					dto.setTheaterName(rs.getString("theaterName"));
					dto.setPerformPrice(rs.getString("performPrice"));
					dto.setSeatNum(rs.getInt("seatNum"));
					dto.setTicketDate(rs.getTimestamp("ticketDate"));
					dto.setRating(rs.getString("rating"));
					dto.setStartDate(rs.getTimestamp("startDate"));
					result.add(dto);
				}
				return result;
			}
		}
	}
	public int delete(int ticketSeq,int performSeq) throws Exception {
		String sql = "delete from ticketing where ticketSeq =? and performSeq =?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, ticketSeq);
			pstat.setInt(2, performSeq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
