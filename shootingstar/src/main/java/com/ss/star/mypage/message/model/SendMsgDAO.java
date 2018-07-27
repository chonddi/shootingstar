package com.ss.star.mypage.message.model;

import java.util.List;
import java.util.Map;

public interface SendMsgDAO {

	public int insertSendMsg(SendMsgVO sendMsgVo);
	public int insertReceiveMsg(ReceiveMsgVO receiveMsgVo);
	public List<Map<String, Object>> selectSendMsg(Map<String, Object> map);
	public int getTotalRecord(Map<String, Object> map);
	public List<Map<String, Object>> selectReceiveMsg(Map<String, Object> map);
	public int getTotalRecordReceive(Map<String, Object> map);
	public Map<String, Object> selectDetail(int sMsgNo);
	public int updateRead(int sMsgNo);
}
