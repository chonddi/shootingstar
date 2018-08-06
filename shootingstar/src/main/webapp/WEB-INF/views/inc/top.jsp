<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<link rel="SHORTCUT ICON" href="<c:url value='/images/favi.png'/>"/>
<title>ShootingStar</title>

<!-- 부트스트랩 -->
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

<!-- jquery -->
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/resetCss.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/top.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/bottom.css'/>">



</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<a class="navbar-brand" href="<c:url value='/index.do'/>"><img id="logo"
				alt="ShootingStar" src="<c:url value='/images/mainTopLogo.png'/>"
				width="130" /></a>

			<nav id="topMenu">
				<ul>

					<li><a class="menuLink" href="<c:url value='/request/list.do'/>">REQUEST</a>
						<ul>
							<c:if test="${sessionScope.userCode==1}">
								<li><a href="<c:url value='/request/write.do'/>">견적작성</a></li>
								<li><a href="<c:url value='/request/list.do'/>">견적목록</a></li>
							</c:if>
						</ul></li>
					<li><a class="menuLink" href="<c:url value='/portfolio/portfolioList.do'/>">PORTPOLIO</a>
						<ul>
							<c:if test="${sessionScope.userCode==2}">
								<li><a href="<c:url value='/portfolio/portfolioList.do'/>">포트폴리오 목록</a></li>
								<li><a href="<c:url value='/portfolio/portfolioWrite.do'/>">포트폴리오 등록</a></li>
							</c:if>
						</ul></li>
					<li><a class="menuLink" href="<c:url value='/etc/intro.do'/>">ABOUT</a></li>
					<li><a class="menuLink" href="#">SERVICE</a>
						<ul>
							<li><a href="#">이용방법</a></li>
							<li><a href="<c:url value='/notice/noticeList.do'/>">공지사항</a></li>
							<c:if test="${sessionScope.userCode==1}">
								<li><a href="<c:url value='/SERVICE/Qlist.do'/>">Q&A</a></li>
							</c:if>
						</ul></li>
				</ul>
				<ul >
					<li><img id="userli" alt="마이 페이지"
						src="<c:url value='/images/lm.png'/>" style="width:38px; height:88px;">
						<ul id="userul">
						<c:if test="${empty sessionScope.userCode}">
							<li><a href="<c:url value='/login/login.do'/>">로그인</a></li>
							<li><a href="<c:url value='/member/registerMain.do'/>">회원가입</a></li>
						</c:if>
						<c:if test="${!empty sessionScope.userCode}">
							<li><a href="<c:url value='/mypage/memberEdit.do'/>">내 정보 수정</a></li>
						</c:if>
						<c:if test="${sessionScope.userCode==1}">	
							<li><a href="#">나의 견적현황</a></li>
							<li><a href="#">나의 거래이력</a></li>
							<li><a href="#">내 마일리지</a></li>
						</c:if>
						<c:if test="${sessionScope.userCode==2}">
							<li><a href="<c:url value='/mypage/myPofol.do'/>">나의 포트폴리오</a></li>
							<li><a href="#">나의 거래이력</a></li>
							<li><a href="#">EMAIL문의</a></li>
							<li><a href="<c:url value='/mypage/membership/membershipList.do'/>">멤버십 관리</a></li>
						</c:if>	
						<c:if test="${!empty sessionScope.userCode}">
							<li><a href="<c:url value='/mypage/message/message.do'/>">쪽지함</a></li>
							<li><a href="<c:url value='/login/logout.do'/>">로그아웃</a></li>
						</c:if>
						</ul></li>
				</ul>

			</nav>
		</div>
		
	</nav>
	
	<article>