package com.ss.star.notice.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.common.SearchVO;

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

	@Override
	public NoticeVO selectByNo(int nNo) {
		return noticeDao.selectByNo(nNo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return noticeDao.updateNotice(noticeVo);
	}

	@Override
	@Transactional
	public int deleteMulti(Map<String, String[]> map) {
		int cnt=noticeDao.deleteMulti(map);
		return cnt;
	}

	@Override
	public int noticeBack(NoticeVO noticeVo) {
		return noticeDao.noticeBack(noticeVo);
	}

	@Override
	public int deleteOne(NoticeVO noticeVo) {
		return noticeDao.deleteOne(noticeVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return noticeDao.getTotalRecord(searchVo);
	}

	@Override
	public List<NoticeVO> selectAllUser() {
		return noticeDao.selectAllUser();
	}

}
