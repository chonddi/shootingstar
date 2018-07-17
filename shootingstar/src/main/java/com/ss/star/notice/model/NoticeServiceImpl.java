package com.ss.star.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService{
@Autowired NoticeDAO noticeDao;
	
	@Override
	public List<NoticeVO> selectAll() {
		return noticeDao.selectAll();
	}

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return noticeDao.insertNotice(noticeVo);
	}

}
