 package com.ss.star.smember.model;

public interface SMemberService {

	//로그인 처리에서 사용
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int ID_NONE=2;  //해당 아이디가 없다
	public static final int PWD_DISAGREE=3;  //비밀번호가 일치하지 않는다
		
	public SMemberVO selectID(String sMemberId);
	public int insertSMember(SMemberVO sMemberVo);
	public int checkPwd(String sMemberId, String sPwd);	
	public String selectNameById(String sMemberId);
	public int selectCountSMemberId(String sMemberId);
	public int updateOutDate(String sMemberId);
}
