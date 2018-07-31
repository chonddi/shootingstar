package com.ss.star.request.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.payment.model.PayfinishVO;

@Service
public class RequestServiceImpl implements RequestService {

	@Autowired
	private RequestDAO requestDao;

	@Override
	@Transactional
	public int insertRequest(RequestVO vo, List<Map<String, Object>> fileList) {

		int cnt = requestDao.insertRequest(vo);
		int rqNo = vo.getRQNo();
		try {
			for (Map<String, Object> map : fileList) {
				RequestImgVO ivo = new RequestImgVO();
				ivo.setFileName((String) map.get("fileName"));
				ivo.setOriginalFileName((String) map.get("originalFileName"));
				ivo.setRQNo(rqNo);
				cnt = requestDao.insertReqImg(ivo);
			} // for
		} catch (RuntimeException e) {
			cnt = -1; // rollback시 에러 처리를 위해 cnt값을 -1로 셋팅
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<RequestVO> selectAll(ctgRequestVO searchVo) {
		return requestDao.selectAll(searchVo);
	}

	@Override
	public int getTotalRecord(ctgRequestVO searchVo) {
		return requestDao.getTotalRecord(searchVo);
	}

	@Override
	public RequestVO selectByNo(int no) {
		return requestDao.selectByNo(no);

	}

	@Override
	public List<RequestImgVO> selectByNoImg(int no) {
		return requestDao.selectByNoImg(no);
	}

	@Override
	public int insertPick(RequestPickVO pvo) {

		int pno = pvo.getRQNo();
		int result;
		int seq = requestDao.getPickCount(pno);

		if (seq < 5) {
			int seq1 = requestDao.insertPick(pvo);
			int seq2 = requestDao.updatePick(pno);

			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	@Override
	public List<RequestPickVO> pickByNo(int no) {
		return requestDao.pickByNo(no);
	}

	@Override
	public List<PickAllVO> selectPList(int no) {
		return requestDao.selectPList(no);
	}

	@Override
	public PickAllVO selectByPick(int no) {
		return requestDao.selectByPick(no);
	}

	@Override
	public PayfinishVO selectAll(int no) {
		return requestDao.selectAll(no);
	}

	@Override
	public int insertPayment(PayfinishVO vo) {
		return requestDao.insertPayment(vo);
	}

}
