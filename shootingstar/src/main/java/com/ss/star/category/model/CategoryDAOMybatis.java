package com.ss.star.category.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOMybatis implements CategoryDAO{

	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.category.";

	@Override
	public List<CategoryVO> selectCategoryAll() {
		return sqlSession.selectList(namespace+"selectCategoryAll");
	}

	@Override
	public String getCtgName(int no) {
		return sqlSession.selectOne(namespace+"getCtgName",no);
	}

	@Override
	public int getCtgNum(String name) {
		return sqlSession.selectOne(namespace+"getCtgNum",name);
	}
	
	
}
