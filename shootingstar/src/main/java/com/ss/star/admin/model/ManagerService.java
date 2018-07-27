package com.ss.star.admin.model;

public interface ManagerService {
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int ID_NONE=2;  //해당 아이디가 없다
	public static final int PWD_DISAGREE=3;  //비밀번호가 일치하지 않는다
	
	public ManagerVO selectID(String email) ;
	public int checkPwd(String adminId, String pwd);
}
