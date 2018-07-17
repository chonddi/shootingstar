package com.ss.star.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private String memberId;
	private String name;
	private String pwd;
	private String tel;
	private int mileage;
	private Timestamp regdate;
	private Timestamp outdate;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
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
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", name=" + name + ", pwd=" + pwd + ", tel=" + tel + ", mileage="
				+ mileage + ", regdate=" + regdate + ", outdate=" + outdate + "]";
	}
	
	
}
