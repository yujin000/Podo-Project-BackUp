package DTO;

import java.sql.Timestamp;

public class QnaCommentDTO {
	private int qnaCommentSeq;
	private String qnaCommentWriter;
	private String qnaCommentContents;
	private Timestamp qnaCommentWriteDate;
	private int qnaParentSeq;
	
	public QnaCommentDTO() {}
	public QnaCommentDTO(int qnaCommentSeq, String qnaCommentWriter, String qnaCommentContents,
			Timestamp qnaCommentWriteDate, int qnaParentSeq) {
		this.qnaCommentSeq = qnaCommentSeq;
		this.qnaCommentWriter = qnaCommentWriter;
		this.qnaCommentContents = qnaCommentContents;
		this.qnaCommentWriteDate = qnaCommentWriteDate;
		this.qnaParentSeq = qnaParentSeq;
	}
	public int getQnaCommentSeq() {
		return qnaCommentSeq;
	}
	public void setQnaCommentSeq(int qnaCommentSeq) {
		this.qnaCommentSeq = qnaCommentSeq;
	}
	public String getQnaCommentWriter() {
		return qnaCommentWriter;
	}
	public void setQnaCommentWriter(String qnaCommentWriter) {
		this.qnaCommentWriter = qnaCommentWriter;
	}
	public String getQnaCommentContents() {
		return qnaCommentContents;
	}
	public void setQnaCommentContents(String qnaCommentContents) {
		this.qnaCommentContents = qnaCommentContents;
	}
	public Timestamp getQnaCommentWriteDate() {
		return qnaCommentWriteDate;
	}
	public void setQnaCommentWriteDate(Timestamp qnaCommentWriteDate) {
		this.qnaCommentWriteDate = qnaCommentWriteDate;
	}
	public int getQnaParentSeq() {
		return qnaParentSeq;
	}
	public void setQnaParentSeq(int qnaParentSeq) {
		this.qnaParentSeq = qnaParentSeq;
	}
	
}
