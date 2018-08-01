package com.ss.star.mypage.memberShip.model;

import java.sql.Timestamp;

public class MSPaymentVO {

	private int pNo;
	private String sMemberId;
	private String pMethod;
	private String pContent;
	private int pPrice;
	private int period;
	private Timestamp regdate;
	private Timestamp cancel;
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getsMemberId() {
		return sMemberId;
	}
	public void setsMemberId(String sMemberId) {
		this.sMemberId = sMemberId;
	}
	public String getpMethod() {
		return pMethod;
	}
	public void setpMethod(String pMethod) {
		this.pMethod = pMethod;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getCancel() {
		return cancel;
	}
	public void setCancel(Timestamp cancel) {
		this.cancel = cancel;
	}
	@Override
	public String toString() {
		return "MSPaymentVO [pNo=" + pNo + ", sMemberId=" + sMemberId + ", pMethod=" + pMethod + ", pContent="
				+ pContent + ", pPrice=" + pPrice + ", period=" + period + ", regdate=" + regdate + ", cancel=" + cancel
				+ "]";
	}
	
	
}
