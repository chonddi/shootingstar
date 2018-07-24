<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp"%>

<!DOCTYPE html>	
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">
<title>Insert title here</title>
</head>

<body><br>
<span id="title"><h2> 어떤 촬영이 필요하신가요? </h2></span>
<br><br><br>

<table id="cgSelect">
	<thead>
		<tr>
			<th><form name="frmWrite1" method="post" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)"><input type=image src="../images/profile.jpg" id="img1"  name="cg1" value="인물/프로필"></form></th>
			<th><form name="frmWrite1" method="post" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)"><button type='submit' id="fw1" name="cg1" value="푸드">푸드</button></form></th>
			<th><form name="frmWrite1" method="post" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)"><button type='submit' id="fw1" name="cg1" value="패션">패션</button></form></th>
		</tr>
		<tr>
			<th><form name="frmWrite1" method="post" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)"><button type='submit' id="fw1" name="cg1" value="웨딩">웨딩</button></form></th>
			<th><form name="frmWrite1" method="post" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)"><button type='submit' id="fw1" name="cg1" value="행사/컨퍼런스">행사/컨퍼런스</button></form></th>
			<th><form name="frmWrite1" method="post" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)"><button type='submit' id="fw1" name="cg1" value="건축/인테리어">건축/인테리어</button></form></th>
		</tr>
		<tr>
			<th><form name="frmWrite1" method="post" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)"><button type='submit' id="fw1" name="cg1" value="공연">공연</button></form></th>
			<th><form name="frmWrite1" method="post" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)"><button type='submit' id="fw1" name="cg1" value="광고">광고</button></form></th>
			<th><form name="frmWrite1" method="post" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)"><button type='submit' id="fw1" name="cg1" value="스냅사진">스냅사진</button></form></th>
		</tr>
	</thead>
</table>


</body>
</html>
<%@ include file="../inc/bottom.jsp"%>