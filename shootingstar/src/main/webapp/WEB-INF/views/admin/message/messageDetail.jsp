<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/msg.css'/>">
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.closeBtn').click(function(){
			self.close();
		});
	});
</script>
<style type="text/css">
#detailTbl td{
	padding-top: 10px;
	padding-right: 10px;
	}
#detailTbl tr:last-child td{
	padding-top: 20px;
	vertical-align: top;
}
</style>
</head>
<body>
<div class="h1">
		<h1>보낸쪽지</h1>
	</div><br>
	<table id="detailTbl">
		<tr class="detailTr">
			<td>받는사람</td>
			<td>${map['RECIPIENT']}</td>	
		</tr>
		<tr class="detailTr">
			<td>제목</td>
			<td>${map['TITLE']}</td>
		</tr>
		<tr class="detailTr">
			<td>보낸시간</td>
			<td><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td colspan="2" style="max-h">${fn:replace(map['CONTENT'],cn,br) }</td>
		</tr>
	</table>
	<div style="text-align: center;">
		<input type="button" class="closeBtn" id="cancel" value="닫기">
	</div>
</body>
</html>