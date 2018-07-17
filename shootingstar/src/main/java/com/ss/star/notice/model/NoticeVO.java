package com.ss.star.notice.model;

import java.sql.Timestamp;

public class NoticeVO {

	private int Nno ;
	private String adminId;
	private String Ntitle;
	private String Ncontent;
	private Timestamp regdate ;
	private int readcount;
	private String delflag;
	public int getNno() {
		return Nno;
	}
	public void setNno(int nno) {
		Nno = nno;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getNtitle() {
		return Ntitle;
	}
	public void setNtitle(String ntitle) {
		Ntitle = ntitle;
	}
	public String getNcontent() {
		return Ncontent;
	}
	public void setNcontent(String ncontent) {
		Ncontent = ncontent;
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
		return "NoticeVO [Nno=" + Nno + ", adminId=" + adminId + ", Ntitle=" + Ntitle + ", Ncontent=" + Ncontent
				+ ", regdate=" + regdate + ", readcount=" + readcount + ", delflag=" + delflag + "]";
	}
	
	
	
}
