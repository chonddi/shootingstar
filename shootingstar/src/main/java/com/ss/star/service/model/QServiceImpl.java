package com.ss.star.service.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.star.common.SearchVO;

@Service
public class QServiceImpl implements QService {

	@Autowired
	private QDAO qDao;

	@Override
	public int insertQ(QVO QVo) {
		return qDao.insertQ(QVo);
	}

	@Override
	public List<QVO> selectAll(SearchVO searchVo) {
		return qDao.selectAll(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return qDao.getTotalRecord(searchVo);
	}

	@Override
	public QVO selectByNo(int qNo) {
		return qDao.selectByNo(qNo);
	}

	@Override
	public int insertQR(QRVO QRVo) {
		return qDao.insertQR(QRVo);
	}

	@Override
	public int QRCount() {
		return qDao.QRCount();
	}

	@Override
	public List<QRVO> QRList(int qNo) {
		return qDao.QRList(qNo);
	}

	@Override
	public List<QRVO> QRselectByNo(int qrNo) {
		return qDao.QRselectByNo(qrNo);
	}

	@Override
	public int QRUpdate(QRVO QRVo) {
		return qDao.QRUpdate(QRVo);
	}

	@Override
	public int QRDelete(int qrNo) {
		return qDao.QRDelete(qrNo);
	}

	@Override
	public int QRreply(QRVO QRVo) {
		return qDao.QRreply(QRVo);
	}

	@Override
	public List<QRVO> QRreplyList() {
		return qDao.QRreplyList();
	}

	@Override
	public int updateQ(QVO QVo) {
		return qDao.updateQ(QVo);
	}

	@Override
	public int deleteQ(int qNo) {
		return qDao.deleteQ(qNo);
	}

}
