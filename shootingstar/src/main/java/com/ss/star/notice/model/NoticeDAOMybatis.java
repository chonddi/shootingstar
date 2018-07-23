package com.ss.star.notice.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.star.common.SearchVO;

@Repository
public class NoticeDAOMybatis implements NoticeDAO {
	private String namespace="com.sql.notice.";
@Autowired SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return sqlSession.insert(namespace+"insertNotice", noticeVo);
	}

	@Override
	public NoticeVO selectByNo(int nNo) {
		return sqlSession.selectOne(namespace+"selectByNo", nNo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return sqlSession.update(namespace+"updateNotice", noticeVo);
	}

	@Override
	public int deleteMulti(Map<String, String[]> map) {
		int cnt= sqlSession.update(namespace+"deleteMulti", map);
		return cnt;
	}

	@Override
	public int noticeBack(NoticeVO noticeVo) {
		return sqlSession.update(namespace+"noticeBack", noticeVo);
	}

	@Override
	public int deleteOne(NoticeVO noticeVo) {
		return sqlSession.update(namespace+"deleteOne", noticeVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", searchVo);
	}





}
