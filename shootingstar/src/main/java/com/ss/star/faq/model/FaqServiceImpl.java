package com.ss.star.faq.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqServiceImpl implements FaqService {
@Autowired FaqDAO faqDao;

	@Override
	public int insertFaq(FaqVO faqVo) {
		return faqDao.insertFaq(faqVo);
	}

	@Override
	public List<FaqVO> selectAll(String category) {
		return faqDao.selectAll(category);
	}

	@Override
	public List<FaqVO> selectList() {
		return faqDao.selectList();
	}

	@Override
	public int deleteMulti(Map<String, String[]> map) {
		return faqDao.deleteMulti(map);
	}

	@Override
	public int deleteOne(FaqVO faqVo) {
		return faqDao.deleteOne(faqVo);
	}

	@Override
	public FaqVO selectByNo(int faqNo) {
		return faqDao.selectByNo(faqNo);
	}

	@Override
	public int faqBack(FaqVO faqVo) {
		return faqDao.faqBack(faqVo);
	}

	@Override
	public int faqEdit(FaqVO faqVo) {
		return faqDao.faqEdit(faqVo);
	}

}
