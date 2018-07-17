<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<head>
<style type="text/css">
#portfolioListSideBar{
	border:1px solid #337ab7;
	border-radius:5px;
	font-weight:bold;
	width:200px;
}
#portfolioListSideBar li:first-child{

}
#portfolioListSideBar li:not(.active) a{
	padding-left: 15px;
}
</style>
</head>
<body>
	<div id="portfolioListSideBar">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" class="active"><a>카테고리</a></li>
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
</body>
<%@ include file="../inc/bottom.jsp"%>