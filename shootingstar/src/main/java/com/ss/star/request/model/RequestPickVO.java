package com.ss.star.request.model;

import java.sql.Timestamp;

public class RequestPickVO {
	
	private int pickNo;
	private int RQNo;
	private String sMemberId;
	private int sPrice;
	private String choice;
	
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
	
	@Override
	public String toString() {
		return "RequestPickVO [pickNo=" + pickNo + ", RQNo=" + RQNo + ", sMemberId=" + sMemberId + ", sPrice=" + sPrice
				+ ", choice=" + choice + "]";
	}
	
	
	
	
	
}