package com.ss.star.mypage.message.model;

public class ReceiveMsgVO {

	private int rMsgNo;
	private int  sMsgNo;
	private String recipient;
	private String rDelFlag;
	private String readFlag;
	public int getrMsgNo() {
		return rMsgNo;
	}
	public void setrMsgNo(int rMsgNo) {
		this.rMsgNo = rMsgNo;
	}
	public int getsMsgNo() {
		return sMsgNo;
	}
	public void setsMsgNo(int sMsgNo) {
		this.sMsgNo = sMsgNo;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getrDelFlag() {
		return rDelFlag;
	}
	public void setrDelFlag(String rDelFlag) {
		this.rDelFlag = rDelFlag;
	}
	public String getReadFlag() {
		return readFlag;
	}
	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}
	@Override
	public String toString() {
		return "ReceiveMsgVO [rMsgNo=" + rMsgNo + ", sMsgNo=" + sMsgNo + ", recipient=" + recipient + ", rDelFlag="
				+ rDelFlag + ", readFlag=" + readFlag + "]";
	}
	
	
}
