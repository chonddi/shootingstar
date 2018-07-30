<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").click(function(){
			payOpen();
			self.close();
		});
	});
	
	function btn2(){
		self.close();
	}
	
	function payOpen(){
		x = (screen.availWidth - 840) / 2;
		y = (screen.availHeight - 605) / 2;
		window.open("<c:url value='/payment/port_payment.do'/>","결제창","left=" + x + ", top=" + y + ", width=840, height=605, location=yes, resizable=no");
	}
	
</script>
</head>
<body>
	<p>'홍길동' 전문가님이 홍길동 전문가님이 아직 최종금액을 입력하지 않았습니다.</p>
	<p>* 전문가회원이 최종가격을 입력한 후 결제단계로 이동 가능합니다.</p>
	
	<p>'홍길동' 전문가님이 입력하신 최종 금액은</p>
	<span>'\1000원'</span><span>입니다.</span>
	<p>결제하시겠습니까?</p>
	
	<button id="btn1">예</button><input type="button" onclick='btn2()' value="아니오">
	
	<form name="frm" method="post" action="<c:url value=''/>">
		
		
	</form>
</body>
</html>