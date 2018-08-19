package com.ss.star.payment.model;

import java.sql.Timestamp;

public class TransacInfoVO {

	private int pNo; /* 거래내역 번호 */
	private String memberid; /* 고객 아이디 */
	private Timestamp regdate; /* 거래 일시 */
	private String sName; /* 전문가 이름 */
	private String sMemberid; /* 전문가 아이디 */
	private String rqRegion; /* 지역 */
	private String cgName; /* 카테고리 */
	private int useMile; /* 사용한 마일리지 */
	private int pPrice; /* 결제 금액 */
	private String pMethod; /* 결제 방법 */
	private int pickNo; /* 픽번호 */
	private String flag; /* 후기 여부 */

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public int getPickNo() {
		return pickNo;
	}

	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
	}

	public String getRqRegion() {
		return rqRegion;
	}

	public void setRqRegion(String rqRegion) {
		this.rqRegion = rqRegion;
	}

	public int getUseMile() {
		return useMile;
	}

	public void setUseMile(int useMile) {
		this.useMile = useMile;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

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
		return "TransacInfoVO [pNo=" + pNo + ", memberid=" + memberid + ", regdate=" + regdate + ", sName=" + sName
				+ ", sMemberid=" + sMemberid + ", rqRegion=" + rqRegion + ", cgName=" + cgName + ", useMile=" + useMile
				+ ", pPrice=" + pPrice + ", pMethod=" + pMethod + ", pickNo=" + pickNo + ", flag=" + flag + "]";
	}

}
