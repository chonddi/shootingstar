<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/adminTop.jsp" %>
 <link rel="stylesheet" type="text/css"
	href="<c:url value='/css/adminTop.css'/>">

<style type="text/css">

article{
text-align: center;

}
</style>
<article id="ma">
	<h1>슈팅스타 관리자 페이지</h1>
	<p>메인화면입니다</p>
	<br><br>
	<img src="<c:url value='/images/adminMainImg.png'/>" width='500px' />
</article>

<%@ include file="../inc/adminBottom.jsp" %>