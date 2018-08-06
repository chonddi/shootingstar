package com.ss.star.payment.model;

import java.sql.Timestamp;

public class PaymentVO {

	private int pNo; /* 결제번호 */
	private String memberId; /* 고객ID */
	private String pMethod; /* 결제방법 */
	private int pPrice; /* 결제금액 */
	private int mileage; /* 마일리지사용금액 */
	private int useMile; /* 잔여마일리지 */
	private Timestamp regdate; /* 결제일 */
	private int pickNo; /* 픽번호 */

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getpMethod() {
		return pMethod;
	}

	public void setpMethod(String pMethod) {
		this.pMethod = pMethod;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getPickNo() {
		return pickNo;
	}

	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
	}

	public int getUseMile() {
		return useMile;
	}

	public void setUseMile(int useMile) {
		this.useMile = useMile;
	}

	@Override
	public String toString() {
		return "PaymentVO [pNo=" + pNo + ", memberId=" + memberId + ", pMethod=" + pMethod + ", pPrice=" + pPrice
				+ ", mileage=" + mileage + ", useMile=" + useMile + ", regdate=" + regdate + ", pickNo=" + pickNo + "]";
	}

}
