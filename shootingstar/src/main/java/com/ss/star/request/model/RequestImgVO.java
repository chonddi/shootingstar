package com.ss.star.request.model;

import java.sql.Timestamp;

public class RequestImgVO {
	
	private int RQImgNo;
	private int RQNo;
	private String originalFileName;
	private String fileName;
	
	
	public int getRQImgNo() {
		return RQImgNo;
	}
	public void setRQImgNo(int rQImgNo) {
		RQImgNo = rQImgNo;
	}
	public int getRQNo() {
		return RQNo;
	}
	public void setRQNo(int rQNo) {
		RQNo = rQNo;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	@Override
	public String toString() {
		return "RequestImgVO [RQImgNo=" + RQImgNo + ", RQNo=" + RQNo + ", originalFileName=" + originalFileName
				+ ", fileName=" + fileName + "]";
	}
	
	
	
	
	
	
	
	
	
}