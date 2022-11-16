package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collections;

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
	
	// 회원별 멤버십 구매 이력
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
	// 멤버십 구매시 vip등급으로 조정
	public int updateMembershipStatus(String email)throws Exception{
		String sql = "update member set membership = 'VIP' where email = ? ";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	} 
	
	// 환불 시 등급 user로 변경
	public int refund(String email)throws Exception{
		String sql = "update member set membership = 'basic' where email = ? ";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	} 
	
	// 환불 시 paymember테이블에서 기존 이력 삭제
	public int refundDelete(String email)throws Exception{
		String sql = "delete paymember where paymemberemail = ?";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	} 
	
	// 현재 멤버십 조회
	public boolean isVipExist(String email)throws Exception{
		String sql = "select membership from member where email = ? ";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			
			ResultSet rs = pstat.executeQuery();
			return rs.next();
		}
	}
	
	// 마이페이지 이용중인 이용권
	public String myPass(String email)throws Exception{
		String sql = "select paygoodsname from paygoods where paygoodsseq = (select paygoodsseq from paymember where paymemberemail = ?)";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			ResultSet rs = pstat.executeQuery();
			String result = null;
			if(rs.next()) {
				result = rs.getString("payGoodsName");
			}else{
				result = null;
			};
			return result;
		}
	}
	
}
