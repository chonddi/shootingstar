package com.ss.star.admin.model;

import java.util.List;

import com.ss.star.member.model.MemberVO;

public interface ManagerDAO {
	public ManagerVO selectID(String adminId) ;
	public int insertManager(ManagerVO vo);
	
	public String selectPwdById(String adminId);
	public String selectNameById(String adminId);
	public int checkSignup (String adminId);
	
	public int checkDuplicate(String adminId);
	
	public int adminUpdate(ManagerVO vo);
	public int pwdUpdate(ManagerVO vo);
	public List<MemberVO> memberList();
	
	public int updateMember(MemberVO vo);
}
