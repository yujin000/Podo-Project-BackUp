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
	
	public List<PayGoodsDTO> selectNormalGoods()throws Exception{
		String sql = "select * from paygoods where paygoodstype='이용권' order by payGoodsSeq";
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
	
	public List<PayGoodsDTO> selectEventGoods()throws Exception{
		String sql = "select * from paygoods where paygoodstype='이벤트' order by payGoodsSeq";
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
	
	public List<PayGoodsDTO> selectPromotionGoods()throws Exception{
		String sql = "select * from paygoods where paygoodstype='프로모션' order by payGoodsSeq";
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
	
	
	// 프로모션 코드
	public int promoCode()throws Exception{
		String sql = "select paygoodsseq from (select rownum as num, paygoods.* from paygoods order by paygoodsname) where num = 3";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			int result = 0;
			if(rs.next()) {
				result = rs.getInt("paygoodsseq");
			}else{
				result = 0;
			};
			return result;
		}
	}
	
	// 프로모션 가격
	public int promoPrice()throws Exception{
		String sql = "select paygoodsPrice from paygoods where paygoodsseq = (select paygoodsseq from (select rownum as num, paygoods.* from paygoods order by paygoodsname) where num = 3)";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			int result = 0;
			if(rs.next()) {
				result = rs.getInt("paygoodsprice");
			}else{
				result = 0;
			};
			return result;
		}
	}
	
	// 프로모션 판매 갯수
	public int promoCount()throws Exception{
		String sql = "select count(*) from paymember where paygoodsseq = (select paygoodsseq from (select rownum as num, paygoods.* from paygoods order by paygoodsname) where num = 3)";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			int result = 0;
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}else{
				result = 0;
			};
			return result;
		}
	}
	
		// 이벤트1 코드
		public int event1Code()throws Exception{
			String sql = "select paygoodsseq from (select rownum as num, paygoods.* from paygoods order by paygoodsname) where num = 1";
			try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				ResultSet rs = pstat.executeQuery();
				int result = 0;
				if(rs.next()) {
					result = rs.getInt("paygoodsseq");
				}else{
					result = 0;
				};
				return result;
			}
		}
		
		// 이벤트1 가격
		public int event1Price()throws Exception{
			String sql = "select paygoodsPrice from paygoods where paygoodsseq = (select paygoodsseq from (select * from paygoods order by paygoodsname) where rownum = 1)";
			try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				ResultSet rs = pstat.executeQuery();
				int result = 0;
				if(rs.next()) {
					result = rs.getInt("paygoodsprice");
				}else{
					result = 0;
				};
				return result;
			}
		}
		
		// 이벤트1 판매 갯수
		public int event1Count()throws Exception{
			String sql = "select count(*) from paymember where paygoodsseq = (select paygoodsseq from (select * from paygoods  order by paygoodsname) where rownum = 1)";
			try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				ResultSet rs = pstat.executeQuery();
				int result = 0;
				if(rs.next()) {
					result = rs.getInt("count(*)");
				}else{
					result = 0;
				};
				return result;
			}
		}
	
		// 이벤트2 코드
		public int event2Code()throws Exception{
			String sql = "select paygoodsseq from (select rownum as num, paygoods.* from paygoods order by paygoodsname) where num = 2";
			try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				ResultSet rs = pstat.executeQuery();
				int result = 0;
				if(rs.next()) {
					result = rs.getInt("paygoodsseq");
				}else{
					result = 0;
				};
				return result;
			}
		}
		
		// 이벤트2 가격
		public int event2Price()throws Exception{
			String sql = "select paygoodsPrice from paygoods where paygoodsseq = (select paygoodsseq from (select rownum as num, paygoods.* from paygoods order by paygoodsname) where num = 2)";
			try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				ResultSet rs = pstat.executeQuery();
				int result = 0;
				if(rs.next()) {
					result = rs.getInt("paygoodsprice");
				}else{
					result = 0;
				};
				return result;
			}
		}
		
		// 이벤트2 판매 갯수
		public int event2Count()throws Exception{
			String sql = "select count(*) from paymember where paygoodsseq = (select paygoodsseq from (select * from paygoods  order by paygoodsname) where rownum = 2)";
			try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				ResultSet rs = pstat.executeQuery();
				int result = 0;
				if(rs.next()) {
					result = rs.getInt("count(*)");
				}else{
					result = 0;
				};
				return result;
			}
		}
	
}
