package com.ss.star.admin.model;

import java.sql.Timestamp;

public class ManagerVO {

	private String adminId;
	private String adminName;
	private String pwd;
	private Timestamp regdate;

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ManagerVO [adminId=" + adminId + ", adminName=" + adminName + ", pwd=" + pwd + ", regdate=" + regdate
				+ "]";
	}

}
