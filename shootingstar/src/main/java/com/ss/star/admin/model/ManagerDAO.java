package com.ss.star.admin.model;

import java.util.List;

import com.ss.star.member.model.MemberVO;
import com.ss.star.smember.model.SMemberVO;

public interface ManagerDAO {
	public ManagerVO selectID(String adminId) ;
	public int insertManager(ManagerVO vo);
	
	public String selectPwdById(String adminId);
	public String selectNameById(String adminId);
	public int checkSignup (String adminId);
	
	public int checkDuplicate(String adminId);
	
	public int adminUpdate(ManagerVO vo);
	public int pwdUpdate(ManagerVO vo);
	
	//memberController
	public List<MemberVO> memberList();
	public int updateMember(MemberVO vo);
	
	public List<SMemberVO> sMemberList();
	public int updateSMember(SMemberVO vo);

	public List<SMemberVO> sMemberOutList();
	
	public int smemberAuOut (SMemberVO vo);
	public int smemberAuBack (SMemberVO vo);
	
	public int smemberOut (SMemberVO vo);
	public int smemberBack (SMemberVO vo);
	
	public int memberOut (MemberVO vo);
	public int memberBack (MemberVO vo);
	
	//boardController
}
