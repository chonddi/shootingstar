<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 완료</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/payfinish.css'/>" />
</head>
<body>
<form name="fnFrm">
	<section class="sec1">
		<table class="table1">
			<tr>
				<th>주문완료</th>
				<th>단계 이미지</th>
			</tr>
		</table>		
	</section>
	<section>
		<table class="table2">
			<tr>
				<th colspan="1">결제정보</th>
			</tr>
			<tr>
				<th>결제수단</th>
				<th></th>
			</tr>
			<tr>
				<th>주문번호</th>
				<th></th>
			</tr>
			<tr>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th></th>
				<th></th>
			</tr>
		</table>
	</section>
</form>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>