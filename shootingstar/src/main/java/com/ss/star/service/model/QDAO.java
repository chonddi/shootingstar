package com.ss.star.service.model;

import java.util.List;

import com.ss.star.common.SearchVO;

public interface QDAO {
	
	//Q&A
	public int insertQ(QVO QVo);
	public List<QVO> selectAll(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public QVO selectByNo(int qNo);
	public int updateQ(QVO QVo);
	public int deleteQ(int qNo);
	
	//Q&A 댓글
	public int insertQR(QRVO QRVo);
    public int QRCount();
    public List<QRVO> QRList(int qNo);
    public int QRUpdate(QRVO QRVo);
    public int QRDelete(int qrNo);
    public List<QRVO> QRselectByNo(int qrNo);
    public int QRreply(QRVO QRVo);
    public List<QRVO> QRreplyList();
	
	/*public int getTotalRecord(SearchVO searchVo);
	public int updateReadCount(int no);
	
	public String selectPwd(int no);
	public int updateBoard(BoardVO vo);
	public int deleteBoard(BoardVO vo);
	public int deleteMulti(Map<String, String[]> map);
	public List<BoardVO> selectMainNotice();*/

}
