package com.ss.star.service.model;

import java.sql.Timestamp;

public class QVO {

	private int qNo;
	private String qTitle;
	private String qContent;
	private String memberid;
	private Timestamp regdate;
	private int newImgTerm; // 24시간 이내의 글인지 체크

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getNewImgTerm() {
		return newImgTerm;
	}

	public void setNewImgTerm(int newImgTerm) {
		this.newImgTerm = newImgTerm;
	}

	@Override
	public String toString() {
		return "QVO [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", memberid=" + memberid
				+ ", regdate=" + regdate + ", newImgTerm=" + newImgTerm + "]";
	}

}
