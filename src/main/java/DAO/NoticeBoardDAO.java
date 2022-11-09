package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
		String sql = "insert into NoticeBoard values(noticeSeq.nextVal, ?, ?, ?, sysdate, ?)";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setString(1, dto.getNoticeWriter());
			pstat.setString(2, dto.getNoticeTitle());
			pstat.setString(3, dto.getNoticeContents());
			pstat.setString(4, dto.getNoticeCategory());
						
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
