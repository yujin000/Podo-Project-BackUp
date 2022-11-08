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
		
		public int getRecordCount() throws Exception {
			String sql = "select count(*) from qnaBoard";
			try (Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					ResultSet rs = pstat.executeQuery()) {
				rs.next();
				return rs.getInt(1);
			}
		}
		
		public String getPageNavi(int currentPage) throws Exception {
			int recoredTotalCount = this.getRecordCount(); // board 테이블에 총 144개의 글이 있다고 가정
			int recordCountPerpage = 5; // 게시판 한 페이지당 10개의 글 씩 보여주기로 설정
			int naviCountPerPage = 5; // 게시판 하단의 Page Navigator가 한번에 몇개씩 보여질지 설정

			int pageTotalCount = 0;
			if (recoredTotalCount % recordCountPerpage > 0) {
				pageTotalCount = (recoredTotalCount / recordCountPerpage) + 1;
				// 게시글의 개수 / 한 페이지당 보여줄 게시글 +1 = 전체 페이지의 개수
			} else {
				pageTotalCount = recoredTotalCount / recordCountPerpage;
			}

			// (recordTotalCount / recordCountPerPage) + 1; 게시글의 개수 / 한 페이지당 보여줄 게시글 +1 = 전체
			// 페이지의 개수(하지만, 나머지가 0이 아닐 때는 +1되어선 안됨)
			// (recordTotalCount+9)/recordCountPerPage;는 오류가 있음
			// (recordTotalCount+(recordCountPerPage-1))/recordCountPerPage; 로도 사용할 수 있음

			if (currentPage < 1) {
				currentPage = 1;
			} else if (currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			// ↑ get방식을 통해 음수값을 받았을 때 대처하기 위함
			// 7 : 1~10;
			// 15 : 11~20;
			// 28 : 21~30페이지를 보게 되어야 함

			int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
			// currentPage / 10 >> 결과값 : 1(int형이기 때문), int형이기 때문에 연산할 때 잘 해라
			// currentPage-1 / 10 * 10 + 1 로 사용하게 되면 10의 배수일 때 위 공식은 성립하지 않음 >> -1 해주면 됨
			int endNavi = startNavi + naviCountPerPage - 1;

			if (endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			} // endpage가 15를 넘어가면 그냥 15가 돼라

			// ↓ 네비게이터 화살표
			boolean needPrev = true;
			boolean needNext = true;

			if (startNavi == 1) {
				needPrev = false;
			}
			if (endNavi == pageTotalCount) {
				needNext = false;
			}
			// ↑ 네비게이션 화살표가 필요없을 때

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
		
		public List<QnaBoardDTO> selectByRange(int start, int end) throws Exception {
			String sql = "select * from (select qnaBoard.*, row_number() over(order by qnaSeq desc) rn from qnaBoard) where rn between ? and ?";
			// sql문 실행순서 기억해야함
			// table.* = 이 테이블의 모든거와
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
}
