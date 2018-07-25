package com.ss.star.notice.model;

import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;

public interface NoticeService {
	public List<NoticeVO> selectAll();
	public int insertNotice (NoticeVO noticeVo);
	public NoticeVO selectByNo (int nNo);
	public int updateNotice(NoticeVO noticeVo);
	public int deleteMulti(Map <String, String[]> map);	
	public int noticeBack(NoticeVO noticeVo);
	public int deleteOne(NoticeVO noticeVo);
	public int getTotalRecord(SearchVO searchVo);
	public List<NoticeVO> selectAllUser();
}
