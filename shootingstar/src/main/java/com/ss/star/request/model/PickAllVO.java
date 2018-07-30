package com.ss.star.request.model;


public class PickAllVO {

	private int pickNo;
	private int RQNo;
	private String sMemberId;
	private int sPrice;
	private String choice;
	private String sName;
	
	public int getPickNo() {
		return pickNo;
	}
	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
	}
	public int getRQNo() {
		return RQNo;
	}
	public void setRQNo(int rQNo) {
		RQNo = rQNo;
	}
	public String getsMemberId() {
		return sMemberId;
	}
	public void setsMemberId(String sMemberId) {
		this.sMemberId = sMemberId;
	}
	public int getsPrice() {
		return sPrice;
	}
	public void setsPrice(int sPrice) {
		this.sPrice = sPrice;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	
	@Override
	public String toString() {
		return "PickAllVO [pickNo=" + pickNo + ", RQNo=" + RQNo + ", sMemberId=" + sMemberId + ", sPrice=" + sPrice
				+ ", choice=" + choice + ", sName=" + sName + "]";
	}
	
	
	
	
	
	
	
	
	
}