package com.ss.star.admin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService  {
@Autowired ManagerDAO managerDao;
	@Override
	public ManagerVO selectID(String email) {
		return managerDao.selectID(email);
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
	public int checkDuplicate(String userid) {
		int result = managerDao.checkDuplicate(userid);
		if(result>0) {
			return EXIST_ID;
		}else {
			return AVAILABLE_ID;
		}
	}

}
