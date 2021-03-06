package com.ss.star.member.model;

import java.util.List;
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
	public int updateTempPwd(Map<String, String> map);
	public String selectTempPwd(String tempPwd);
	public int changeNewPwd(MemberVO memberVo);
	public int deleteTempPwd(String memberId);
	public List<MemberVO>excelMember();	//엑셀
}
