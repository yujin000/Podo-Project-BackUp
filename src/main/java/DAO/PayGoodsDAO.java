package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
		String sql = "select * from paygoods order by payGoodsNum";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			List <PayGoodsDTO> payGoodsList = new ArrayList<>(); 
			while(rs.next()) {
				PayGoodsDTO dto = new PayGoodsDTO();
				dto.setPayGoodsNum(rs.getInt("payGoodsNum"));
				dto.setPayGoodsName(rs.getString("payGoodsName"));
				dto.setPayGoodsPrice(rs.getInt("payGoodsPrice"));
				dto.setPayGoodsExp(rs.getString("payGoodsExp"));
				dto.setPayGoodsType(rs.getString("payGoodsType"));
				payGoodsList.add(dto);
			}
			return payGoodsList;
		}
	}
}
