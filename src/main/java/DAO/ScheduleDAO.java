package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.ScheduleDTO;

public class ScheduleDAO {
	private static ScheduleDAO instance;

	public synchronized static ScheduleDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new ScheduleDAO();
		}
		return instance;

	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public List<ScheduleDTO> selectSchedule(int performSeq) throws Exception {
		String sql = "select * from schedule where performSeq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, performSeq);
			try (ResultSet rs = pstat.executeQuery();) {
				List<ScheduleDTO> slist = new ArrayList<>();
				while (rs.next()) {
					ScheduleDTO dto = new ScheduleDTO();
					dto.setScheDate(rs.getString("scheDate"));
					dto.setScheTime(rs.getString("scheTime"));
					slist.add(dto);
				}
				return slist;
			}
		}
	}
}
