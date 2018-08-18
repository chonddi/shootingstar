package com.ss.star.payment.model;

import java.sql.Timestamp;

public class ReviewVO {

	private int reviewNo; /* 후기글번호 */
	private String sMemberid; /* 전문가ID */
	private String content; /* 내용 */
	private int communication; /* 커뮤니케이션 점수 */
	private int result; /* 결과만족도 점수 */
	private String memberid; /* 고객ID */
	private String name; /* 고객이름 */
	private String cgName; /* 카테고리이름 */
	private Timestamp regdate; /* 등록일 */
	private int pNo; /* 결제번호 */
	private double avg; /* 평점 */

	public String getCgName() {
		return cgName;
	}

	public void setCgName(String cgName) {
		this.cgName = cgName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getsMemberid() {
		return sMemberid;
	}

	public void setsMemberid(String sMemberid) {
		this.sMemberid = sMemberid;
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
		return "ReviewVO [reviewNo=" + reviewNo + ", sMemberid=" + sMemberid + ", content=" + content
				+ ", communication=" + communication + ", result=" + result + ", memberid=" + memberid + ", name="
				+ name + ", cgName=" + cgName + ", regdate=" + regdate + ", pNo=" + pNo + ", avg=" + avg + "]";
	}

}
