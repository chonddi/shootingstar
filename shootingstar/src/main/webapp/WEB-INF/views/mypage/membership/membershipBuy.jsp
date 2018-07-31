<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
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
	width:50%;
    height: 430px;
	text-align: center;
}
.selectName{
	width:50%;
}
.partDiv div{
	float:left;
	width:200px;
	height:300px;
	border:1px solid black;
	border-radius: 10px;
    margin-left: 72px;
    margin-top: 30px;
}
.partDiv div a{
	display: block;
	width:100%;
	height: 100%;
}
</style>
		멤버십 구매
	</div>
	<div class="selectedPage">
		<div class="partDiv">
			<div><a href="#" onclick="payment('1m')"></a></div>
			<div><a href="#" onclick="payment('3m')"></a></div>
			<div><a href="#" onclick="payment('6m')"></a></div>
		</div>
	</div>
</div>

<%@ include file="../../inc/bottom.jsp"%>