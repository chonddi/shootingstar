package com.ss.star.member.model;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.mypage.message.model.ReceiveMsgVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired private MemberDAO memberDao;

	@Override
	public MemberVO selectID(String email) {
		return memberDao.selectID(email);
	}

	@Override
	public int insertMember(MemberVO memberVo) {
		return memberDao.insertMember(memberVo);
	}

	@Override
	public int checkPwd(String memberId, String pwd) {
		String realPwd =memberDao.selectPwdById(memberId);
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
	public String selectNameById(String memberId) {
		return memberDao.selectNameById(memberId);
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		return memberDao.updateMember(memberVo);
	}

	@Override
	public int updateOutDate(String memberId) {
		return memberDao.updateOutDate(memberId);
	}

	@Override
	public int selectCountMemberId(String memberId) {
		return memberDao.selectCountMemberId(memberId);
	}

	@Override
	public int updatePwd(String pwd, String userId) {
		Map<String, String> map = new HashMap<>();
		map.put("pwd", pwd);
		map.put("memberId", userId);
		
		return memberDao.updatePwd(map);
	}

	@Override
	public int updateTempPwd(String tempPwd, String memberId) {
		Map<String, String> map = new HashMap<>();
		map.put("tempPwd", tempPwd);
		map.put("memberId", memberId);
		return memberDao.updateTempPwd(map);
	}

	@Override
	public String selectTempPwd(String tempPwd) {
		return memberDao.selectTempPwd(tempPwd);
	}

	@Override
	@Transactional
	public int changeNewPwd(String pwd, String userid) {
		
		int cnt = 0;
		
		try {
			MemberVO memberVo = new MemberVO();
			memberVo.setPwd(pwd);
			memberVo.setMemberId(userid);
			cnt=memberDao.changeNewPwd(memberVo);
			
			cnt=memberDao.deleteTempPwd(userid);
		}catch(RuntimeException e) {
			cnt=-1;	//rollback 처리값
			e.printStackTrace();
		}
		return cnt;
	}
	
	
}
