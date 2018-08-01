<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>message.jsp</title>
</head>
<body>
	
	<script type="text/javascript">
		console.log('msg=${msg}');
		console.log('url=${url}');
		<c:if test="${!empty msg }">
			alert("${msg}");
		</c:if>
		location.href="<c:url value='${url}'/>";
	</script>
	
</body>
</html>






