<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>


<div class="clear" style="width: 100%;">
	<div id="widthDiv">
	<ul id="mypage">
		<li id="edit"><a href="<c:url value='/mypage/memberEdit.do'/>">회원정보수정</a></li>
		<c:if test="${sessionScope.userCode==1}">
			<li id="myRequest"><a href="<c:url value='/mypage/myRequest.do'/>">나의 견적상황</a></li>
			<li id="transaction"><a href="<c:url value='/payment/Tlist.do'/>">나의 거래 내역</a></li>
			<li id="likey"><a href="<c:url value='/mypage/myLikey.do'/>">나의 관심목록</a></li>
			<%-- <li id="myMileage"><a href="<c:url value='/mypage/'/>">내 마일리지</a></li> --%>
		</c:if>
		<c:if test="${sessionScope.userCode==2}">
			<li id="myPofol"><a href="<c:url value='/mypage/myPofol.do'/>">나의 포트폴리오</a></li>
			<li id="transaction"><a href="<c:url value='/payment/Tlist2.do'/>">나의 거래 내역</a></li>
			<li id="membership"><a href="<c:url value='/mypage/membership/membershipList.do'/>">멤버십 관리</a></li>
		</c:if>
		<li id="msg"><a href="<c:url value='/mypage/message/message.do'/>">쪽지함</a></li>
	</ul>
	</div>
	
	<div class="selectName">
