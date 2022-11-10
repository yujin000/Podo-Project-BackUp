package DTO;

public class PayGoodsDTO {
	private int payGoodsSeq;
	private String payGoodsName;
	private int payGoodsPrice;
	private String payGoodsExp;
	private String payGoodsType;
	private String payGoodsInfo;
	
	public int getPayGoodsSeq() {
		return payGoodsSeq;
	}
	public void setPayGoodsSeq(int payGoodsSeq) {
		this.payGoodsSeq = payGoodsSeq;
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
	public String getPayGoodsInfo() {
		return payGoodsInfo;
	}
	public void setPayGoodsInfo(String payGoodsInfo) {
		this.payGoodsInfo = payGoodsInfo;
	}
	public PayGoodsDTO(int payGoodsSeq, String payGoodsName, int payGoodsPrice, String payGoodsExp, String payGoodsType,
			String payGoodsInfo) {
		super();
		this.payGoodsSeq = payGoodsSeq;
		this.payGoodsName = payGoodsName;
		this.payGoodsPrice = payGoodsPrice;
		this.payGoodsExp = payGoodsExp;
		this.payGoodsType = payGoodsType;
		this.payGoodsInfo = payGoodsInfo;
	}
	public PayGoodsDTO() {
		super();
	}
	
	
}
