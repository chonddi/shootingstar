package com.ss.star.service.model;

public class QRVO {

	private int qrNo;
	private int qNo;
	private String id;
	private String content;
	private String regdate; // 형 변환을 위해 String 처리
	private int parent;
	private int levels;
	private int newImgTerm; // 24시간 이내의 글인지 체크

	public int getNewImgTerm() {
		return newImgTerm;
	}

	public void setNewImgTerm(int newImgTerm) {
		this.newImgTerm = newImgTerm;
	}

	public int getQrNo() {
		return qrNo;
	}

	public void setQrNo(int qrNo) {
		this.qrNo = qrNo;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getLevels() {
		return levels;
	}

	public void setLevels(int levels) {
		this.levels = levels;
	}

	@Override
	public String toString() {
		return "QRVO [qrNo=" + qrNo + ", qNo=" + qNo + ", id=" + id + ", content=" + content + ", regdate=" + regdate
				+ ", parent=" + parent + ", levels=" + levels + ", newImgTerm=" + newImgTerm + "]";
	}

}
