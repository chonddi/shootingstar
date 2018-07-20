<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Q&A 상세보기</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/QdetailStyle.css'/>" />
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body>
<br>
	<% pageContext.setAttribute("newLine", "\r\n"); %>
	<c:set var="qContent" value="${fn:replace(vo.qContent, newLine, '<br>') }" />
	
	<h2>Q&A 상세보기</h2>
	<br>
	<table class="firstDiv">
		<tr>
			<th id="sp1">${vo.qTitle}</th>
			<th id="sp2"><fmt:formatDate value="${vo.regdate}" pattern="yyyy.MM.dd. HH:mm:ss"/></th>
		</tr>
	</table>
	<div class="divForm">
		<div class="idDiv">
			<span>${vo.memberid}</span>
		</div>
		<div class="lastDiv">			
			<p class="qContent">${qContent}</p>
		</div>
		<div class="center">
			<a href='<c:url value="/SERVICE/Qedit.do?qNo=${param.qNo}"/>'>수정</a>
        	<a href='<c:url value="/SERIVCE/Qdelete.do?qNo=${param.qNo}"/>'>삭제</a>
        	<a href='<c:url value="/SERVICE/Qlist.do"/>'>목록</a>
		</div>
		
	<!-- 댓글 처리 -->
	<%@ include file="QR.jsp" %>

</div>
<br>
</body>
</html>

<%@ include file="../inc/bottom.jsp" %>