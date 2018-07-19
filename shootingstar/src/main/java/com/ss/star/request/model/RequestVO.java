package com.ss.star.request.model;

import java.sql.Timestamp;

public class RequestVO {
	
	private int RQNo;
	private String MemberId;
	private int cgNo;
	private int RQPrice;
	private String RQRegion;
	private String RQDate;
	private String RQType;
	private int pickCount;
	private String RQDetail;
	private Timestamp regDate;
	private String delFlag;
	
	
public int getRQNo() {
		return RQNo;
	}
	public void setRQNo(int rQNo) {
		RQNo = rQNo;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	public int getCgNo() {
		return cgNo;
	}
	public void setCgNo(int cgNo) {
		this.cgNo = cgNo;
	}
	public int getRQPrice() {
		return RQPrice;
	}
	public void setRQPrice(int rQPrice) {
		RQPrice = rQPrice;
	}
	public String getRQRegion() {
		return RQRegion;
	}
	public void setRQRegion(String rQRegion) {
		RQRegion = rQRegion;
	}
	public String getRQDate() {
		return RQDate;
	}
	public void setRQDate(String rQDate) {
		RQDate = rQDate;
	}
	public String getRQType() {
		return RQType;
	}
	public void setRQType(String rQType) {
		RQType = rQType;
	}
	public int getPickCount() {
		return pickCount;
	}
	public void setPickCount(int pickCount) {
		this.pickCount = pickCount;
	}
	public String getRQDetail() {
		return RQDetail;
	}
	public void setRQDetail(String rQDetail) {
		RQDetail = rQDetail;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	@Override
	public String toString() {
		return "RequestVO [RQNo=" + RQNo + ", MemberId=" + MemberId + ", cgNo=" + cgNo + ", RQPrice=" + RQPrice
				+ ", RQRegion=" + RQRegion + ", RQDate=" + RQDate + ", RQType=" + RQType + ", pickCount=" + pickCount
				+ ", RQDetail=" + RQDetail + ", regDate=" + regDate + ", delFlag=" + delFlag + "]";
	}
	
	
	
}
	
	