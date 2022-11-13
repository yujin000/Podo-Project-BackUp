package DTO;

import java.sql.Timestamp;

public class PayMemberDTO {
	private int payGoodsSeq;
	private String payMemberEmail;
	private Timestamp payDate;
	
	public int getPayGoodsSeq() {
		return payGoodsSeq;
	}
	public void setPayGoodsSeq(int payGoodsSeq) {
		this.payGoodsSeq = payGoodsSeq;
	}
	public String getPayMemberEmail() {
		return payMemberEmail;
	}
	public void setPayMemberEmail(String payMemberEmail) {
		this.payMemberEmail = payMemberEmail;
	}
	public Timestamp getPayDate() {
		return payDate;
	}
	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	public PayMemberDTO(int payGoodsSeq, String payMemberEmail, Timestamp payDate) {
		super();
		this.payGoodsSeq = payGoodsSeq;
		this.payMemberEmail = payMemberEmail;
		this.payDate = payDate;
	}
	public PayMemberDTO() {
		super();
	}
	
	
}
