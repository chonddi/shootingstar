<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style type="text/css">
#mypage{
	float:left;
	width:15%;
}
#mypage div{
	margin-top:30px;
	text-align: center;
	padding:15px;
	border:3px solid #345f93;
	border-radius: 10px;
}
#selectedPage{
	float:right;
	margin-top:30px;
	width:80%;
	border:3px solid #345f93;
	border-radius:40px;
	padding:30px;
}
.clear:after{
	clear:both;
	content:'';
	display: block;
}
</style>
<div class="clear">
	<div id="mypage">
		<div id="edit"><a href="<c:url value='/mypage/memberEdit.do'/>">회원정보수정</a></div>
		<div id="myRequest"><a href="<c:url value='/mypage/myRequest.do'/>">나의 견적상황</a></div>
		<div id="transaction"><a>나의 거래 이력</a></div>
		<div id="likey"><a>나의 관심목록</a></div>
		<div id="myMileage"><a>내 마일리지</a></div>
		<div id="msg"><a href="<c:url value='/mypage/message/message.do'/>">쪽지함</a></div>
	</div>
	
	<div id="selectedPage">
