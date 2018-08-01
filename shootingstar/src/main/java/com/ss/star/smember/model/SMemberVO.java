package com.ss.star.smember.model;

import java.sql.Timestamp;

public class SMemberVO {
	private String sMemberId;
	private String sName;
	private String sPwd;
	private String sTel;
	private String pr;
	private String zipcode;
	private String address1;
	private String address2;
	private String identification;
	private String accountCopy;
	private Timestamp regdate;
	private Timestamp outdate;
	private Timestamp membership;
	private String authority;
	private String tempPwd;
	private int rownum;
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getsMemberId() {
		return sMemberId;
	}
	public void setsMemberId(String sMemberId) {
		this.sMemberId = sMemberId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsPwd() {
		return sPwd;
	}
	public void setsPwd(String sPwd) {
		this.sPwd = sPwd;
	}
	public String getsTel() {
		return sTel;
	}
	public void setsTel(String sTel) {
		this.sTel = sTel;
	}
	public String getPr() {
		return pr;
	}
	public void setPr(String pr) {
		this.pr = pr;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getIdentification() {
		return identification;
	}
	public void setIdentification(String identification) {
		this.identification = identification;
	}
	public String getAccountCopy() {
		return accountCopy;
	}
	public void setAccountCopy(String accountCopy) {
		this.accountCopy = accountCopy;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getOutdate() {
		return outdate;
	}
	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}
	public Timestamp getMembership() {
		return membership;
	}
	public void setMembership(Timestamp membership) {
		this.membership = membership;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getTempPwd() {
		return tempPwd;
	}
	public void setTempPwd(String tempPwd) {
		this.tempPwd = tempPwd;
	}
	@Override
	public String toString() {
		return "SMemberVO [sMemberId=" + sMemberId + ", sName=" + sName + ", sPwd=" + sPwd + ", sTel=" + sTel + ", pr="
				+ pr + ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2
				+ ", identification=" + identification + ", accountCopy=" + accountCopy + ", regdate=" + regdate
				+ ", outdate=" + outdate + ", membership=" + membership + ", authority=" + authority + ", tempPwd="
				+ tempPwd + "]";
	}
	
}
