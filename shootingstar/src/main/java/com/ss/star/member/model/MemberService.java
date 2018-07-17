package com.ss.star.member.model;

public interface MemberService {

	public MemberVO selectID(String email);
	public int insertMember(MemberVO memberVo);
}
