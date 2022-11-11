package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.QnaBoardDTO;

public class QnaBoardDAO {
		private static QnaBoardDAO instance = null;
		
		public static QnaBoardDAO getInstance() {
			if (instance==null) {
				instance = new QnaBoardDAO();
			}
			return instance;
		}
		
		private Connection getConnection() throws Exception {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			return ds.getConnection();
		}
	
		public int insert(QnaBoardDTO dto) throws Exception{
			String sql = "insert into qnaBoard values(?,?,?,?,sysdate,?)";
			try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				pstat.setInt(1, dto.getQnaSeq());
				pstat.setString(2, dto.getQnaWriter());
				pstat.setString(3, dto.getQnaTitle());
				pstat.setString(4, dto.getQnaContents());
				pstat.setString(5, dto.getQnaCategory());
				int result = pstat.executeUpdate();
				con.commit();
				return result;
			}
		}
		
		public int getSeq() throws Exception {
			String sql = "select qnaSeq.nextval from dual";
			try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				ResultSet rs = pstat.executeQuery();
				rs.next();
				return rs.getInt(1);
			}
		}
		
		public int getRecordCount(String qnaWriter) throws Exception {
			String sql = "select count(*) from qnaBoard where qnaWriter=?";
			try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				pstat.setString(1, qnaWriter);
				try (ResultSet rs = pstat.executeQuery();) {
					rs.next();
					return rs.getInt(1);
				}
			}
		}
		
		public String getPageNavi(int currentPage, String qnaWriter) throws Exception {
			int recoredTotalCount = this.getRecordCount(qnaWriter); 
			int recordCountPerpage = 5; 
			int naviCountPerPage = 5; 

			int pageTotalCount = 0;
			if (recoredTotalCount % recordCountPerpage > 0) {
				pageTotalCount = (recoredTotalCount / recordCountPerpage) + 1;
			} else {
				pageTotalCount = recoredTotalCount / recordCountPerpage;
			}

			if (currentPage < 1) {
				currentPage = 1;
			} else if (currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}

			int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;

			int endNavi = startNavi + naviCountPerPage - 1;

			if (endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			} 
			boolean needPrev = true;
			boolean needNext = true;

			if (startNavi == 1) {
				needPrev = false;
			}
			if (endNavi == pageTotalCount) {
				needNext = false;
			}

			StringBuilder sb = new StringBuilder();

			if (needPrev) {
				sb.append("<a href='/list.board?cpage=" + (startNavi - 1) + "'><</a> ");
			}

			for (int i = startNavi; i <= endNavi; i++) {
				sb.append("<a href='/list.board?cpage=" + i + "'>" + i + "</a> ");
			}

			if (needNext) {
				sb.append("<a href='/list.board?cpage=" + (endNavi + 1) + "'>></a>");
			}
			return sb.toString();
		}
		
		public List<QnaBoardDTO> selectByRange(String qnaWriter, int start, int end) throws Exception {
			String sql = "select * from (select qnaBoard.*, row_number() over(order by qnaSeq desc) rn from qnaBoard) where qnaWriter=? and rn between ? and ?";
			try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				pstat.setString(1, qnaWriter);
				pstat.setInt(2, start);
				pstat.setInt(3, end);
				try (ResultSet rs = pstat.executeQuery();) {
					List<QnaBoardDTO> qna = new ArrayList<>();
					while (rs.next()) {
						QnaBoardDTO dto = new QnaBoardDTO();
						dto.setQnaSeq(rs.getInt("qnaSeq"));
						dto.setQnaWriter(rs.getString("qnaWriter"));
						dto.setQnaTitle(rs.getString("qnaTitle"));
						dto.setQnaContents(rs.getString("qnaContents"));
						dto.setQnaWriteDate(rs.getTimestamp("qnaWriteDate"));
						dto.setQnaCategory(rs.getString("qnaCategory"));
						qna.add(dto);
					}
					return qna;
				}
			}
		}
		
		public List<QnaBoardDTO> selectAll(int start, int end) throws Exception {
			String sql = "select * from (select qnaBoard.*, row_number() over(order by qnaSeq desc) rn from qnaBoard) where rn between ? and ?";
			try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				pstat.setInt(1, start);
				pstat.setInt(2, end);
				try (ResultSet rs = pstat.executeQuery();) {
					List<QnaBoardDTO> qna = new ArrayList<>();
					while (rs.next()) {
						QnaBoardDTO dto = new QnaBoardDTO();
						dto.setQnaSeq(rs.getInt("qnaSeq"));
						dto.setQnaWriter(rs.getString("qnaWriter"));
						dto.setQnaTitle(rs.getString("qnaTitle"));
						dto.setQnaContents(rs.getString("qnaContents"));
						dto.setQnaWriteDate(rs.getTimestamp("qnaWriteDate"));
						dto.setQnaCategory(rs.getString("qnaCategory"));
						qna.add(dto);
					}
					return qna;
				}
			}
		}
		
		public QnaBoardDTO isSelect(int qnaSeq) throws Exception {
			String sql = "select * from qnaBoard where qnaSeq=?";
			try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				pstat.setInt(1, qnaSeq);
				try (ResultSet rs = pstat.executeQuery();) {
					rs.next();
					QnaBoardDTO dtoDetail = new QnaBoardDTO();
					dtoDetail.setQnaTitle(rs.getString("qnaTitle"));
					dtoDetail.setQnaContents(rs.getString("qnaContents"));
					dtoDetail.setQnaWriteDate(rs.getTimestamp("qnaWriteDate"));
					dtoDetail.setQnaCategory(rs.getString("qnaCategory"));
					return dtoDetail;
				}
			}
		}
}
