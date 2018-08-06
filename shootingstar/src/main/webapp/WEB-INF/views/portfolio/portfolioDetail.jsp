<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<%@ include file="../inc/detailTop.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/justifiedGallery.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/portfolioList.css" />
	
<script
	src="${pageContext.request.contextPath}/js/jquery.justifiedGallery.js"></script>
<head>
<!-- Font Awesome CSS -->
<link href="<c:url value='/css/font-awesome.css'/>" rel="stylesheet">
<!-- Custom CSS -->
<link href="<c:url value='/css/bootstrap-rating.css'/>" rel="stylesheet">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IA4cSQ_imngW0f0TUP9c&submodules=geocoder"></script>


<style>
#map_canvas {
	width: 740px;
	height: 400px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('#mygallery').justifiedGallery({
			rowHeight : 190,
			lastRow : 'nojustify',
			margins : 5
		});

		var result = $('#result').val();
		var communication = $('#communication').val();
		var total = $('#total').val();
		$('#resultStar').val(result);
		$('#communicationStar').val(communication);
		$('#totalStar').val(total);
		$('#avgStar').append(isNaN(total) ? "0.0" : total);

		$('#a2').click(function(e) {
			e.preventDefault();
			document.getElementById("detailArticle2").scrollIntoView();
		});
		$('#a3').click(function(e) {
			e.preventDefault();
			document.getElementById("avgStar1").scrollIntoView();
		});
		
	
		});
	
</script>

<style type="text/css">
#detailArticle {
	width: 1235px;
	height: auto;
}

#detailTitle {
	width: 1903px;
	height: 400px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
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

.nav {
	margin-left: 330px;
}

.nav-pills {
	font-weight: bold;
}

#imgContainer {
	width: 1903px;
	height: auto;
	background-color: rgba(50, 50, 50, 1);
	padding: 30px 0 30px 0;
}

#mygallery {
	margin: 0 auto;
	width: 1245px;
}

#detailArticleBottom {
	margin-top: 20px;
	width: 1245px;
	height: auto;
	margin-left: 340px;
}

#detailArticle2 {
	width: 900px;
	height: auto;
	float: left;
	margin-bottom: 10px;
	padding: 30px;
	color: #515457;
	font-weight: bold;
}

#da2Name {
	line-height: 50px;
	font-size: 1.4em;
}

#pr {
	font-size: 0.9em;
	line-height: 1.3;
}

#detailArticleSide {
	width: 335px;
	height: 100px;
	float: right;
	background-color: #f6f6f6;
	margin-bottom: 10px;
}

#comment {
	width: 900px;
	height: auto;
	clear: both;
	border-bottom: 1px solid #e8e8e8;
	border-top: 1px solid #e8e8e8;
}

#comment1 {
	line-height: 60px;
	margin-left: 35px;
	font-weight: bold;
}

.btn-lg {
	background-color: #337ab7;
	color: white;
	width: 335px;
	margin-left: 10px;
	border: 0;
}

.btn-lg:hover {
	border: 0;
}

#das {
	padding: 25px;
	line-height: 30px;
}

#likeBox {
	margin-top: 10px;
	width: 335px;
	height: 100px;
	float: right;
	text-align: center;
	font-size: 1.2em;
}

#likeBox>span {
	line-height: 40px;
}

#star {
	margin-bottom: 25px;
}

#starTable td {
	padding-left: 20px;
	vertical-align: middle;
	font-size: 0.9em;
	font-weight: bold;
}

#starTable td:first-child {
	border-right: 1px solid #e8e8e8;
}

#avgStar {
	font-size: 3.0em;
}

#avgStar1 {
	margin-bottom: 5px;
}

.symbol {
	display: inline-block;
	border-radius: 50%;
	border: 5px double white;
	width: 30px;
	height: 30px;
}

.symbol-empty {
	background-color: #ccc;
}

.symbol-filled {
	background-color: black;
}

.custom-heart {
	font-size: 2.5em;
	color: red;
}

.label-default {
	background-color: white;
}

.glyphicon-star:before {
	content: "\e006";
	color: #337ab7;
}

.glyphicon-star-empty:before {
	content: "\e007";
	color: #337ab7;
}

.comment2 {
	border-bottom: 1px solid #e8e8e8;
	clear: both;
	height: 150px;
}

.comment2>img {
	margin: 20px 10px 20px 10px;
	float: left;
}

.memberCommentDiv {
	padding-top: 25px;
	margin-left: 30px;
	line-height: 50px;
}

.memberComment {
	font-size: 0.9em;
	font-weight: bold;
}

.memberInfo {
	font-size: 0.8em;
	font-weight: bold;
}

.memberInfo1 {
	font-size: 0.9em;
	color: #a1a1a1;
}

#dasCg {
	font-size: 1.4em;
	font-weight: bold;
}

#dasExpert {
	font-size: 0.8em;
}

#googleMap {
	float: right;
}
</style>



</head>

<body onload="initialize()">
	<c:forEach var="map" items="${list }" end="0">
		<div id="detailTitle"
			style='background-image: url("<c:url value='/portfolio_images/${map["FILENAME"] }'/>")'>
			<div id="titleSentence">
				<span id="pfTitle">${map["PFTITLE"] }</span>
				<div id="pfTitle2">
					${map["SNAME"] } <span id="topCategory">${map["CGNAME"] }</span>
				</div>
			</div>
		</div>
	</c:forEach>
	<div id="detailArticle">
		<ul class="nav nav-pills">
			<li role="presentation" class="active"><a>포트폴리오</a></li>
			<li role="presentation"><a href="#" id="a2">전문가 한마디</a></li>
			<li role="presentation"><a href="#" id="a3">후기</a></li>
		</ul>
		<div id="imgContainer">
			<div id="mygallery">
				<c:forEach var="map" items="${list }">
					<a href="#"> <img alt=''
						src="<c:url value='/portfolio_images/${map["FILENAME"] }'/>" /></a>
						
						
					<!-- other images... -->
				</c:forEach>
			</div>
		</div>
		<div id="detailArticleBottom">
			<c:forEach var="map" items="${list }" end="0">
				<c:set var="sname" value='${map["SNAME"] }' />
				<c:set var="cgname" value='${map["CGNAME"] }' />
				<c:set var="pr" value='${map["PR"] }'></c:set>
				<div id="detailArticle2">
					전문가 소개<br> <span id="da2Name">${map["SNAME"] }</span>
					<div id="pr">${fn:replace(pr, cn, br) }</div>
				</div>
				<div id="detailArticleSide">
					<div id="das">
						<span id="dasCg">${map["CGNAME"] }</span><br> <span
							id="dasExpert">${map["SNAME"] } 전문가</span><br>
					</div>
					
				</div>
			</c:forEach>
			<button type="button" class="btn btn-default btn-lg">
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 이
				전문가에게 문의하기
			</button>
			
		
			
			<c:if test="${sessionScope.userCode==1 }">
				<div id="likeBox">
					<hr>
					<span>♡ 좋아요</span>
					<hr>
				</div>
			</c:if>
			<div id="map1" style="width: 320px; height: 380px; text-align:right; float:right; padding-top:20px;">
<!-- 네이버지도 -->			
			<div id="map" style="width:300px;height:200px;"></div>
    <script>
      var addd = '${address}';
      var map = new naver.maps.Map('map',{
    	  logoControl:false,
    	  mapDataControl: false	  
      });
      var myaddress = addd;// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          
          var contentString = [
              '<div class="iw_inner">',
              '   <h3>'+addd+'</h3>',
              '</div>'
          ].join('');
          
          var infowindow = new naver.maps.InfoWindow({
        	    content: contentString
        	});
          
      });
      </script> 
			
			</div>

			<c:set var="result" />
			<c:set var="communication" />
			<div id="comment">
				<span id="comment1">후기</span>
				<div id="star">
					<table id="starTable" border="1">
						<tr>
							<td><span id="avgStar1">★</span><span id="avgStar"></span></td>
							<td>총평점 <input type="hidden" id="totalStar" class="rating"
								data-readonly value="" /></td>
							<td>결과물<input type="hidden" id="resultStar" class="rating"
								data-readonly value="" />
							</td>
							<td>커뮤니케이션 <input type="hidden" id="communicationStar"
								class="rating" data-readonly value="" /></td>
						</tr>
					</table>
				</div>
			</div>

			<c:forEach var="vo2" items="${list2 }">
				<div class="comment2">
					<div class="memberCommentDiv">
						<span class="memberComment">${vo2.content }</span><br> <span
							class="memberInfo">★${(vo2.communication+vo2.result)/2} <span
							class="memberInfo1">${vo2.memberId } | ${cgname } | <fmt:formatDate
									value="${vo2.regdate }" pattern="yy-MM-dd" /> | ${sname } 전문가
						</span></span>
					</div>
					<input type="hidden" value='${result=result+vo2.result}'> <input
						type="hidden"
						value='${communication=communication+vo2.communication}'>
				</div>
			</c:forEach>

			<c:set var="result" value='${result/reviewSize }'></c:set>
			<c:set var="communication" value='${communication/reviewSize }'></c:set>

			<input type="hidden" id="result" value='${result }'> <input
				type="hidden" id="communication" value='${communication }'>

			<input type="hidden" id="total" value="${(result+communication)/2 }">

		</div>

	</div>

	<script type="text/javascript" src="<c:url value='/js/tooltip.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/js/bootstrap-rating.js'/>"></script>
	<script>
		$(function() {
			$('input.check').on('change', function() {
				alert('Rating: ' + $(this).val());
			});
			$('#programmatically-set').click(
					function() {
						$('#programmatically-rating').rating('rate',
								$('#programmatically-value').val());
					});
			$('#programmatically-get').click(function() {
				alert($('#programmatically-rating').rating('rate'));
			});
			$('#programmatically-reset').click(function() {
				$('#programmatically-rating').rating('rate', '');
			});
			$('.rating-tooltip').rating({
				extendSymbol : function(rate) {
					$(this).tooltip({
						container : 'body',
						placement : 'bottom',
						title : 'Rate ' + rate
					});
				}
			});
			$('.rating-tooltip-manual').rating({
				extendSymbol : function() {
					var title;
					$(this).tooltip({
						container : 'body',
						placement : 'bottom',
						trigger : 'manual',
						title : function() {
							return title;
						}
					});
					$(this).on('rating.rateenter', function(e, rate) {
						title = rate;
						$(this).tooltip('show');
					}).on('rating.rateleave', function() {
						$(this).tooltip('hide');
					});
				}
			});
			$('.rating').each(
					function() {
						$('<span class="label label-default"></span>').text(
								$(this).val() || ' ').insertAfter(this);
					});
			$('.rating').on('change', function() {
				$(this).next('.label').text($(this).val());
			});
		});
	</script>

</body>
<%@ include file="../inc/bottom.jsp"%>