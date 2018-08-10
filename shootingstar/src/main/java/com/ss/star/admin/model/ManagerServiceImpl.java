package com.ss.star.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.star.common.SearchVO;
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
	public List<MemberVO> memberList(SearchVO searchVo) {
		return managerDao.memberList(searchVo);
	}
	@Override
	public int updateMember(MemberVO vo) {
		return managerDao.updateMember(vo);
	}
	@Override
	public List<SMemberVO> sMemberList(SearchVO searchVo) {
		return managerDao.sMemberList(searchVo);
	}
	@Override
	public int updateSMember(SMemberVO vo) {
		return managerDao.updateSMember(vo);
	}
	@Override
	public List<SMemberVO> sMemberOutList(SearchVO searchVo) {
		return managerDao.sMemberOutList(searchVo);
	}
/*	@Override
	public int smemberAuOut(SMemberVO vo) {
		return managerDao.smemberAuOut(vo);
	}
	@Override
	public int smemberAuBack(SMemberVO vo) {
		return managerDao.smemberAuBack(vo);
	}*/
	@Override
	public int smemberOut(SMemberVO vo) {
		return managerDao.smemberOut(vo);
	}
	@Override
	public int smemberBack(SMemberVO vo) {
		return managerDao.smemberBack(vo);
	}
	@Override
	public int memberOut(MemberVO vo) {
		return managerDao.memberOut(vo);
	}
	@Override
	public int memberBack(MemberVO vo) {
		return managerDao.memberBack(vo);
	}
	@Override
	public int getTotalRecord(SearchVO vo) {
		return managerDao.getTotalRecord(vo);
	}
	@Override
	public int getSTotalRecord(SearchVO vo) {
		return managerDao.getSTotalRecord(vo);
	}
	@Override
	public int getSOTotalRecord(SearchVO vo) {
		return managerDao.getSOTotalRecord(vo);
	}
}
