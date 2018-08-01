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
<title>전문가회원 조회</title>
</head>
<body>
<h1>멤버십이 만료되지 않은 전문가회원 목록</h1>
<div>
	<table id="member">
	<thead>
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>만료일자</th>
		<th>권한</th>
		<th>이용제한</th>
		<th>탈퇴/복구</th>
		<th>정보수정</th>
	</tr>
	</thead>
	<tbody>
		<c:if test="${!empty list }"> 
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.rownum }</td>

					<td>${vo.sName}</td>

					<td>${vo.sMemberId}</td>
					<td>${vo.membership }</td>	
					<td>${vo.authority }</td>
<c:if test="${vo.authority=='N'}">
					<td><a href="<c:url value='/admin/member/smemberOut.do?id=${vo.sMemberId}'/>">이용제한</a></td>
</c:if>
<c:if test="${vo.authority=='Y'}">
					<td><a href="<c:url value='/admin/member/smemberBack.do?id=${vo.sMemberId}'/>">권한복구</a></td>
</c:if>
<td></td>
					<td><a href="<c:url value='/admin/member/smemberEdit.do?id=${vo.sMemberId}'/>">정보수정</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	</table>
</div>	
</body>
</html>