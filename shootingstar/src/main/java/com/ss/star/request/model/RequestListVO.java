package com.ss.star.request.model;

import java.util.List;
//커맨드 객체로 List받기
public class RequestListVO {
	private List<RequestVO> pdItems;

	public List<RequestVO> getPdItems() {
		return pdItems;
	}

	public void setPdItems(List<RequestVO> pdItems) {
		this.pdItems = pdItems;
	}

	@Override
	public String toString() {
		return "ProductListVO [pdItems=" + pdItems + "]";
	}
	
	
}
