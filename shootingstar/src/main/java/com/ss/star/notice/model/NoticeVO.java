package com.ss.star.notice.model;

import java.sql.Timestamp;

public class NoticeVO {

	private int NNO ;
	private String ADMINID;
	private String NTITLE;
	private String NCONTENT;
	private Timestamp REGDATE ;
	private int READCOUNT;
	private String DELFLAG;
	public int getNNO() {
		return NNO;
	}
	public void setNNO(int nNO) {
		NNO = nNO;
	}
	public String getADMINID() {
		return ADMINID;
	}
	public void setADMINID(String aDMINID) {
		ADMINID = aDMINID;
	}
	public String getNTITLE() {
		return NTITLE;
	}
	public void setNTITLE(String nTITLE) {
		NTITLE = nTITLE;
	}
	public String getNCONTENT() {
		return NCONTENT;
	}
	public void setNCONTENT(String nCONTENT) {
		NCONTENT = nCONTENT;
	}
	public Timestamp getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(Timestamp rEGDATE) {
		REGDATE = rEGDATE;
	}
	public int getREADCOUNT() {
		return READCOUNT;
	}
	public void setREADCOUNT(int rEADCOUNT) {
		READCOUNT = rEADCOUNT;
	}
	public String getDELFLAG() {
		return DELFLAG;
	}
	public void setDELFLAG(String dELFLAG) {
		DELFLAG = dELFLAG;
	}
	
	@Override
	public String toString() {
		return "noticeVO [NNO=" + NNO + ", ADMINID=" + ADMINID + ", NTITLE=" + NTITLE + ", NCONTENT=" + NCONTENT
				+ ", REGDATE=" + REGDATE + ", READCOUNT=" + READCOUNT + ", DELFLAG=" + DELFLAG + "]";
	}
	
	
}
