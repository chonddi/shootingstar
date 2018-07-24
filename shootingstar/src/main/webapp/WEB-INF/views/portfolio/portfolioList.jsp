<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<head>

<link href="<c:url value='/css/portfolioList.css'/>" rel="stylesheet">

<style type="text/css">
</style>

</head>
<body>
	<div></div>
	<div id="portfolioListSideBar">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" class="active"><a>카테고리</a></li>
		<c:forEach var="vo" items="${list }">
		<li role="presentation" value=""><a>${vo.cgName}</a></li>
		</c:forEach>
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