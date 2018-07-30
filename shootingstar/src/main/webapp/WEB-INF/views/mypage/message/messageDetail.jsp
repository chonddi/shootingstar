<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지</title>
</head>
<body>
	<table>
		<tr>
			<td>받는사람</td>
			<td>${map['RECIPIENT']}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${map['TITLE']}</td>
		</tr>
		<tr>
			<td>보낸시간</td>
			<td>${map['REGDATE']}</td>
		</tr>
		<tr>
			<td colspan="2">${fn:replace(map['CONTENT'],cn,br) }</td>

		</tr>
	</table>
</body>
</html>