package com.ss.star.payment.model;

import java.sql.Timestamp;

public class TransacInfoVO {

	private int pNo; /* 거래내역 번호 */
	private String cgName; /* 카테고리 이름 */
	private String sName; /* 판매자 이름 */
	private String sMemberid; /* 판매자 아이디 */
	private String rqRegion; /* 지역 */
	private Timestamp regdate; /* 거래 일시 */
	private String pMethod; /* 거래 수단 */
	private int pPrice; /* 결제 금액 */

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getCgName() {
		return cgName;
	}

	public void setCgName(String cgName) {
		this.cgName = cgName;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsMemberid() {
		return sMemberid;
	}

	public void setsMemberid(String sMemberid) {
		this.sMemberid = sMemberid;
	}

	public String getRqRegion() {
		return rqRegion;
	}

	public void setRqRegion(String rqRegion) {
		this.rqRegion = rqRegion;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getpMethod() {
		return pMethod;
	}

	public void setpMethod(String pMethod) {
		this.pMethod = pMethod;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	@Override
	public String toString() {
		return "TransacInfoVO [pNo=" + pNo + ", cgName=" + cgName + ", sName=" + sName + ", sMemberid=" + sMemberid
				+ ", rqRegion=" + rqRegion + ", regdate=" + regdate + ", pMethod=" + pMethod + ", pPrice=" + pPrice
				+ "]";
	}

}
