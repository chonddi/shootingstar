package com.ss.star.admin.model;

public interface ManagerService {
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int ID_NONE=2;  //해당 아이디가 없다
	public static final int PWD_DISAGREE=3;  //비밀번호가 일치하지 않는다
		
	//아이디 중복확인에 이용하는 상수
	public static final int EXIST_ID=1;  //해당 아이디가 이미 존재
	//INTERFACE라 public static final 생략가능
	int AVAILABLE_ID=2; //사용가능한 아이디
	
	public ManagerVO selectID(String adminId) ;
	public int insertManager(ManagerVO vo);
	
	public int checkPwd(String adminId, String pwd);
	public String selectNameById(String adminId);
	public int checkSignup (String adminId);
	
	public int checkDuplicate(String userid);

	public int adminUpdate(ManagerVO vo);
}
