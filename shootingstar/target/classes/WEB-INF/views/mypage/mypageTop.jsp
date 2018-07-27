<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style type="text/css">
.clear{
	font-family: Roboto,Noto Sans Korean,Arial,Arial Black,Tahoma,Trebuchet MS,Verdana;
	
}
#widthDiv{
	width:100%;
	color:#1f1f1f;
	background: #202d42!important;
	height:45px;
}
#mypage{
	width:60%;
	height:100%;
	margin:0 auto;
}
#mypage li{
	float:left;
	padding: 0px 17px;
	padding-top:14px;
	height: 100%;
	font-size: 0.9em;
}
#mypage li a{
	color:white;
}

#mypage li:hover, #mypage li a:hover{
	cursor: pointer;
} 
#mypage li a:active, #mypage li a:visited{
	text-decoration: none;
}
.selectedPage{
	margin: 0 auto;
	margin-top:25px;
	width:60%;
	border:1px solid #d9d9d9;
	padding:30px;
	background: #fff;
	box-shadow: 0 5px 8px 0 rgba(0,0,0,.04);
}
.clear:after{
	clear:both;
	content:'';
	display: block;
}
article{
	width: 100%;
    margin-top: 70px;
    background: #f6f6f6;
    padding-bottom: 50px;
}
.selectName{
	width:60%;
	margin:0 auto;
	margin-top:50px;
	font-size: 1.5em;
	font-weight: bold;
	padding-left:20px;
}

</style>
<div class="clear" style="width: 100%;">
	<div id="widthDiv">
	<ul id="mypage">
		<li id="edit"><a href="<c:url value='/mypage/memberEdit.do'/>">회원정보수정</a></li>
		<li id="myRequest"><a href="<c:url value='/mypage/myRequest.do'/>">나의 견적상황</a></li>
		<li id="transaction"><a href="<c:url value='/mypage/'/>">나의 거래 이력</a></li>
		<li id="likey"><a href="<c:url value='/mypage/'/>">나의 관심목록</a></li>
		<li id="myMileage"><a href="<c:url value='/mypage/'/>">내 마일리지</a></li>
		<li id="msg"><a href="<c:url value='/mypage/message/message.do'/>">쪽지함</a></li>
	</ul>
	</div>
	
	<div class="selectName">
