package com.ss.star.request.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.common.SearchVO;
import com.ss.star.member.model.MemberVO;
import com.ss.star.payment.model.PayfinishVO;
import com.ss.star.payment.model.PaymentVO;
import com.ss.star.payment.model.TransacInfoVO;

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
	public List<Map<String, Object>> selectAll(SearchVO searchVo) {
		return requestDao.selectAll(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return requestDao.getTotalRecord(searchVo);
	}
	
	@Override
	public int getTotalRecord2(SearchVO searchVo) {
		return requestDao.getTotalRecord2(searchVo);
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
	public int insertPick(int no) {
		return requestDao.insertPick(no);
		
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
	public int updatePlevel(int no) {
		return requestDao.updatePlevel(no);
	}

	@Override
	public int getPickNo(int no) {
		return requestDao.getPickNo(no);
	}

	@Override
	public String getPkMem(int no) {
		return requestDao.getPkMem(no);
	}

	@Override
	public PayfinishVO selectPayAll(int no) {
		return requestDao.selectPayAll(no);
	}

	@Override
	public int insertPayment(PayfinishVO vo) {
		return requestDao.insertPayment(vo);
	}

	@Override
	public PaymentVO selectByPay(int no) {
		return requestDao.selectByPay(no);
	}

	@Override
	public int updatePrice(HashMap<String, Object> map) {
		return requestDao.updatePrice(map);
	}

	@Override
	public int getFinalP(int no) {
		return requestDao.getFinalP(no);
	}

	@Override
	public int getPLevel(int no) {
		return requestDao.getPLevel(no);
	}

	@Override
	public int getPLevel2(int no) {
		return requestDao.getPLevel2(no);
	}

	@Override
	public int updateMileage(MemberVO vo) {
		return requestDao.updateMileage(vo);
	}

	@Override
	public PickAllVO selPvo(int no) {
		return requestDao.selPvo(no);
	}

	@Override
	public int deleteMulti(List<RequestVO> list) {
		int cnt=0;
		try {
			for(RequestVO vo : list) {
				int productNo=vo.getRQNo();
				if(productNo>0) {  //선택한 견적글만 삭제
					cnt=requestDao.deleteReq(productNo);
				}
			}//for
		}catch(RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<RequestImgVO> selImgName(int no) {
		return requestDao.selImgName(no);
	}
	
	@Override
	public TransacInfoVO ByNoPayment(int no) {
		return requestDao.ByNoPayment(no);
	}
	
	@Override
	public int ReqCount() {
		return requestDao.ReqCount();
	}

	@Override
	public int pLevel3(int no) {
		return requestDao.pLevel3(no);
	}

	@Override
	public int resMulti(List<RequestVO> list) {
		int cnt=0;
		try {
			for(RequestVO vo : list) {
				int productNo=vo.getRQNo();
				if(productNo>0) {  //선택한 견적글만 복원
					cnt=requestDao.resReq(productNo);
				}
			}//for
		}catch(RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int getMaxP(int no) {
		int maxp=requestDao.getMaxP(no);
		
		String check=String.valueOf(maxp);
		int result=0;
		
		if(check!=null) {
			result=maxp;
		}else {
			result=0;
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> selectMyAll(String memberId, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("searchVo", searchVo);
		
		return requestDao.selectMyAll(map);
	}

	@Override
	public int getMyTotalRecord(String memberId, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("searchVo", searchVo);
		
		return requestDao.getMyTotalRecord(map);
	}

	@Override
	public int smemPick(RequestPickVO pvo) {
		
		int result;
		int no = pvo.getRQNo();
		int seq = requestDao.getPickCount(no);

		if (seq < 5) {
			int seq1 = requestDao.smemPick(pvo);
			int seq2 = requestDao.updatePick(no);
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
	
	@Override
	public int adminUpPrice (HashMap<String, Object> map) {
		return requestDao.adminUpPrice(map);
		
	}
	
	


}
