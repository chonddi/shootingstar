package com.ss.star.portfolio.model;

public class PortfolioImgVO{
	private String originalFileName;
	private String fileName;
	private int pfNo;
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

	public int getPfNo() {
		return pfNo;
	}
	public void setPfNo(int pfNo) {
		this.pfNo = pfNo;
	}
	@Override
	public String toString() {
		return "PortfolioImgVO [originalFileName=" + originalFileName + ", fileName=" + fileName + ", pfNo=" + pfNo + "]";
	}
	
	
	

}
