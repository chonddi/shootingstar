package com.ss.star.faq.model;

import java.util.List;
import java.util.Map;


public interface FaqDAO {
	public int insertFaq (FaqVO faqVo);
	public List<FaqVO> selectAll (String category);
	public List<FaqVO> selectList();
	public int deleteMulti(Map <String, String[]> map);	
	public int deleteOne(FaqVO faqVo);
	public FaqVO selectByNo (int faqNo);
	public int faqBack (FaqVO faqVo);
	public int faqEdit (FaqVO faqVo);
}
