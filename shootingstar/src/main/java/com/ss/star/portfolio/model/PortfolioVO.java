package com.ss.star.portfolio.model;

public class PortfolioVO {
	private String smemberId;
	private String category;
	private String pfTitle;
	private int readCount;
	private int pfNo;



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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	@Override
	public String toString() {
		return "PortfolioVO [smemberId=" + smemberId + ", category=" + category + ", pfTitle=" + pfTitle
				+ ", readCount=" + readCount + ", pfNo=" + pfNo + "]";
	}

	

}
