package com.ss.star.service.model;

import java.sql.Timestamp;

public class QRVO {

	private int qrNo;
	private int qNo;
	private String id;
	private String qrContent;
	private Timestamp regdate;
	private int parent;
	private int levels;

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

	public String getQrContent() {
		return qrContent;
	}

	public void setQrContent(String qrContent) {
		this.qrContent = qrContent;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
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
		return "QRVO [qrNo=" + qrNo + ", qNo=" + qNo + ", id=" + id + ", qrContent=" + qrContent + ", regdate="
				+ regdate + ", parent=" + parent + ", levels=" + levels + "]";
	}

}
