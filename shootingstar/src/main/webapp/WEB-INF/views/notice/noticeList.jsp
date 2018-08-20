<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp"%>
<%
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>슈팅스타 공지사항</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Do+Hyeon&subset=korean');
.mytitle{
	font-family: 'Do Hyeon', sans-serif;
	font-weight:lighter;
	font-size: 35px;
}	
#quest{
	width:70px;
	vertical-align: middle;
	font-weight: bold;
}
#width{padding-left:200px;
	padding-right:200px;}
#titleNo{
	font-weight: bold;
	width:70px;
	vertical-align: middle;
}
th{
vertical-align: middle;}
td{
vertical-align: middle;}
.noticediv{
width:1300px;
margin: 50px auto;
}
</style>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/notice.css'/>" />

<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
$('.notice .tbody .content').hide(); //내용(짝수tr) 숨김
	
$('.notice .tbody .title').find('#title').click(function(){
	$(this).parent().next().toggle();
});
});
</SCRIPT>
</head>
<body>
<div class="noticediv">
<span class="mytitle">공지사항</span>

 <table class="notice">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th colspan=2>날짜</th>

		</tr>

	</thead>
	<tbody class="tbody">

 	<c:if test="${empty list }">
	 	<tr>
			<td colspan=4>공지사항이 없습니다</td>
		</tr>
	</c:if>
	
	<c:if test="${!empty list }"> 
	<!--for 돌려서 db 출력  -->
		<c:forEach var="vo" items="${list}">
		<tr class="title">
			<td id="titleNo">${vo.nNo}.</td>
			<td id="title">
			
				<c:if test="${fn:length(vo.nTitle)>40}">
				${fn:substring(vo.nTitle, 0, 40)}...
				</c:if>
				<c:if test="${fn:length(vo.nTitle)<=40}">
				${vo.nTitle}
				</c:if>
				
			</td>
			<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
			<td id="icon" class="off" width="50px">
				
			</td>
		</tr>
		<tr class="content">
			<td colspan=4>
			<div id="width">${fn:replace(vo.nContent, cn, br)}</div></td>
		</tr>

		</c:forEach>
	<!-- for 끝 -->
	</c:if> 
	</tbody>
</table>   
</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>