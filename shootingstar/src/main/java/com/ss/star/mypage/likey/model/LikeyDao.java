package com.ss.star.mypage.likey.model;

import java.util.List;
import java.util.Map;

public interface LikeyDao {

	//포폴에서 하트 클릭
	public int insertLikey(Map<String, Object> map); 
	public int countLikey(Map<String, Object> map);
	public int deleteLikey(Map<String, Object> map);
	
	//관심 목록
	public List<Integer> myLikey(String memberId);
	public List<Map<String, Object>> myLikeyList(Map<String, Object> map);
	public int getTotalMyLikey(Map<String, Object> map);
}
