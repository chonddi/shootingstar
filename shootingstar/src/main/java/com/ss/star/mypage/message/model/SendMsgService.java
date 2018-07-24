package com.ss.star.mypage.message.model;

import java.util.List;
import java.util.Map;

public interface SendMsgService {

	public int insertAll(SendMsgVO sendMsgVo, String recipient);
	//public List<SendMsgVO > selectMsg(Map<String, String> map);
	public List<Map<String, Object>> selectSendMsg(String userId, String userCode);
	public List<Map<String, Object>> selectReceiveMsg(String userId, String userCode);
}
