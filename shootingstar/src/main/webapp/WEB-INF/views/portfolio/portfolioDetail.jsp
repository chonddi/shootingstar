<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/detailTop.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/justifiedGallery.css" />
<script src="${pageContext.request.contextPath}/js/jquery.justifiedGallery.js"></script>
<head>
<script type="text/javascript">
$(document).ready(function() {
	$("#mygallery").justifiedGallery();
});
	/* $(document).ready(function(e) {
	 $(".imgBox").each(function() {
	 var wid = $('.imgBox').width();
	 var hei = $('.imgBox').height();
	 var ratio = wid/hei;
	 alert(ratio);
	 if(ratio>1){
	
	 $('.imgBox').css({
	 width : '200px',
	 height : '290px'
	 }).appendTo('#imgContainer')
	
	 }else{
	
	 $('.imgBox').css({
	 width : '430px',
	 height : '290px'
	 }).appendTo('#imgContainer')
	 }
	 }
	 }); */

	/* 	$(document).ready(function(e) {

	 $(".imgBox").each(function() {
	 $(this).load(function() { //이미지를 다 불러온후 확인하기 위해
	 var imgWidth = this.width(); //이미지 크키가 정해져 있지 않을때
	 //var imgWidth2 = $(this).width(); //이미지 크키가 정해져 있을때
	 var imgHeight = this.height();
	 var ratio = imgWidth + imgHeigth / imgWidth;
	 if (ratio > 1) {
	 this.element.css('width', 200).css('height', 290);
	 } else {
	 this.element.css('width', 430).css('height', 290);
	 }
	 });
	 });
	 }); */
</script>

<style type="text/css">
#detailArticle {
	margin: 0 auto;
	width: 1235px;
}

#detailTitle {
	width: 1903px;
	height: 400px;
	background-image: url("<c:url value='/images/명도수정2.png'/>");
	background-repeat: no-repeat;
	background-size: cover;
}

#pfTitle {
	color: white;
	font-size: 45px;
}

#pfTitle2 {
	color: white;
	font-size: 20px;
}

#topCategory {
	font-size: 0.8em;
	color: #dedede;
}

#titleSentence {
	padding-left: 330px;
	padding-top: 250px;
}

#pfTitle2 {
	margin-top: 10px;
	font-weight: bold;
}

.nav-pills {
	font-weight: bold;
}

#imgContainer {
	width: 100%;
	height: auto;
	background-color: black;
	padding: 5px;
}

.imgBox {
	max-height: 290px;
	max-width: 200px;
}
</style>



</head>

<body>
	<div id="detailTitle">
		<div id="titleSentence">
			<span id="pfTitle">[포트폴리오 타이틀이 옵니다]</span>
			<div id="pfTitle2">
				[전문가이름]<span id="topCategory">[카테고리]</span>
			</div>
		</div>
	</div>
	<div id="detailArticle">
		<ul class="nav nav-pills">
			<li role="presentation" class="active"><a href="#">포트폴리오</a></li>
			<li role="presentation"><a href="#">전문가 한마디</a></li>
			<li role="presentation"><a href="#">후기</a></li>
		</ul>
		<div id="imgContainer">
			<%-- 	<img class="imgBox" alt="" src="<c:url value='/images/interior.jpg'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/concert.jpg'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/food.jpg'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/instagram.png'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/로고최종글자없이20180719142549736.png'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/mainTopLogo.png'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/advertisment.jpg'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/food.jpg'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/mainTopLogo.png'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/PICK20180719142116189.png'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/profile.jpg'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/로고최종글자없이20180719142549736.png'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/food.jpg'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/party.jpg'/>">
			<img class="imgBox" alt="" src="<c:url value='/images/profess.JPG'/>"> --%>
	<div id="mygallery">
		<a href="#"> <img alt="Title 1" src="<c:url value='/images/interior.jpg'/>" /></a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/advertisment.jpg'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/food.jpg'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/mainTopLogo.png'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/PICK20180719142116189.png'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/profile.jpg'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/twitter.png'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/wedding.jpg'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/fashion.jpg'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/메인수정.png'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/noticedown.png'/>" /> </a>
		 <a href="#"> <img alt="Title 2" src="<c:url value='/images/Honeycam.gif'/>" /> </a>
		<!-- other images... -->
	</div>
		</div>
	</div>


</body>
<%@ include file="../inc/bottom.jsp"%>