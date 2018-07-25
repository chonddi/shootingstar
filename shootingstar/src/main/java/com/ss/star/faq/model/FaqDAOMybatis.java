package com.ss.star.faq.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class FaqDAOMybatis implements FaqDAO {
	private String namespace="com.sql.faq.";
	@Autowired SqlSessionTemplate sqlSession;
	
	@Override
	public int insertFaq(FaqVO faqVo) {
		return sqlSession.insert(namespace+"insertFaq", faqVo);
	}

	@Override
	public List<FaqVO> selectAll(String category) {
		return sqlSession.selectList(namespace+"selectAll", category);
	}

	@Override
	public List<FaqVO> selectList() {
		return sqlSession.selectList(namespace+"selectList");
	}

	@Override
	public int deleteMulti(Map<String, String[]> map) {
		return sqlSession.update(namespace+"deleteMulti", map);
	}

	@Override
	public int deleteOne(FaqVO faqVo) {
		return sqlSession.update(namespace+"deleteOne", faqVo);
	}

	@Override
	public FaqVO selectByNo(int faqNo) {
		return sqlSession.selectOne(namespace+"selectByNo", faqNo);
	}

	@Override
	public int faqBack(FaqVO faqVo) {
		return sqlSession.update(namespace+"faqBack", faqVo);
	}

	@Override
	public int faqEdit(FaqVO faqVo) {
		return sqlSession.update(namespace+"faqEdit", faqVo);
	}

	@Override
	public List<FaqVO> selectAllUser(String category) {
		return sqlSession.selectList(namespace+"selectAllUser", category);
	}


	
}
