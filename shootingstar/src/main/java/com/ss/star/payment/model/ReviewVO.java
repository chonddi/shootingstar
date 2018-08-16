package com.ss.star.payment.model;

import java.sql.Timestamp;

public class ReviewVO {

	private int reviewNo; /* 후기글번호 */
	private String sMemberId; /* 전문가ID */
	private String content; /* 내용 */
	private int communication; /* 커뮤니케이션 점수 */
	private int result; /* 결과만족도 점수 */
	private String memberid; /* 고객ID */
	private Timestamp regdate; /* 등록일 */
	private int pNo; /* 결제번호 */

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getsMemberId() {
		return sMemberId;
	}

	public void setsMemberId(String sMemberId) {
		this.sMemberId = sMemberId;
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

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", sMemberId=" + sMemberId + ", content=" + content
				+ ", communication=" + communication + ", result=" + result + ", memberid=" + memberid + ", regdate="
				+ regdate + ", pNo=" + pNo + "]";
	}

}
