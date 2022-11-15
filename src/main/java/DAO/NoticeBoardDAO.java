package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.NoticeBoardDTO;

public class NoticeBoardDAO {
	private static NoticeBoardDAO instance = null;
	
	public static NoticeBoardDAO getInstance() {
		if (instance==null) {
			instance = new NoticeBoardDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int writeNoticeBoard(NoticeBoardDTO dto) throws Exception {
		String sql = "insert into NoticeBoard values(?, ?, ?, ?, sysdate, ?)";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setInt(1, dto.getNoticeSeq());
			pstat.setString(2, dto.getNoticeWriter());
			pstat.setString(3, dto.getNoticeTitle());
			pstat.setString(4, dto.getNoticeContents());
			pstat.setString(5, dto.getNoticeCategory());
						
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<NoticeBoardDTO> selectNotice(int start, int end) throws Exception {
		String sql = "select * from (select noticeBoard.*, row_number() over(order by noticeSeq desc) rn from noticeBoard) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			
			
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			
			ResultSet rs = pstat.executeQuery();
			List <NoticeBoardDTO> noticeBoardList = new ArrayList<>();
			
			while (rs.next()) {
				NoticeBoardDTO dto = new NoticeBoardDTO();
				dto.setNoticeSeq(rs.getInt("noticeSeq"));
				dto.setNoticeWriter(rs.getString("noticeWriter"));
				dto.setNoticeTitle(rs.getString("noticeTitle"));
				dto.setNoticeContents(rs.getString("noticeContents"));
				dto.setNoticeWriteDate(rs.getTimestamp("noticeWriteDate"));
				dto.setNoticeCategory(rs.getString("noticeCategory"));
				noticeBoardList.add(dto);				
			}
			return noticeBoardList;
		}
	}
	
	public NoticeBoardDTO noticeDetail(int noticeSeq) throws Exception {
		String sql = "select * from noticeBoard where noticeSeq = ?";
		
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setInt(1, noticeSeq);
			ResultSet rs = pstat.executeQuery();
			rs.next();
			NoticeBoardDTO dto = new NoticeBoardDTO();
			dto.setNoticeSeq(noticeSeq);
			dto.setNoticeWriter(rs.getString("noticeWriter"));
			dto.setNoticeTitle(rs.getString("noticeTitle"));
			dto.setNoticeContents(rs.getString("noticeContents"));
			dto.setNoticeWriteDate(rs.getTimestamp("noticeWriteDate"));
			dto.setNoticeCategory(rs.getString("noticeCategory"));
			return dto;
		}
	}
	
	public int getSeq() throws Exception {
		String sql = "select noticeSeq.nextval from dual";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
	
	public int getRecordCount() throws Exception {
		String sql = "select count(*) from noticeBoard";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}				
	}
	
	public String getPageNavi(int currentPage, int rcpp, int ncpp) throws Exception {
		int recordTotalCount = this.getRecordCount();
		int recordCountPerPage = rcpp;
		int naviCountPerPage = ncpp;
				
		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;			
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		
		int endNavi = startNavi + naviCountPerPage - 1;
		
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
				
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
			
		StringBuilder sb = new StringBuilder();
		
		if (needPrev) {
			sb.append("<a href='/list.notice?cpage="+(startNavi-1)+"'> < </a> ");
		}
		
		for (int i=startNavi; i<=endNavi; i++) {
			sb.append("<a href='/list.notice?cpage=" + i + "' style='color:black;margin-left:5px;' onclick=\"myfunction(this)\">" + i + "</a> ");
		}
		
		if (needNext) {
			sb.append("<a href='/list.notice?cpage=" + (endNavi+1) + "'> > </a>");
		}
		
		return sb.toString();
	}
	
	public String getPageNaviLook(int currentPage, int rcpp, int ncpp) throws Exception {
		int recordTotalCount = this.getRecordCount();
		int recordCountPerPage = rcpp;
		int naviCountPerPage = ncpp;
				
		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;			
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		
		int endNavi = startNavi + naviCountPerPage - 1;
		
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
				
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
			
		StringBuilder sb = new StringBuilder();
		
		if (needPrev) {
			sb.append("<a href='/listLook.notice?cpage="+(startNavi-1)+"'> < </a> ");
		}
		
		for (int i=startNavi; i<=endNavi; i++) {
			sb.append("<a href='/listLook.notice?cpage=" + i + "'>" + i + "</a> ");
		}
		
		if (needNext) {
			sb.append("<a href='/listLook.notice?cpage=" + (endNavi+1) + "'> > </a>");
		}
		
		return sb.toString();
	}
	
	public int delNotice(int noticeSeq) throws Exception {
		String sql = "delete from noticeBoard where noticeSeq = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, noticeSeq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
}
