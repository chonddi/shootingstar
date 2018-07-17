package com.ss.star.notice.model;

import java.util.List;

public interface NoticeService {
	public List<NoticeVO> selectAll();
	public int insertNotice (NoticeVO noticeVo);

}
