package com.ss.star.mypage.likey.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.star.common.SearchVO;

@Service
public class LikeyServiceImpl implements LikeyService{

	@Autowired LikeyDao likeyDao;

	@Override
	public int insertLikey(String memberId, int pfNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("pfNo", pfNo);
		
		
		return likeyDao.insertLikey(map);
	}

	@Override
	public int countLikey(String memberId, int pfNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("pfNo", pfNo);
		
		return likeyDao.countLikey(map);
	}

	@Override
	public int deleteLikey(String memberId, int pfNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("pfNo", pfNo);
		
		return likeyDao.deleteLikey(map);
	}
	
	@Override
	public List<Integer> myLikey(String memberId) {
		return likeyDao.myLikey(memberId);
	}
	
	@Override
	public List<Map<String, Object>> myLikeyList(List<Integer> list, SearchVO searchVo){
		Map<String, Object> map = new HashMap<>();
		map.put("searchVo", searchVo);
		map.put("pfNos", list);
		
		return likeyDao.myLikeyList(map);
	}

	@Override
	public int getTotalMyLikey(List<Integer> list, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchVo", searchVo);
		map.put("pfNos", list);
		
		return likeyDao.getTotalMyLikey(map);
	}


}
