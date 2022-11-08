package DTO;

import java.sql.Timestamp;

public class QnaBoardDTO {
	int qnaSeq;
	String qnaWriter;
	String qnaTitle;
	String qnaContents;
	Timestamp qnaWriteDate;
	String qnaCategory;
	
	public QnaBoardDTO() {}
	
	public QnaBoardDTO(int qnaSeq, String qnaWriter, String qnaTitle, String qnaContents, Timestamp qnaWriteDate,
			String qnaCategory) {
		super();
		this.qnaSeq = qnaSeq;
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaContents = qnaContents;
		this.qnaWriteDate = qnaWriteDate;
		this.qnaCategory = qnaCategory;
	}
	public int getQnaSeq() {
		return qnaSeq;
	}
	public void setQnaSeq(int qnaSeq) {
		this.qnaSeq = qnaSeq;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContents() {
		return qnaContents;
	}
	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	public Timestamp getQnaWriteDate() {
		return qnaWriteDate;
	}
	public void setQnaWriteDate(Timestamp qnaWriteDate) {
		this.qnaWriteDate = qnaWriteDate;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	
	
}
