package com.ss.star.member.model;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int updateTempPwd(String tempPwd) {
		return memberDao.updateTempPwd(tempPwd);
	}
	
	
}
