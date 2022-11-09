package DTO;

public class PayGoodsDTO {
	private int payGoodsNum;
	private String payGoodsName;
	private int payGoodsPrice;
	private String payGoodsExp;
	private String payGoodsType;
	
	public int getPayGoodsNum() {
		return payGoodsNum;
	}
	public void setPayGoodsNum(int payGoodsNum) {
		this.payGoodsNum = payGoodsNum;
	}
	public String getPayGoodsName() {
		return payGoodsName;
	}
	public void setPayGoodsName(String payGoodsName) {
		this.payGoodsName = payGoodsName;
	}
	public int getPayGoodsPrice() {
		return payGoodsPrice;
	}
	public void setPayGoodsPrice(int payGoodsPrice) {
		this.payGoodsPrice = payGoodsPrice;
	}
	public String getPayGoodsExp() {
		return payGoodsExp;
	}
	public void setPayGoodsExp(String payGoodsExp) {
		this.payGoodsExp = payGoodsExp;
	}
	public String getPayGoodsType() {
		return payGoodsType;
	}
	public void setPayGoodsType(String payGoodsType) {
		this.payGoodsType = payGoodsType;
	}
	public PayGoodsDTO(int payGoodsNum, String payGoodsName, int payGoodsPrice, String payGoodsExp,
			String payGoodsType) {
		super();
		this.payGoodsNum = payGoodsNum;
		this.payGoodsName = payGoodsName;
		this.payGoodsPrice = payGoodsPrice;
		this.payGoodsExp = payGoodsExp;
		this.payGoodsType = payGoodsType;
	}
	public PayGoodsDTO() {
		super();
	}
	
}
