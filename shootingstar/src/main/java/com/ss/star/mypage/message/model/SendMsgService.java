package com.ss.star.mypage.message.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ss.star.common.SearchVO;

public interface SendMsgService {

	public static final int SESSION_CHECK_OK=1;  //세션과 쪽지정보가 일치
	public static final int SESSION_CHECK_NOTOK=1;  //세션과 쪽지정보가 불일치
	
	
	public int insertAll(SendMsgVO sendMsgVo, String recipient);
	//public List<SendMsgVO > selectMsg(Map<String, String> map);
	public List<Map<String, Object>> selectSendMsg(String userId, String userCode, SearchVO searchVo);
	public int getTotalRecord(String userId, String userCode, SearchVO searchVo);
	public List<Map<String, Object>> selectReceiveMsg(String userId, String userCode, SearchVO searchVo);
	public int getTotalRecordReceive(String userId, String userCode, SearchVO searchVo);
	public Map<String, Object> selectDetail(int sMsgNo);
	public int selectDetailChk(int sMsgNo, HttpSession session);
	public int selectDetailChk2(int sMsgNo, HttpSession session);
	public int updateRead(int sMsgNo);
	public int deleteMulti(Map<String, String[]> map);
	public int rDeleteMulti(Map<String, String[]> map);
	public int deleteMultiAdmin(Map<String, String[]> map);
	public int rDeleteMultiAdmin(Map<String, String[]> map);
}
