<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>슈팅스타 공지사항</title>
</head>
<body>
<h1>공지사항</h1>
<hr>
<div id="notice">
<table class="notice">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan=3>공지사항이 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${!empty list }">
		<tr>
		<!--for 돌려서 db 출력  -->
			<td>1</td>
			<td>공지사항입니다</td>
			<td>2018-07-16</td>
		</tr>
		<tr>
			<td colspan=3>https://caramel.ly/center/notice</td>
		</tr>
	</c:if>
	</tbody>
	<!-- for 끝 -->
</table>
</div>
<!-- 검색없음!!! 페이징!!! -->
</body>
</html>