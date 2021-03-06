<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 완료</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/payfinish.css'/>" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#rqpay").click(function(){
			location.href="<c:url value='/payment/Tlist.do'/>"
		});
		
		$("#main").click(function(){
			location.href="<c:url value='/index.do'/>"
		});
	});
</script>
</head>
<body>
<form name="fnFrm">
	<section class="sec1">
		<table class="table1">
			<tr>
				<th>결제완료</th>
				<th><img src=<c:url value="/images/pay_result.png"/> alt="결제 단계 이미지"></th>
			</tr>
		</table>		
	</section>
	<section class="sec2">
		<table class="table2">
			<tr>
				<th colspan="2">결제정보</th>
			</tr>
			<tr>
				<th>주문번호</th>
				<th>${vo.pNo}</th>
			</tr>
			<tr>
				<th>결제수단</th>
				<th>${vo.pMethod}</th>
			</tr>
			<tr>
				<th>구매 일시</th>
				<th><fmt:formatDate value="${vo.regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></th>
			</tr>
			<tr>
				<th>카테고리</th>
				<th>${vo.cgName}</th>
			</tr>
			<tr>
				<th>전문가 이름</th>
				<th>${vo.sName}</th>
			</tr>
			<tr>
				<th>전문가 아이디</th>
				<th>${vo.sMemberid}</th>
			</tr>
			<tr>
				<th>결제 금액</th>
				<th><fmt:formatNumber value="${vo.pPrice}" pattern="#,###"/> 원</th>
			</tr>
		</table>
	</section>
	<section class="sec3">
		<input type="button" id="rqpay" class="sec3btn" value="나의 거래 이력">
		<input type="button" id="main" class="sec3btn" value="메인페이지">
	</section>
</form>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>