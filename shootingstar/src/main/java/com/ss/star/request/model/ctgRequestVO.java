package com.ss.star.request.model;

import com.ss.star.common.SearchVO;

public class ctgRequestVO extends SearchVO{
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
		return "ctgRequestVO [cgNo=" + cgNo + ", "
				+ "cgName=" + cgName + ", cgOrder=" + cgOrder + ", toString()="
				+ super.toString() + "]";
	}
	


	
	
	
	
	
	
}
