package com.ss.star.admin.model;


public interface ManagerDAO {
	public ManagerVO selectID(String email) ;
	public String selectPwdById(String adminId);
	public String selectNameById(String adminId);
	public int checkSignup (String adminId);
	public int checkDuplicate(String adminId)	;
}
