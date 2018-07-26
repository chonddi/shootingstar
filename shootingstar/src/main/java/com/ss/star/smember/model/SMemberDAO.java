package com.ss.star.smember.model;

import java.util.Map;

public interface SMemberDAO {

	public SMemberVO selectID(String sMemberId);
	public int insertSMember(SMemberVO sMemberVo);
	public String selectPwdById(String sMemberId);
	public String selectNameById(String sMemberId);
	public int selectCountSMemberId(String sMemberId);
	public int updateOutDate(String sMemberId);
	public int updateSMember(SMemberVO sMemberVo);
	public int updatePwd(Map<String, String> map);
}
