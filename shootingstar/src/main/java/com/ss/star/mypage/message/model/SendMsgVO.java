package com.ss.star.mypage.message.model;

import java.sql.Timestamp;

public class SendMsgVO {

	private int sMsgNo;
	private String sender;
	private String title;
	private String content;
	private String sDelFlag;
	private Timestamp regdate;
	private String code;
	
	public int getsMsgNo() {
		return sMsgNo;
	}
	public void setsMsgNo(int sMsgNo) {
		this.sMsgNo = sMsgNo;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getsDelFlag() {
		return sDelFlag;
	}
	public void setsDelFlag(String sDelFlag) {
		this.sDelFlag = sDelFlag;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "ReceiveMsgVO [sMsgNo=" + sMsgNo + ", sender=" + sender + ", title=" + title + ", content=" + content
				+ ", sDelFlag=" + sDelFlag + ", regdate=" + regdate + ", code=" + code + "]";
	}
	
	
}
