package com.ss.star.admin.model;


public interface ManagerDAO {
	public ManagerVO selectID(String email) ;
	public String selectPwdById(String adminId);
}
