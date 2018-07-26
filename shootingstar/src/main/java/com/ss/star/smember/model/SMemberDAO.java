package com.ss.star.smember.model;

public interface SMemberDAO {

	public SMemberVO selectID(String sMemberId);
	public int insertSMember(SMemberVO sMemberVo);
	public String selectPwdById(String sMemberId);
	public String selectNameById(String sMemberId);
	public int selectCountSMemberId(String sMemberId);
	public int updateOutDate(String sMemberId);
	public int updateSMember(SMemberVO sMemberVo);
}
