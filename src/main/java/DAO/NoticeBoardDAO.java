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
	
	public List<NoticeBoardDTO> selectNotice() throws Exception {
		String sql = "select * from noticeBoard";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			
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
	
}
