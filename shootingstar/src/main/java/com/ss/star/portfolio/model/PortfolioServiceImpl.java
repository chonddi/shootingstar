package com.ss.star.portfolio.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.common.SearchVO;

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
	public int getTotalRecord(SearchVO searchVo) {
		return Dao.getTotalRecord(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectPfDetail(int pfNo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = Dao.selectPfDetail(pfNo);
		return list;
	}

	@Override
	public List<reviewVO> selectReview(int pfNo) {
		// TODO Auto-generated method stub
		List<reviewVO> list = Dao.selectReview(pfNo);
		return list;
	}

	@Override
	public PortfolioVO selectBySmemberId(String smemberId) {
		// TODO Auto-generated method stub
		PortfolioVO vo = Dao.selectBySmemberId(smemberId);
		return vo;
	}

}
