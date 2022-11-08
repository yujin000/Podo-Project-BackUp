package DTO;

import java.sql.Timestamp;

public class NoticeBoardDTO {
	private int noticeSeq;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContents;
	private Timestamp noticeWriteDate;
	private String noticeCategory;
	
	public NoticeBoardDTO() {}
	public NoticeBoardDTO(int noticeSeq, String noticeWriter, String noticeTitle, String noticeContents,
			Timestamp noticeWriteDate, String noticeCategory) {
		this.noticeSeq = noticeSeq;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.noticeWriteDate = noticeWriteDate;
		this.noticeCategory = noticeCategory;
	}
	public int getNoticeSeq() {
		return noticeSeq;
	}
	public void setNoticeSeq(int noticeSeq) {
		this.noticeSeq = noticeSeq;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public Timestamp getNoticeWriteDate() {
		return noticeWriteDate;
	}
	public void setNoticeWriteDate(Timestamp noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
	}
	public String getNoticeCategory() {
		return noticeCategory;
	}
	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}	
}


