package com.ss.star.smember.model;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.member.model.MemberVO;

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
	public int checkPwd(String sMemberId, String sPwd) {
		String realPwd =sMemberDao.selectPwdById(sMemberId);
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

	@Override
	public int selectCountSMemberId(String sMemberId) {
		return sMemberDao.selectCountSMemberId(sMemberId);
	}

	@Override
	public int updateOutDate(String sMemberId) {
		return sMemberDao.updateOutDate(sMemberId);
	}

	@Override
	public int updateSMember(SMemberVO sMemberVo) {
		return sMemberDao.updateSMember(sMemberVo);
	}

	@Override
	public int updatePwd(String sPwd, String userId) {
		Map<String, String> map = new HashMap<>();
		map.put("sPwd", sPwd);
		map.put("sMemberId", userId);
		
		return sMemberDao.updatePwd(map);
	}

	@Override
	public int updateTempPwd(String tempPwd, String sMemberId) {
		Map<String, String> map = new HashMap<>();
		map.put("tempPwd", tempPwd);
		map.put("sMemberId", sMemberId);
		
		return sMemberDao.updateTempPwd(map);
	}

	@Override
	public String selectTempPwd(String tempPwd) {
		return sMemberDao.selectTempPwd(tempPwd);
	}

	@Override
	@Transactional
	public int changeNewPwd(String pwd, String userid) {
	int cnt = 0;
		
		try {
			SMemberVO sMemberVo = new SMemberVO();
			sMemberVo.setsPwd(pwd);
			sMemberVo.setsMemberId(userid);
			cnt=sMemberDao.changeNewPwd(sMemberVo);
			
			cnt=sMemberDao.deleteTempPwd(userid);
		}catch(RuntimeException e) {
			cnt=-1;	//rollback 처리값
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int selCount() {
		return sMemberDao.selCount();
	}

	@Override
	public String selectIdByName(String sName) {
		return sMemberDao.selectIdByName(sName);
	}
	
}
