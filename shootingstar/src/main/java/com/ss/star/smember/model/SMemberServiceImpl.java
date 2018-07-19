package com.ss.star.smember.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SMemberServiceImpl implements SMemberService{
	
	@Autowired private SMemberDAO sMemberDao;

	@Override
	public SMemberVO selectID(String sMemberId) {
		return sMemberDao.selectID(sMemberId);
	}

	@Override
	public int insertSMember(SMemberVO sMemberVo) {
		return sMemberDao.insertSMember(sMemberVo);
	}

	@Override
	public int checkPwd(String sMmemberId, String sPwd) {
		String realPwd =sMemberDao.selectPwdById(sMmemberId);
		int result;
		if(realPwd!=null) {
			if(realPwd.equals(sPwd)) {
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
	public String selectNameById(String sMemberId) {
		return sMemberDao.selectNameById(sMemberId);
	}
	
}
