package com.ss.star.mypage.likey.model;

import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;

public interface LikeyService {

	public int insertLikey(String memberId, int pfNo);
	public int countLikey(String memberId, int pfNo);
	public int deleteLikey(String memberId, int pfNo);
	
	public List<Integer> myLikey(String memberId);
	public List<Map<String, Object>> myLikeyList(List<Integer> list, SearchVO searchVo);
	public int getTotalMyLikey(List<Integer> list, SearchVO searchVo);
}
