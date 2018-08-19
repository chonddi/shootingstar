<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypageTop.css'/>" />
<script type="text/javascript">
	function payment(period) {
		//결제페이지
		var x = (screen.availWidth - 880) / 2;
		var y = (screen.availHeight - 600) / 2;
		window.open("<c:url value='/mypage/membership/membershipPayment.do?period="+period+"'/>","결제페이지","left=" + x + ", top=" + y + ", width=840, height=600, location=yes, resizable=no");
	}
</script>
<style type="text/css">
.selectedPage{
	width:60%;
    height: 430px;
	text-align: center;
}
.selectName{
	width:50%;
}
.partDiv>div{
	float:left;
	width:250px;
	height:300px;
	border:1px solid black;
	border-radius: 10px;
    margin-left: 72px;
    margin-top: 30px;
    padding-top:50px;
}
.partDiv div a{
	display: block;
	width:100%;
	height: 100%;
}
#membership {
    color: #1f1f1f;
    font-weight: 700;
    border-bottom: 3px solid #e46c0a;
}
.blue{
	color:#2a59a7;
}
.gray{
	color:gray;
}
.bigNum{
	font-size: 1.8em;
}
input[type=button]{
	margin-top:65px;
    width: 200px;
    height: 30px;
    color: white;
    background: #05133e;
    border: none;
}
</style>
		멤버십 구매
	</div>
	<div class="selectedPage">
		<div class="partDiv">
			<div><div>1 개월권</div><br>
				<div><span class="bigNum">9,900</span> won / <span class="blue">month</span><br><br>
				= 9,900 won<span class="gray"> (VAT 포함)</span></div>
				<input type="button" onclick="payment('1m')" value="구매하기">
			</div>
			<div><div>3 개월권</div><br>
				<div><span class="bigNum">8,900</span> won / <span class="blue">month</span><br><br>
				= 26,700 won<span class="gray"> (VAT 포함)</span></div>
				<input type="button" onclick="payment('3m')" value="구매하기">
			</div>
			<div><div>6 개월권</div><br>
				<div><span class="bigNum">7,900</span> won / <span class="blue">month</span><br><br>
				= 47,400 won<span class="gray"> (VAT 포함)</span></div>
				<input type="button" onclick="payment('6m')" value="구매하기">
			</div>
		</div>
	</div>
</div>

<form name="paymentFrm" method="post" action="<c:url value='/mypage/membership/membershipPayment.do'/>">
	<input type="hidden" id="pPrice" name="pPrice">
	<input type="hidden" id="pContent" name="pContent">
	<input type="hidden" id="pMethod" name="pMethod" value="card">
	<input type="hidden" id="period" name="period">
</form>
<%@ include file="../../inc/bottom.jsp"%>