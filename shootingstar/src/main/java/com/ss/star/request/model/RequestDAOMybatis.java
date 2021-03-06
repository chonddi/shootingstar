package com.ss.star.request.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.star.common.SearchVO;
import com.ss.star.common.SearchVO2;
import com.ss.star.member.model.MemberVO;
import com.ss.star.payment.model.PayfinishVO;
import com.ss.star.payment.model.PaymentVO;
import com.ss.star.payment.model.TransacInfoVO;

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

	public List<Map<String, Object>> selectAll(SearchVO searchVo) {
		// 글 전체 조회-글 목록
		List<Map<String, Object>> list = sqlSession.selectList(namespace + "selectAll", searchVo);
		return list;

	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace + "getTotalRecord", searchVo);
	}
	
	@Override
	public int getTotalRecord2(SearchVO searchVo) {
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
	public int insertPick(int no) {
		int cnt = sqlSession.insert(namespace + "insertPick", no);
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
	public int updatePlevel(int no) {
		return sqlSession.update(namespace + "updatePlevel", no);
	}

	@Override
	public int getPickNo(int no) {
		return sqlSession.selectOne(namespace + "getPickNo", no);
	}

	@Override
	public String getPkMem(int no) {
		return sqlSession.selectOne(namespace + "getPkMem", no);
	}

	@Override
	public PayfinishVO selectPayAll(int no) {
		PayfinishVO vo = sqlSession.selectOne(namespace + "selectPayAll", no);
		return vo;
	}

	@Override
	public int insertPayment(PayfinishVO vo) {
		int cnt = sqlSession.insert(namespace + "insertPayment", vo);
		return cnt;
	}

	@Override
	public PaymentVO selectByPay(int no) {
		PaymentVO vo = sqlSession.selectOne(namespace + "selectByPay", no);
		return vo;
	}

	@Override
	public int updatePrice(HashMap<String, Object> map) {
		return sqlSession.update(namespace + "updatePrice", map);
	}

	@Override
	public int getFinalP(int no) {
		return sqlSession.selectOne(namespace + "getFinalP", no);
	}

	@Override
	public int getPLevel(int no) {
		return sqlSession.selectOne(namespace + "getPLevel", no);
	}

	@Override
	public int getPLevel2(int no) {
		return sqlSession.selectOne(namespace + "getPLevel2", no);
	}

	@Override
	public int updateMileage(MemberVO vo) {
		int cnt = sqlSession.update(namespace + "updateMileage", vo);
		return cnt;
	}

	@Override
	public PickAllVO selPvo(int no) {
		return sqlSession.selectOne(namespace + "selPvo", no);
	}

	@Override
	public int deleteReq(int no) {
		int cnt = sqlSession.update(namespace + "deleteReq", no);
		return cnt;
	}

	@Override
	public List<RequestImgVO> selImgName(int no) {
		List<RequestImgVO> list = sqlSession.selectList(namespace + "selImgName", no);

		return list;
	}

	@Override
	public TransacInfoVO ByNoPayment(int no) {
		return sqlSession.selectOne(namespace + "ByNoPayment", no);
	}
	
	@Override
	public int ReqCount() {
		return sqlSession.selectOne(namespace + "ReqCount");
	}

	@Override
	public int pLevel3(int no) {
		return sqlSession.update(namespace + "pLevel3", no);
	}

	@Override
	public int resReq(int no) {
		int cnt = sqlSession.update(namespace + "resReq", no);
		return cnt;
	}

	@Override
	public int getMaxP(int no) {
		return sqlSession.selectOne(namespace + "getMaxP", no);
	}

	@Override
	public List<Map<String, Object>> selectMyAll(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectMyAll", map);
	}

	@Override
	public int getMyTotalRecord(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getMyTotalRecord", map);
	}

	@Override
	public int smemPick(RequestPickVO pvo) {
		return sqlSession.update(namespace + "smemPick", pvo);
	}
	
	@Override
	public int adminUpPrice (HashMap<String, Object> map) {
		return sqlSession.update(namespace + "adminUpPrice", map);
	}

}
