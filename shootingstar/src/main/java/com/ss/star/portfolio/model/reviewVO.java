package com.ss.star.portfolio.model;

import java.sql.Timestamp;

public class reviewVO {
	private int reviewNo;
	private int pfNo;
	private String content;
	private int communication;
	private int result;
	private String memberId;
	private Timestamp regdate;
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getPfNo() {
		return pfNo;
	}
	public void setPfNo(int pfNo) {
		this.pfNo = pfNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCommunication() {
		return communication;
	}
	public void setCommunication(int communication) {
		this.communication = communication;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "reviewVO [reviewNo=" + reviewNo + ", pfNo=" + pfNo + ", content=" + content + ", communication="
				+ communication + ", result=" + result + ", memberId=" + memberId + ", regdate=" + regdate + "]";
	}

}
