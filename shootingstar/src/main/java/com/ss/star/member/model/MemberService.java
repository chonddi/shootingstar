package com.ss.star.member.model;

public interface MemberService {
	//로그인 처리에서 사용
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int ID_NONE=2;  //해당 아이디가 없다
	public static final int PWD_DISAGREE=3;  //비밀번호가 일치하지 않는다

	public MemberVO selectID(String email);
	public int insertMember(MemberVO memberVo);
	public int checkPwd(String memberId, String pwd);
	public String selectNameById(String memberId);
	public int updateMember(MemberVO memberVo);
	public int updateOutDate(String memberId);
	public int selectCountMemberId(String memberId);
	public int updatePwd(String pwd, String userId);
	public int updateTempPwd(String tempPwd);
}
