package com.ss.star.payment.model;

public class PayfinishVO {

	private int RQNo; /* 견적글 번호 */
	private int CGNo; /* 카테고리 번호 */
	private String rqRegion; /* 견적요청 주소 */
	private String rqDetail; /* 견적 상세 요청 */
	private String memberId; /* 고객 아이디 */
	private String pickNo; /* pick 번호 */
	private String sMemberid; /* 전문가 아이디 */
	private int sPrice; /* 결제 요금 */
	private String sName; /* 전문가 이름 */
	private String name; /* 고객 이름 */
	private String tel; /* 고객 전화번호 */
	private String pMethod; /* 결제 방법 */
	private double mileage; /* 마일리지 */

	public int getRQNo() {
		return RQNo;
	}

	public void setRQNo(int rQNo) {
		RQNo = rQNo;
	}

	public int getCGNo() {
		return CGNo;
	}

	public void setCGNo(int cGNo) {
		CGNo = cGNo;
	}

	public String getRqRegion() {
		return rqRegion;
	}

	public void setRqRegion(String rqRegion) {
		this.rqRegion = rqRegion;
	}

	public String getRqDetail() {
		return rqDetail;
	}

	public void setRqDetail(String rqDetail) {
		this.rqDetail = rqDetail;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPickNo() {
		return pickNo;
	}

	public void setPickNo(String pickNo) {
		this.pickNo = pickNo;
	}

	public String getsMemberid() {
		return sMemberid;
	}

	public void setsMemberid(String sMemberid) {
		this.sMemberid = sMemberid;
	}

	public int getsPrice() {
		return sPrice;
	}

	public void setsPrice(int sPrice) {
		this.sPrice = sPrice;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getpMethod() {
		return pMethod;
	}

	public void setpMethod(String pMethod) {
		this.pMethod = pMethod;
	}

	public double getMileage() {
		return mileage;
	}

	public void setMileage(double mileage) {
		this.mileage = mileage;
	}

	@Override
	public String toString() {
		return "PayfinishVO [RQNo=" + RQNo + ", CGNo=" + CGNo + ", rqRegion=" + rqRegion + ", rqDetail=" + rqDetail
				+ ", memberId=" + memberId + ", pickNo=" + pickNo + ", sMemberid=" + sMemberid + ", sPrice=" + sPrice
				+ ", sName=" + sName + ", name=" + name + ", tel=" + tel + ", pMethod=" + pMethod + ", mileage="
				+ mileage + "]";
	}

}
