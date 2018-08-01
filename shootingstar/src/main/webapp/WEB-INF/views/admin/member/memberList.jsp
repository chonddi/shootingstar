<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
</script>
<style type="text/css">
th, td{ padding:10px;
}</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객회원 조회</title>
</head>
<body>
<h1>고객회원 목록</h1>
<div>
	<table id="member">
	<thead>
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>이용제한</th>
		<th>정보수정</th>
	</tr>
	</thead>
	<tbody>
		<c:if test="${!empty list }"> 
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.rownum }</td>

					<td>${vo.name}</td>

					<td>${vo.memberId}</td>

					<td>이용제한</td>

					<td><a href="<c:url value='/admin/member/memberEdit.do?id=${vo.memberId}'/>">정보수정</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	</table>
</div>	
</body>
</html>