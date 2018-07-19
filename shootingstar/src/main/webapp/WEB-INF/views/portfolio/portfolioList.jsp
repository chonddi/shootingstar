<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<head>
<style type="text/css">
body {
	clear: both;
}

#portfolioListSideBar {
	float: left;
	border-radius: 5px;
	font-weight: bold;
	width: 200px;
	height: 500px;
}

#portfolioListSideBar li:not (.active ) a {
	padding-left: 15px;
}

.nav {
	padding-left: 10px;
}

#portSearch {
	margin-left: 220px;
	width: 1030px;
	height: 1000px;
}

.col-lg-6 {
	margin-left: 300px;
	margin-top: 5px;
}

#topSearch {
	float: left;
	width: 130px;
	height: 35px;
	line-height: 35px;
	margin-left: 10px;
	font-size: 13px;
	font-weight: bold;
}

#topSearch span {
	font-size: 1.1em;
	color: #2782ec;
}

.dropdown-menu {
	margin-left: 950px;
}

#portList {
	border-top: 1px solid #e8e8e8;
	width: 1030px;
	height: 200px;
	padding: 10px;
	margin-top: 10px;
}

#portList img {
	height: 100%;
	float: left;
	padding-right: 20px;
}

#dropdownMenu1 {
	margin-top: 5px;
}

#portName {
	font-size: 40px;
	margin-top: 10px;
	font-weight: bold;
}

#photoInfo {
	margin-top: 110px;
	font-weight: bold;
}
.phothgrahper{
	font-size: 0.8em;
	color:#9999b3;
	font-weight: normal;
	margin-left: 5px;
}
</style>
</head>
<body>
	<div></div>
	<div id="portfolioListSideBar">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" class="active"><a>카테고리</a></li>
			<li role="presentation"><a href="#">전체보기</a></li>
			<li role="presentation"><a href="#">프로필</a></li>
			<li role="presentation"><a href="#">푸드</a></li>
			<li role="presentation"><a href="#">패션</a></li>
			<li role="presentation"><a href="#">웨딩</a></li>
			<li role="presentation"><a href="#">행사</a></li>
			<li role="presentation"><a href="#">인테리어</a></li>
			<li role="presentation"><a href="#">공연</a></li>
			<li role="presentation"><a href="#">광고</a></li>
			<li role="presentation"><a href="#">스냅사진</a></li>
		</ul>
	</div>
	<div id="portSearch">
		<div id="topSearch">
			(카테이름) : <span>333개</span>
		</div>
		<div class="col-lg-6">
			<div class="input-group">
				<input type="text" class="form-control"
					placeholder="작가명, 포트폴리오 타이틀로 검색"> <span
					class="input-group-btn">
					<button class="btn btn-default" type="button">Go!</button>
				</span>
			</div>
		</div>
		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button"
				id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
				정렬 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">최근등록순</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">인기순</a></li>
			</ul>
		</div>
		<div id="portList">

			<img alt="" src="<c:url value='/images/party.jpg'/>">
			<div id="listInfo">
				<div id="portName">포트폴리오 제목입니다 ~!</div>
				<div id="photoInfo">
					<span class="phothgrahper">phothgrahper</span> <span>(이름)</span> <span class="phothgrahper">(카테고리)</span>
				</div>
			</div>
		</div>
		<hr>
	</div>
</body>
<%@ include file="../inc/bottom.jsp"%>