package com.ss.star.service.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.star.common.SearchVO;

@Repository
public class QDAOMybatis implements QDAO {
	private String namespace = "config.mybatis.mapper.oracle.Q.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertQ(QVO QVo) {
		int cnt = sqlSession.insert(namespace + "insertQ", QVo);
		return cnt;
	}

	@Override
	public List<QVO> selectAll(SearchVO searchVo) {
		List<QVO> list = sqlSession.selectList(namespace + "selectAll", searchVo);
		return list;
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		int cnt = sqlSession.selectOne(namespace + "getTotalRecord", searchVo);
		return cnt;
	}

	@Override
	public QVO selectByNo(int qNo) {
		QVO vo = sqlSession.selectOne(namespace + "selectByNo", qNo);
		return vo;
	}

	@Override
	public int insertQR(QRVO QRVo) {
		int cnt = sqlSession.insert(namespace + "insertQR", QRVo);
		return cnt;
	}

	@Override
	public int QRCount() {
		int cnt = sqlSession.selectOne(namespace + "QRCount");
		return cnt;
	}

	@Override
	public List<QRVO> QRList(int qNo) {
		List<QRVO> list = sqlSession.selectList(namespace + "QRList", qNo);
		return list;
	}

	@Override
	public QRVO QRselectByNo(int qrNo) {
		QRVO vo = sqlSession.selectOne(namespace + "QRselectByNo", qrNo);
		return vo;
	}

	@Override
	public int QRUpdate(QRVO QRVo) {
		int cnt = sqlSession.update(namespace + "QRUpdate", QRVo);
		return cnt;
	}

	@Override
	public int QRDelete(int qrNo) {
		int cnt = sqlSession.delete(namespace + "QRDelete", qrNo);
		return cnt;
	}

	@Override
	public int QRreply(QRVO QRVo) {
		int cnt = sqlSession.insert(namespace + "QRreply", QRVo);
		return cnt;
	}

}
