package com.ss.star.request.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.star.request.model.ctgRequestVO;
import com.ss.star.common.SearchVO;


@Repository
public class RequestDAOMybatis implements RequestDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.request.";
	
	
	@Override
	public int insertRequest(RequestVO vo) {
		int cnt=sqlSession.insert(namespace+"insertRequest", vo);
		return cnt;
	}


	@Override
	public int insertReqImg(RequestImgVO ivo) {
		int cnt=sqlSession.insert(namespace+"insertReqImg", ivo);
		return cnt;
	}
	
	
	public List<RequestVO> selectAll(ctgRequestVO searchVo){
		//글 전체 조회-글 목록
		List<RequestVO> list
		=sqlSession.selectList(namespace+"selectAll", searchVo);
		return list;

	}


	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", searchVo);
	}


	@Override
	public RequestVO selectByNo(int no) {
		return sqlSession.selectOne(namespace+"selectByNo", no);
	}


	@Override
	public RequestImgVO selectByNoImg(int no) {
		return sqlSession.selectOne(namespace+"selectByNoImg", no);
	}		
	
	

}
