package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.MusicDTO;
import DTO.PayGoodsDTO;

public class PayGoodsDAO {
	private static PayGoodsDAO instance;

	public synchronized static PayGoodsDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new PayGoodsDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public List<PayGoodsDTO> selectAll()throws Exception{
		String sql = "select * from paygoods order by payGoodsSeq";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			List <PayGoodsDTO> payGoodsList = new ArrayList<>(); 
			while(rs.next()) {
				PayGoodsDTO dto = new PayGoodsDTO();
				dto.setPayGoodsSeq(rs.getInt("payGoodsSeq"));
				dto.setPayGoodsName(rs.getString("payGoodsName"));
				dto.setPayGoodsPrice(rs.getInt("payGoodsPrice"));
				dto.setPayGoodsExp(rs.getString("payGoodsExp"));
				dto.setPayGoodsType(rs.getString("payGoodsType"));
				dto.setPayGoodsInfo(rs.getString("payGoodsInfo"));
				payGoodsList.add(dto);
			}
			return payGoodsList;
		}
	}
	
	public int update(String payGoodsName, int payGoodsPrice, String payGoodsExp, String payGoodsType, String payGoodsInfo, int payGoodsSeq)throws Exception{
		String sql = "update paygoods set payGoodsName = ?, payGoodsPrice = ?, payGoodsExp = ?, payGoodsType = ?, payGoodsInfo = ? where payGoodsSeq = ?";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, payGoodsName);
			pstat.setInt(2, payGoodsPrice);
			pstat.setString(3, payGoodsExp);
			pstat.setString(4, payGoodsType);
			pstat.setString(5, payGoodsInfo);
			pstat.setInt(6, payGoodsSeq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int delete(int payGoodsSeq) throws Exception {
		String sql = "delete from paygoods where payGoodsSeq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, payGoodsSeq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int addProducts(PayGoodsDTO dto) throws Exception {
		String sql = "insert into paygoods values(payGoodsSeq.nextval,?,?,?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, dto.getPayGoodsName());
			pstat.setInt(2, dto.getPayGoodsPrice());
			pstat.setString(3, dto.getPayGoodsExp());
			pstat.setString(4, dto.getPayGoodsType());
			pstat.setString(5, dto.getPayGoodsInfo());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
