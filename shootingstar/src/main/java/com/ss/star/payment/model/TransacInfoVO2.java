package com.ss.star.payment.model;

import java.sql.Timestamp;

public class TransacInfoVO2 {

	private int pNo; /* 거래내역 번호 */
	private Timestamp regdate; /* 거래 일시 */
	private String name; /* 고객 이름 */
	private String memberid; /* 고객 아이디 */
	private String rqRegion; /* 지역 */
	private String cgName; /* 카테고리 */
	private int pPrice; /* 결제 금액 */
	private String pMethod; /* 결제 방법 */
	private int pickNo; /* 픽번호 */
	private String flag; /* 후기 여부 */

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getRqRegion() {
		return rqRegion;
	}

	public void setRqRegion(String rqRegion) {
		this.rqRegion = rqRegion;
	}

	public String getCgName() {
		return cgName;
	}

	public void setCgName(String cgName) {
		this.cgName = cgName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpMethod() {
		return pMethod;
	}

	public void setpMethod(String pMethod) {
		this.pMethod = pMethod;
	}

	public int getPickNo() {
		return pickNo;
	}

	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "TransacInfoVO2 [pNo=" + pNo + ", regdate=" + regdate + ", name=" + name + ", memberid=" + memberid
				+ ", rqRegion=" + rqRegion + ", cgName=" + cgName + ", pPrice=" + pPrice + ", pMethod=" + pMethod
				+ ", pickNo=" + pickNo + ", flag=" + flag + "]";
	}

}
