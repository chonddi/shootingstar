package com.ss.star.mypage.message.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SendMsgServiceImpl implements SendMsgService{

	@Autowired private SendMsgDAO sendMsgDao;
	
	@Override
	public int insertSendMsg(SendMsgVO sendMsgVo) {
		return sendMsgDao.insertSendMsg(sendMsgVo);
	}

}
