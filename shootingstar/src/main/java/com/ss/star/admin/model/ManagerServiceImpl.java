package com.ss.star.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.star.member.model.MemberVO;
import com.ss.star.smember.model.SMemberVO;

@Service
public class ManagerServiceImpl implements ManagerService  {
@Autowired ManagerDAO managerDao;
	@Override
	public ManagerVO selectID(String adminId) {
		return managerDao.selectID(adminId);
	}
	@Override
	public int insertManager(ManagerVO vo) {
		return managerDao.insertManager(vo);
	}
	
	@Override
	public int checkPwd(String adminId, String pwd) {
		String realPwd = managerDao.selectPwdById(adminId);
		int result;
		if(realPwd!=null) {
			if(realPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}else {
			result=ID_NONE;
		}
		return result;
	}

	@Override
	public String selectNameById(String adminId) {
		return managerDao.selectNameById(adminId);
	}

	@Override
	public int checkSignup(String adminId) {
		return managerDao.checkSignup(adminId);
	}
	@Override
	public int checkDuplicate(String adminId) {
		int result = managerDao.checkDuplicate(adminId);
		if(result>0) {
			return EXIST_ID;
		}else {
			return AVAILABLE_ID;
		}
	}
	@Override
	public int adminUpdate(ManagerVO vo) {
		int result= managerDao.adminUpdate(vo);
		if(result>0) {
			return LOGIN_OK;
		}else {
			return PWD_DISAGREE;
		}
	}
	@Override
	public int pwdUpdate(ManagerVO vo) {
		return managerDao.pwdUpdate(vo);
	}
	@Override
	public List<MemberVO> memberList() {
		return managerDao.memberList();
	}
	@Override
	public int updateMember(MemberVO vo) {
		return managerDao.updateMember(vo);
	}
	@Override
	public List<SMemberVO> sMemberList() {
		return managerDao.sMemberList();
	}
	@Override
	public int updateSMember(SMemberVO vo) {
		return managerDao.updateSMember(vo);
	}
	@Override
	public List<SMemberVO> sMemberOutList() {
		return managerDao.sMemberOutList();
	}
	@Override
	public int smemberOut(SMemberVO vo) {
		return managerDao.smemberOut(vo);
	}
	@Override
	public int smemberBack(SMemberVO vo) {
		return managerDao.smemberBack(vo);
	}

}
