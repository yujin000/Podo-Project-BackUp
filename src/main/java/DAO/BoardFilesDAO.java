package DAO;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.BoardFilesDTO;



public class BoardFilesDAO {
	private static BoardFilesDAO instance;

	public static BoardFilesDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new BoardFilesDAO();
		}
		return instance;
	}

	private BoardFilesDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insert(BoardFilesDTO dto) throws Exception {
		String sql = "insert into boardFiles values(filesSeq.nextval,?,?,?,'QnA')";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getOriName());
			pstat.setString(2, dto.getSysName());
			pstat.setInt(3, dto.getParentSeq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int insertNotice(BoardFilesDTO dto) throws Exception {
		String sql = "insert into boardFiles values(filesSeq.nextval,?,?,?,'notice')";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getOriName());
			pstat.setString(2, dto.getSysName());
			pstat.setInt(3, dto.getParentSeq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public BoardFilesDTO select(int parentSeq) throws Exception {
		String sql = "select * from boardFiles where parentSeq = ? and boardCategory = 'QnA'";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, parentSeq);
			BoardFilesDTO dto =null;
			try (ResultSet rs = pstat.executeQuery();) {
				if(rs.next()) {
				dto = new BoardFilesDTO();
				dto.setFilesSeq(rs.getInt("filesSeq"));
				dto.setOriName(rs.getString("oriName"));			
				dto.setSysName(rs.getString("sysName"));
				dto.setParentSeq(rs.getInt("parentSeq"));
				}
			}
			return dto;
		}
	}
	
	public BoardFilesDTO selectNotice(int parentSeq) throws Exception {
		String sql = "select * from boardFiles where parentSeq = ? and boardCategory = 'notice'";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, parentSeq);
			BoardFilesDTO dto =null;
			try (ResultSet rs = pstat.executeQuery();) {
				if(rs.next()) {
				dto = new BoardFilesDTO();
				dto.setFilesSeq(rs.getInt("filesSeq"));
				dto.setOriName(rs.getString("oriName"));			
				dto.setSysName(rs.getString("sysName"));
				dto.setParentSeq(rs.getInt("parentSeq"));
				}
			}
			return dto;
		}
	}
	
	// 파일삭제 매소드, boardType은 QnA인지, 공지사항인지를 확인.
	public int deleteFileDb(int parentSeq, String boardType) throws Exception {
		String sql = "delete from boardFiles where parentSeq=? and boardCategory=?";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, parentSeq);
			pstat.setString(2, boardType);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//파일삭제 매소드. 구글링으로 찾아봐서 추가 테스트 필요함.
	public void deleteFile(String savePath, String sysName) {
		File file = new File(savePath + sysName);
		
		if (file.exists()) {
			file.delete();
		}
		return;
	}
}
