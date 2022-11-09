package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.CastDTO;


public class CastDAO {
	private static CastDAO instance;

	public synchronized static CastDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new CastDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public List<CastDTO> selectCast(int performSeq) throws Exception {
		String sql = "select * from cast where performSeq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, performSeq);
			try (ResultSet rs = pstat.executeQuery();) {
				List<CastDTO> result = new ArrayList<CastDTO>();
				while (rs.next()) {
				CastDTO cdto = new CastDTO();
				cdto.setCastSeq(rs.getInt("castSeq"));
				cdto.setCastSrc(rs.getString("castSrc"));
				cdto.setCastName(rs.getString("castName"));
				result.add(cdto);
				}
				return result;
			}
		}
	}
}
