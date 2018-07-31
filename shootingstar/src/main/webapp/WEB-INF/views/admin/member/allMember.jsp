<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모든 멤버 조회</title>
</head>
<body>
<div>
	<table id="allMember">
	<thead>
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>카테고리</th>
		<th>이용제한</th>
		<th>정보수정</th>
	</tr>
	</thead>
	<tbody>
		<c:if test="${!empty list }"> 
			<c:forEach var="vo" items="${list}">
				<tr>
					<td></td>

					<td>${vo.name}</td>

					<td>${vo.memberId}</td>

					<td>고객/전문가</td>

					<td>이용제한</td>

					<td>정보수정</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	</table>
</div>	
</body>
</html>