package DTO;

public class BoardFilesDTO {
	private int filesSeq;
	private String oriName;
	private String sysName;
	private int parentSeq;
	private String boardCategory;
	
	
	public BoardFilesDTO() {}
	
	public BoardFilesDTO(int filesSeq, String oriName, String sysName, int parentSeq, String boardCategory) {
		super();
		this.filesSeq = filesSeq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.parentSeq = parentSeq;
		this.boardCategory = boardCategory;
	}
	public int getFilesSeq() {
		return filesSeq;
	}
	public void setFilesSeq(int filesSeq) {
		this.filesSeq = filesSeq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public int getParentSeq() {
		return parentSeq;
	}
	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	
	
}
