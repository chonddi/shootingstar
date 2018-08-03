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
		$("#edit").click(function(){
			if($("#userid").val() == ""){
				alert("로그인이 필요한 서비스입니다.");
				location.href="<c:url value='/login/login.do'/>";
				return false;
			}else if($("#userCode").val() == 2){
				alert("고객 회원만 이용가능한 서비스입니다.");
				return false;
			}else{
				QwOpen();
			}
			
		});
		
		$("#delete").click(function(){
			if($("#userid").val() == ""){
				alert("로그인이 필요한 서비스입니다.");
				location.href="<c:url value='/login/login.do'/>";
				return false;
			}else if($("#userCode").val() == 2){
				alert("고객 회원만 이용가능한 서비스입니다.");
				return false;
			}else if(confirm("삭제하시겠습니까?")){
				location.href="<c:url value='/SERVICE/Qdelete.do?qNo=${param.qNo}&memberid=${param.memberid}'/>";
			}
		});
		
	});

	function QwOpen(){
		x = (screen.availWidth - 600) / 2;
		y = (screen.availHeight - 500) / 2;
		window.open("<c:url value='/SERVICE/Qedit.do?qNo=${param.qNo}&memberid=${param.memberid}'/>","Q&A 수정","left=" + x + ", top=" + y + ", width=600, height=500, location=yes, resizable=no");
	}
	
</script>
</head>
<body>
<%-- <input type="hidden" id="userid" value="${sessionScope.userid}"> --%>
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
		<a href="#" id="edit">수정</a>
		<a href="#" id="delete">삭제</a>
       	<a href='<c:url value="/SERVICE/Qlist.do"/>'>목록</a>
	</div>
	<br><br>
	
<!-- 댓글 처리 -->
<%@ include file="QR.jsp" %>

<br><br>
</div>
<br>
</body>
</html>

<%@ include file="../inc/bottom.jsp" %>