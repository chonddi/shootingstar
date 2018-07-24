package com.ss.star.category.model;

public class CategoryVO {
	private int cgNo;
	private String cgName;
    private int cgOrder;
	public int getCgNo() {
		return cgNo;
	}
	public void setCgNo(int cgNo) {
		this.cgNo = cgNo;
	}
	public String getCgName() {
		return cgName;
	}
	public void setCgName(String cgName) {
		this.cgName = cgName;
	}
	public int getCgOrder() {
		return cgOrder;
	}
	public void setCgOrder(int cgOrder) {
		this.cgOrder = cgOrder;
	}
	@Override
	public String toString() {
		return "CategoryVO [cgNo=" + cgNo + ", cgName=" + cgName + ", cgOrder=" + cgOrder + "]";
	}

    
    
}
