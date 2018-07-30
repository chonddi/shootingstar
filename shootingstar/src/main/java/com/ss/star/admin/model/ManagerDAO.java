package com.ss.star.admin.model;


public interface ManagerDAO {
	public ManagerVO selectID(String adminId) ;
	public int insertManager(ManagerVO vo);
	
	public String selectPwdById(String adminId);
	public String selectNameById(String adminId);
	public int checkSignup (String adminId);
	
	public int checkDuplicate(String adminId);
	
	public int adminUpdate(ManagerVO vo);
}
