package com.ss.star.notice.model;

import java.sql.Timestamp;

public class NoticeVO {

	private int nNo ;
	private String adminId;
	private String nTitle;
	private String nContent;
	private Timestamp regdate ;
	private int readcount;
	private String delflag;
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	@Override
	public String toString() {
		return "NoticeVO [nNo=" + nNo + ", adminId=" + adminId + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", regdate=" + regdate + ", readcount=" + readcount + ", delflag=" + delflag + "]";
	}
	
	
}