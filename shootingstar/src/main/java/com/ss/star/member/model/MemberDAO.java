package com.ss.star.member.model;

public interface MemberDAO {

	public MemberVO selectID(String email);
	public int insertMember(MemberVO memberVo);
}
