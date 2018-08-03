<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<%@ include file="../inc/detailTop.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/justifiedGallery.css" />
<script
	src="${pageContext.request.contextPath}/js/jquery.justifiedGallery.js"></script>
<head>
<!-- Font Awesome CSS -->
<link href="<c:url value='/css/font-awesome.css'/>" rel="stylesheet">
<!-- Custom CSS -->
<link href="<c:url value='/css/bootstrap-rating.css'/>" rel="stylesheet">
<link href="<c:url value='/css/portfolioDetail.css'/>" rel="stylesheet">

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
	function openImg(pfImgNo){
		$('#pictureDiv div').removeClass("active");
		$("."+pfImgNo).addClass("active");
		
	}
</script>

<style type="text/css">
#map_canvas {
	width: 740px;
	height: 400px;
}

/* 모달 시작 */
.modal-dialog.modal-80size {
  width: 80%;
  height: 80%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
}
.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) { 
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 50%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle; 
}
/* 모달 끝 */

#googleMap {
	float: right;
}
#mygallery a{
	cursor: pointer;
}
</style>



</head>

<body>
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
					<a href="#" data-toggle="modal" data-target="#myModal" onclick="openImg('ab${map['PFIMGNO']}')"> 
						<img alt=''	src="<c:url value='/portfolio_images/${map["FILENAME"] }'/>"/></a>
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
			<div id="map" style="width: 320px; height: 380px"></div>

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
	

	<!--      모달예정                          -->
	<!-- Trigger the modal with a button -->

<!-- Modal -->
<div id="myModal" class="modal modal-center fade" role="dialog">
  <div class="modal-dialog modal-80size modal-center">

    <!-- Modal content-->
    <div class="modal-content modal-80size">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="margin-top: -8px;">&times;</button>
      </div>
      <div class="modal-body">
   			<!-- 슬라이드 -->
			<div class="container">
		  <div id="myCarousel" class="carousel">
		    <!-- Indicators -->
		    <!-- <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol> -->
		
		    <!-- Wrapper for slides -->
		    <div id="pictureDiv" class="carousel-inner">
		      <!-- <div class="item active">
		        <img src="la.jpg" alt="Los Angeles" style="width:100%;">
		        <div class="carousel-caption">
		        </div>
		      </div>
		       -->
			<c:forEach items="${list }" var="map"> 
			  <div class="item ab${map['PFIMGNO']}">
		        <img src="<c:url value='/portfolio_images/${map["FILENAME"] }'/>" style="width:100%;">
		        <div class="carousel-caption">
		        </div>
		      </div>
			</c:forEach>
		  
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>
		</div>
      </div>
    </div>
  </div>
</div>
	

</body>
<%@ include file="../inc/bottom.jsp"%>