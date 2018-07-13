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
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- jquery -->
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

<style type="text/css">
/* 초기화 */
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd,
	q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr,
	th, td, article, aside, canvas, details, figcaption, figure, footer,
	header, hgroup, menu, nav, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 100%;
	vertical-align: baseline;
	background: transparent;
}

body {
	line-height: 1;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

nav ul {
	list-style: none;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

a {
	margin: 0;
	padding: 0;
	font-size: 100%;
	vertical-align: baseline;
	background: transparent;
	cursor: default;
	text-decoration: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

/* change border colour to suit your needs */
hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid #cccccc;
	margin: 1em 0;
	padding: 0;
}

input, select {
	vertical-align: middle;
}
</style>
<style type="text/css">
body {
	width: 1920px;
}

#logo {
	margin-bottom: 20px;
	margin-left:
}

.container-fluid {
	background-color: white;
	height: 120px;
	width: 100%;
	padding-left: 330px;
}

#topMenu>ul>li {
	color: white;
	float: left;
	line-height: 30px;
	text-align: center;
	text-decoration: none;
}

#topMenu>ul>li>a {
	text-decoration: none;
}

#topMenu>ul>li>ul>li>a {
	text-decoration: none;
}

#topMenu>ul>li>ul {
	border-radius: 0 0 5px 5px;
	box-shadow: 2px 2px 30px #376092;
}

#topMenu>ul>li>ul>li {
	line-height: 35px;
	border-radius: 0 0 5px 5px;
}

#topMenu .menuLink {
	height: 120px;
	width: 200px;
	color: #376092;
	display: block;
	font-size: 20px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
	display: table-cell;
	vertical-align: middle;
}

#mainHeaderAd {
	width: 100%;
	height: 500px;
	background-repeat: no-repeat;
	background-size: cover;
}

#topMenu .menuLink:hover {
	background-color: #dbeef4;
}

#topMenu ul>li>ul>li:hover {
	background-color: #dbeef4;
}

#topMenu li ul {
	background: white;
	display: none; /* 평상시에는 서브메뉴가 안보이게 하기 */
	height: auto;
	width: 200px;
	position: absolute;
	z-index: 200;
	font-weight: bold;
	color: #376092;
}

#topMenu li:hover ul {
	display: block; /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}

#userul {
	float: right;
	padding-top: 26px;
	padding-right: 300px;
}

#userli {
	margin-left: 65px;
	margin-bottom: 20px;
}
</style>
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
			style="background-image: url('<c:url value='/images/메인수정.png'/>');">

		</div>
	</nav>


</body>
</html>