package com.ss.star.mypage.message.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SendMsgServiceImpl implements SendMsgService{

	@Autowired private SendMsgDAO sendMsgDao;

	@Override
	@Transactional
	public int insertAll(SendMsgVO sendMsgVo, String recipient) {
		int cnt = 0;
		
		try {
			cnt=sendMsgDao.insertSendMsg(sendMsgVo);
			int sMsgNo=sendMsgVo.getsMsgNo();
			
			ReceiveMsgVO receiveMsgVo = new ReceiveMsgVO();
			receiveMsgVo.setsMsgNo(sMsgNo);
			receiveMsgVo.setRecipient(recipient);
			cnt=sendMsgDao.insertReceiveMsg(receiveMsgVo);
		}catch(RuntimeException e) {
			cnt=-1;	//rollback 처리값
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectSendMsg(String userId, String userCode) {
		Map<String, String> map = new HashMap<>();
		map.put("sender", userId);
		map.put("code",	userCode);
		
		List<Map<String, Object>> list = sendMsgDao.selectSendMsg(map);
		return list;
	}

	@Override
	public List<Map<String, Object>> selectReceiveMsg(String userId, String userCode) {
		Map<String, String> map = new HashMap<>();
		map.put("recipient", userId);
		map.put("code", userCode);
		
		List<Map<String, Object>> list = sendMsgDao.selectReceiveMsg(map);
		
		return list;
	}


	
}
