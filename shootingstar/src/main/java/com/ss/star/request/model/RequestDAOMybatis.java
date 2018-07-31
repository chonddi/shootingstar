package com.ss.star.request.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.star.common.SearchVO;
import com.ss.star.payment.model.PayfinishVO;
import com.ss.star.payment.model.PaymentVO;

@Repository
public class RequestDAOMybatis implements RequestDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.request.";

	@Override
	public int insertRequest(RequestVO vo) {
		int cnt = sqlSession.insert(namespace + "insertRequest", vo);
		return cnt;
	}

	@Override
	public int insertReqImg(RequestImgVO ivo) {
		int cnt = sqlSession.insert(namespace + "insertReqImg", ivo);
		return cnt;
	}

	public List<RequestVO> selectAll(ctgRequestVO searchVo) {
		// 글 전체 조회-글 목록
		List<RequestVO> list = sqlSession.selectList(namespace + "selectAll", searchVo);
		return list;

	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace + "getTotalRecord", searchVo);
	}

	@Override
	public RequestVO selectByNo(int no) {
		return sqlSession.selectOne(namespace + "selectByNo", no);
	}

	@Override
	public List<RequestImgVO> selectByNoImg(int no) {

		List<RequestImgVO> list = sqlSession.selectList(namespace + "selectByNoImg", no);
		return list;

	}

	@Override
	public int insertPick(RequestPickVO pvo) {
		int cnt = sqlSession.insert(namespace + "insertPick", pvo);
		return cnt;
	}

	@Override
	public int getPickCount(int no) {
		return sqlSession.selectOne(namespace + "getPickCount", no);
	}

	@Override
	public int updatePick(int no) {
		return sqlSession.update(namespace + "updatePick", no);
	}

	@Override
	public List<RequestPickVO> pickByNo(int no) {

		List<RequestPickVO> list = sqlSession.selectList(namespace + "pickByNo", no);
		return list;

	}

	@Override
	public List<PickAllVO> selectPList(int no) {

		List<PickAllVO> list = sqlSession.selectList(namespace + "selectPList", no);

		return list;
	}

	@Override
	public PickAllVO selectByPick(int no) {
		PickAllVO vo = sqlSession.selectOne(namespace + "selectByPick", no);
		return vo;
	}

	@Override
	public PayfinishVO selectAll(int no) {
		PayfinishVO vo = sqlSession.selectOne(namespace + "selectAll", no);
		return vo;
	}

	@Override
	public int insertPayment(PayfinishVO vo) {
		int cnt = sqlSession.insert(namespace + "insertPayment", vo);
		return cnt;
	}

}
