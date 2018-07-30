package com.ss.star.member.model;

import java.util.Map;

public interface MemberDAO {

	public MemberVO selectID(String email);
	public int insertMember(MemberVO memberVo);
	public String selectPwdById(String memberId);
	public String selectNameById(String memberId);
	public int updateMember(MemberVO memberVo);
	public int updateOutDate(String memberId);
	public int selectCountMemberId(String memberId);
	public int updatePwd(Map<String, String> map);
	public int updateTempPwd(String tempPwd);
}
