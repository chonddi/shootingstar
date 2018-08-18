package com.ss.star.portfolio.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.common.SearchVO;
import com.ss.star.payment.model.ReviewVO;

@Service
public class PortfolioServiceImpl implements PortfolioService {

	@Autowired
	private PortfolioDAO Dao;

	@Override
	@Transactional
	public int insertPf(PortfolioVO vo, List<Map<String, Object>> list) {
		int cnt = Dao.insertPf(vo);
		int pfNo = vo.getPfNo();
		System.out.println("포트폴리오 등록 결과" + cnt + "pfno=" + vo.getPfNo());
		try {
			for (Map<String, Object> map : list) {
				PortfolioImgVO PfImgVo = new PortfolioImgVO();
				PfImgVo.setFileName((String) map.get("fileName"));
				PfImgVo.setOriginalFileName((String) map.get("originalFileName"));
				PfImgVo.setPfNo(pfNo);
				cnt = Dao.insertPfImg(PfImgVo);
			} // for
		} catch (RuntimeException e) {
			cnt = -1; // rollback시 에러 처리를 위해 cnt값을 -1로 셋팅
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectAllList(SearchVO searchVo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = Dao.selectAllList(searchVo);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> selectAllList2(SearchVO searchVo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = Dao.selectAllList2(searchVo);
		return list;
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return Dao.getTotalRecord(searchVo);
	}

	@Override
	public int updateReadCount(int pfNo) {
		return Dao.updateReadCount(pfNo);
	}
	
	@Override
	public List<Map<String, Object>> selectPfDetail(int pfNo) {
		List<Map<String, Object>> list = Dao.selectPfDetail(pfNo);
		return list;
	}

	@Override
	public PortfolioVO selectBySmemberId(String smemberId) {
		// TODO Auto-generated method stub
		PortfolioVO vo = Dao.selectBySmemberId(smemberId);
		return vo;
	}

	@Override
	public String selectAdd(int pfNo) {
		// TODO Auto-generated method stub
		String address = Dao.selectAdd(pfNo);
		return address;
	}

	@Override
	public List<Map<String, Object>> selectMyPofol(String sMemberId, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("sMemberId", sMemberId);
		map.put("searchVo", searchVo);
		
		return Dao.selectMyPofol(map);
	}

	@Override
	public int getTotalMyPofol(String sMemberId, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("sMemberId", sMemberId);
		map.put("searchVo", searchVo);
		
		return Dao.getTotalMyPofol(map);
	}

	@Override
	public String detailSmemberId(int pfNo) {
		return Dao.detailSmemberId(pfNo);
	}

	@Override
	public String authorityById(String sMemberId) {
		return Dao.authorityById(sMemberId);
	}

	@Override
	public int deleteMulti(List<PortfolioVO> list) {
		int cnt=0;
		try {
			for(PortfolioVO vo : list) {
				int productNo=vo.getPfNo();
				if(productNo>0) {  //선택한 포트폴리오만 삭제
					cnt=Dao.deletePf(productNo);
				}
			}//for
		}catch(RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int resMulti(List<PortfolioVO> list) {
		int cnt=0;
		try {
			for(PortfolioVO vo : list) {
				int productNo=vo.getPfNo();
				if(productNo>0) {  //선택한 포트폴리오만 복원
					cnt=Dao.resPf(productNo);
				}
			}//for
		}catch(RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<PortfolioImgVO> selImgName(int no) {
		List<PortfolioImgVO> list = Dao.selImgName(no);
		return list;
	}

	@Override
	public List<Map<String, Object>> selectPfDetailByN(String sname) {
		List<Map<String, Object>> list = Dao.selectPfDetailByN(sname);
		return list;
	}

	@Override
	public List<ReviewVO> selectReview(String sMemberid, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("sMemberid", sMemberid);
		map.put("searchVo", searchVo);
		
		return Dao.selectReview(map);
	}

	@Override
	public int reviewRecord(SearchVO searchVo) {
		return Dao.reviewRecord(searchVo);
	}

	@Override
	public double reviewSum(String sMemberid) {
		return Dao.reviewSum(sMemberid);
	}

	@Override
	public String selCgname(int pNo) {
		return Dao.selCgname(pNo);
	}

	@Override
	public int comAvg(String sMemberid) {
		return Dao.comAvg(sMemberid);
	}

	@Override
	public int resAvg(String sMemberid) {
		return Dao.resAvg(sMemberid);
	}

	
}
