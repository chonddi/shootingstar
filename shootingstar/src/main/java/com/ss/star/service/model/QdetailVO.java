package com.ss.star.service.model;

//비밀글 처리용 클래스
public class QdetailVO {

	private int qNo;
	private String memberid;

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	@Override
	public String toString() {
		return "QdetailVO [qNo=" + qNo + ", memberid=" + memberid + "]";
	}

}
