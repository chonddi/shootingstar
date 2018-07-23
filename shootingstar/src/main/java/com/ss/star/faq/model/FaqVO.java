package com.ss.star.faq.model;

import java.util.Date;

public class FaqVO {
	private int faqNo;
	private String adminId;
	private String category; 
	private String faqTitle;
	private String faqContent;
	private Date faqRegdate; 
	private String delflag;
	private int rownum;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public Date getFaqRegdate() {
		return faqRegdate;
	}
	public void setFaqRegdate(Date faqRegdate) {
		this.faqRegdate = faqRegdate;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", adminId=" + adminId + ", category=" + category + ", faqTitle=" + faqTitle
				+ ", faqContent=" + faqContent + ", faqRegdate=" + faqRegdate + ", delflag=" + delflag + "]";
	}
	
	
}
