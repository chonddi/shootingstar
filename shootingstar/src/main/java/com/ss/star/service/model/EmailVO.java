package com.ss.star.service.model;

public class EmailVO {

	private String sName;
	private String email;
	private String tel;
	private String content;

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "EmailVO [sName=" + sName + ", email=" + email + ", tel=" + tel + ", content=" + content + "]";
	}

}
