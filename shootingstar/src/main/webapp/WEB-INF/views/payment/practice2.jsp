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
	<form name="frm" method="post" action="<c:url value=''/>">
		
		
	</form>
</body>
</html>