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

<title>IndexTest</title>

<!-- 부트스트랩 -->
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

<!-- jquery -->
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/resetCss.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/top.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bottom.css'/>">
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img id="logo"
				alt="ShootingStar" src="<c:url value='/images/로고글자있시.png'/>"
				width="210" /></a>

			<nav id="topMenu">
				<ul>
					<li><a class="menuLink" href="#">ABOUT SHOOTINGSTAR</a>
						<ul>
							<li><a href="#">회사소개</a></li>
							<li><a href="#">인사말</a></li>
						</ul></li>
					<li><a class="menuLink" href="#">REQUEST</a>
						<ul>
							<li><a href="#">견적작성</a></li>
							<li><a href="#">견적목록</a></li>
							<li><a href="#">본인 견적서 상세보기</a></li>
							<li><a href="#">견적 상세조회 (전문가)</a></li>
						</ul></li>
					<li><a class="menuLink" href="#">PORTPOLIO</a>
						<ul>
							<li><a href="#">포트폴리오 목록</a></li>
							<li><a href="#">포트폴리오 상세보기</a></li>
							<li><a href="#">포트폴리오 등록 (전문가)</a></li>
						</ul></li>
					<li><a class="menuLink" href="#">SERVICE</a>
						<ul>
							<li><a href="#">이용방법</a></li>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">Q&A (고객)</a></li>
						</ul></li>
				</ul>
				<ul id="userul">
					<li><img id="userli" alt="마이 페이지"
						src="<c:url value='/images/user.png'/>">
						<ul>
							<li><a href="#">로그인</a></li>
							<li><a href="#">마이페이지</a></li>
							<li><a href="#">내 정보 수정</a></li>
							<li><a href="#">쪽지함</a></li>
							<li><a href="#">나의 거래이력</a></li>
							<li><a href="#">나의 견적현황 조회</a></li>
							<li><a href="#">나의 포트폴리오 조회</a></li>
							<li><a href="#">내 마일리지</a></li>
							<li><a href="#">EMAIL문의</a></li>
						</ul></li>
				</ul>

			</nav>
		</div>
		<div id="mainHeaderAd"
			style="background-image: url('<c:url value='/images/명도수정2.png'/>');">
			<div id="mainSentence">
				나에게 딱 맞는 포토그래퍼를 찾으세요 !
					<p id="mainBtn"><a class="btn btn-info" href="#" role="button" style="width:150px">견적신청</a></p>
				<div id="tableDiv">
					<table id="mainTable" >
						<col width="150" align="center" >
						<col width="150" align="center">
						<col width="150" align="center">
						<col width="150" align="center">
						<tr id="mainTr">
							<td class="border1">등록 전문가 수&nbsp;</td>
							<td class="border2">&nbsp;견적 요청 수&nbsp;</td>
							<td class="border2">&nbsp;요청별 견적서&nbsp;</td>
							<td class="border3">&nbsp;첫 견적 도착시간</td>
						</tr>
						<tr>
							<td class="border1">1업체&nbsp;</td>
							<td class="border2">&nbsp;2개&nbsp;</td>
							<td class="border2">&nbsp;3.2개&nbsp;</td>
							<td class="border3">&nbsp;1.5분</td>
						</tr>
					</table>
				</div>
			</div>

		</div>
	</nav>
<article>