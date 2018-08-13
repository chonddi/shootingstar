package com.ss.star.portfolio.model;

import java.sql.Timestamp;

public class PortfolioVO {
	private int pfNo;
	private String smemberId;
	private String cgNo;
	private String pfTitle;
	private int readCount;
	private Timestamp regdate;
	
	public int getPfNo() {
		return pfNo;
	}
	public void setPfNo(int pfNo) {
		this.pfNo = pfNo;
	}
	public String getSmemberId() {
		return smemberId;
	}
	public void setSmemberId(String smemberId) {
		this.smemberId = smemberId;
	}
	public String getCgNo() {
		return cgNo;
	}
	public void setCgNo(String cgNo) {
		this.cgNo = cgNo;
	}
	public String getPfTitle() {
		return pfTitle;
	}
	public void setPfTitle(String pfTitle) {
		this.pfTitle = pfTitle;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "PortfolioVO [pfNo=" + pfNo + ", smemberId=" + smemberId + ", cgNo=" + cgNo + ", pfTitle=" + pfTitle
				+ ", readCount=" + readCount + ", regdate=" + regdate + "]";
	}
	
	


}
