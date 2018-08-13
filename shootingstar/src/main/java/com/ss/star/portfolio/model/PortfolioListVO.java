package com.ss.star.portfolio.model; 
  
 import java.util.List; 
//커맨드 객체로 List받기 
 
 public class PortfolioListVO { 
  	private List<PortfolioVO> pdItems; 
  
 
  	public List<PortfolioVO> getPdItems() { 
  		return pdItems; 
  	} 
  
 
  	public void setPdItems(List<PortfolioVO> pdItems) { 
  		this.pdItems = pdItems; 
  	} 
  
  	@Override 
 	public String toString() { 
  		
  		return "PortfolioListVO [pdItems=" + pdItems + "]"; 
} 
 	 
  	 
  } 
