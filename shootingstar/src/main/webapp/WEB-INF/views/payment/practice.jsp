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
			location.href="<c:url value='/payment/practice2.do'/>";
		});
	});
	
	function payOpen(){
		x = (screen.availWidth - 600) / 2;
		y = (screen.availHeight - 500) / 2;
		window.open("<c:url value='/payment/practice2.do'/>","결제 확인창","left=" + x + ", top=" + y + ", width=600, height=500, location=yes, resizable=no");
	}
</script>
</head>
<body>

	<input type="button" id="btn1" value="결제하기">
	
</body>
</html>