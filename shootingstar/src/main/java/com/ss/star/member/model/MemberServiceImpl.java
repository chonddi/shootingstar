package com.ss.star.member.model;

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
	
	
}
