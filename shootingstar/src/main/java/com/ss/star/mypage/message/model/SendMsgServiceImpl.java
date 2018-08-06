package com.ss.star.mypage.message.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.common.SearchVO;

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
	public List<Map<String, Object>> selectSendMsg(String userId, String userCode, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("sender", userId);
		map.put("code",	userCode);
		map.put("searchVo", searchVo);
		
		List<Map<String, Object>> list = sendMsgDao.selectSendMsg(map);
		return list;
	}

	@Override
	public int getTotalRecord(String userId, String userCode, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("sender", userId);
		map.put("code",	userCode);
		map.put("searchVo", searchVo);
		
		int total =sendMsgDao.getTotalRecord(map);
		
		return total;
	}

	@Override
	public List<Map<String, Object>> selectReceiveMsg(String userId, String userCode, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("recipient", userId);
		map.put("code", userCode);
		map.put("searchVo", searchVo);
		
		List<Map<String, Object>> list = sendMsgDao.selectReceiveMsg(map);
		return list;
	}

	@Override
	public int getTotalRecordReceive(String userId, String userCode, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("recipient", userId);
		map.put("code", userCode);
		map.put("searchVo", searchVo);
		
		int total = sendMsgDao.getTotalRecordReceive(map);
		return total;
	}
	
	@Override
	public Map<String, Object> selectDetail(int sMsgNo) {
		return sendMsgDao.selectDetail(sMsgNo);
	}

	@Override
	public int selectDetailChk(int sMsgNo, HttpSession session) {
		Map<String, Object> map = sendMsgDao.selectDetail(sMsgNo);
		String sender =(String)map.get("sender");
		String code = (String)map.get("code");
		String userid =(String)session.getAttribute("userid");
		//0806ysh
				if(userid==null) {
					userid = (String) session.getAttribute("adminId");
				}
		String userCode= (String)session.getAttribute("userCode");
		System.out.println("sender: "+sender+", code: "+code+", userid: "+userid+", userCode: "+userCode);
		int result = 0;
		if(userid.equals(sender) && 
					code.equals(userCode)){
			result = SESSION_CHECK_OK;
		}else {
			result=SESSION_CHECK_NOTOK;
		}
		System.out.println("result: "+result);
		return result;
	}
	
	@Override
	public int selectDetailChk2(int sMsgNo, HttpSession session) {
		Map<String, Object> map = sendMsgDao.selectDetail(sMsgNo);
		String recipient =(String)map.get("recipient");
		String code = (String)map.get("code");
		String userid =(String)session.getAttribute("userid");
		//0806ysh
				if(userid==null) {
					userid = (String) session.getAttribute("adminId");
				}
		String userCode= (String)session.getAttribute("userCode");
		System.out.println("recipient: "+recipient+", code: "+code+", userid: "+userid+", userCode: "+userCode);
		int result = 0;
		if(userid.equals(recipient) && 
				!code.equals(userCode)){
			result = SESSION_CHECK_OK;
		}else {
			result=SESSION_CHECK_NOTOK;
		}
		System.out.println("result: "+result);
		return result;
	}
	

	@Override
	public int updateRead(int sMsgNo) {
		return sendMsgDao.updateRead(sMsgNo);
	}

	@Override
	public int deleteMulti(Map<String, String[]> map) {
		return sendMsgDao.deleteMulti(map);
	}

	@Override
	public int rDeleteMulti(Map<String, String[]> map) {
		return sendMsgDao.rDeleteMulti(map);
	}

	@Override
	public int deleteMultiAdmin(Map<String, String[]> map) {
		return sendMsgDao.deleteMultiAdmin(map);
	}

	@Override
	public int rDeleteMultiAdmin(Map<String, String[]> map) {
		return sendMsgDao.rDeleteMultiAdmin(map); 
	}


	
	


	
}
