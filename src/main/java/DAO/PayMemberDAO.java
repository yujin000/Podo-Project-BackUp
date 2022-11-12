package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.PayMemberDTO;

public class PayMemberDAO {
	private static PayMemberDAO instance;

	public synchronized static PayMemberDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new PayMemberDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertPayStatus(PayMemberDTO dto) throws Exception {
		String sql = "insert into payMember values(?,?,sysdate)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, dto.getPayGoodsSeq());
			pstat.setString(2, dto.getPayMemberEmail());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int updateMembershipStatus(String email)throws Exception{
		String sql = "update member set membership = 'vip' where email = ? ";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	} 
}
