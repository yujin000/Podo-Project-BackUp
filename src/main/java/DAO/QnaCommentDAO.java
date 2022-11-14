package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.QnaCommentDTO;

public class QnaCommentDAO {
	private static QnaCommentDAO instance = null;
	
	public static QnaCommentDAO getInstance() {
		if (instance==null) {
			instance = new QnaCommentDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertC(QnaCommentDTO dto) throws Exception {
		String sql = "insert into qnaComment values(qnaCommentSeq.nextVal, ?, ?, ?, sysdate)";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con .prepareStatement(sql);) {
			pstat.setString(1, dto.getQnaCommentWriter());
			pstat.setString(2, dto.getQnaCommentContents());
			pstat.setTimestamp(3, dto.getQnaCommentWriteDate());
			
			int result = pstat.executeUpdate();
			return result;			
		}
	}
	
	public List<QnaCommentDTO> selectC(int parentSeq) throws Exception {
		String sql = "select * from qnaComment where qnaParentSeq=? order by 1 desc";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, parentSeq);
			ResultSet rs = pstat.executeQuery();
			List<QnaCommentDTO> qnaCList = new ArrayList<>();
			
			while (rs.next()) {
				QnaCommentDTO dto = new QnaCommentDTO();
				dto.setQnaCommentSeq(rs.getInt("qnaCommentSeq"));
				dto.setQnaCommentWriter(rs.getString("qnaCommentWriter"));
				dto.setQnaCommentContents(rs.getString("qnaCommentContents"));
				dto.setQnaCommentWriteDate(rs.getTimestamp("qnaCommentWriteDate"));
				dto.setQnaParentSeq(parentSeq);
				qnaCList.add(dto);
			}			
			return qnaCList;
		}		
	}
	
}
