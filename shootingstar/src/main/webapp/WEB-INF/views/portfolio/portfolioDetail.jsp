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
<link href="<c:url value='/css/portfolioDetail.css'/>" rel="stylesheet">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IA4cSQ_imngW0f0TUP9c&submodules=geocoder"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#mygallery').justifiedGallery({
			rowHeight : 190,
			lastRow : 'nojustify',
			margins : 5
		});

		$('#a2').click(function(e) {
			e.preventDefault();
			document.getElementById("detailArticle2").scrollIntoView();
		});
		$('#a3').click(function(e) {
			e.preventDefault();
			document.getElementById("avgStar1").scrollIntoView();
		});
		
		//회전목마 자동넘기기 방지
		$(".carousel").carousel({ interval:false });
		
		//관심등록여부 onload시
		if(${heart==1}){
			$('#heartEmpty').css('display','none');
			$('#heartFull').css('display','');
		}else{
			$('#heartFull').css('display','none');
			$('#heartEmpty').css('display','');
		}
		
		$('#askPro').click(function(){
			if(${sessionScope.userCode!=1}){
				alert('고객회원으로 로그인해 주십시오.');
			}else{
				x = (screen.availWidth - 460) / 2;
				y = (screen.availHeight - 550) / 2;
				window.open("<c:url value='/mypage/message/messageWrite.do?sMemberId=${sMemberId}'/>","쪽지보내기","left=" + x + ", top=" + y + ", width=460, height=550, location=yes, resizable=no");
			}
		});
		
		//관심등록
		$(".heart").click(function(){
			$.ajax({
				url:"<c:url value='/likey/heart.do'/>",
				type:"GET",
				data:"pfNo=${param.pfNo}",	//파라미터
				success:function(res){
					if(res==1){
						alert("잘못된 접근입니다.");
					}else if(res==2){
						alert("고객회원으로 로그인 해주십시오.");
					}else if(res==3){
						$('#heartFull').css('display','none');
						$('#heartEmpty').css('display','');
					}else if(res==4){
						$('#heartEmpty').css('display','none');
						$('#heartFull').css('display','');
					}else{
						alert("잘못된 접근입니다.");
					}
				},
				error:function(xhr, status, error){
					alert('error:'+error+", status: "+status)
				}
				
			});
		});

	});
	
	//이미지 클릭하면 부트스트랩 회전목마의 첫번째 active를 설정
	function openImg(pfImgNo){
		$('#pictureDiv div').removeClass("active");
		$("."+pfImgNo).addClass("active");
		
	}
	
</script>

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
			<button type="button" id="askPro" class="btn btn-default btn-lg">
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 이
				전문가에게 문의하기
			</button>
			
			<div id="likeBox">
				<hr>
					<img src="<c:url value='/images/heartEmpty.png'/>" class="heart" id='heartEmpty' style="display: none;"/>
					<img src="<c:url value='/images/heartFull.png'/>" class="heart" id='heartFull' style="display: none;"/>
					<span style="font-size: 0.9em;">관심</span>
				<hr>
			</div>
			<div id="map1" style="width: 320px; height: 380px; text-align:right; position: absolute; padding-top: 20px; right: 0;top: 204px;">
		
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
			
			<script type="text/javascript">
				function pageFunc(curPage){
					document.frmPage.currentPage.value=curPage;
					frmPage.submit();
				}
			</script>
			<!-- 페이징 처리를 위한 form -->
			<form name="frmPage" method="get" action="<c:url value='/portfolio/portfolioDetail.do'/>">
			<input type="hidden" name="currentPage" >
			<input type="hidden" name="pfNo" value="${param.pfNo}">
			</form>
			<!-- review -->
			<section id="comment">
				<div id="star">
					<h1>후기</h1>
					<table id="starTable">
						<tr>
							<td><span id="avgStar1">★</span></td>
							<td>
								<c:if test="${empty avg}">
									<span id="avgStar">0.0</span>
								</c:if>
								<c:if test="${!empty avg}">
									<span id="avgStar">${avg}</span>
								</c:if>
							</td>
							<td>커뮤니케이션</td>
							<td><span class="star-rating"><span style="width:${comAvg}%;"></span></span></td>
							<td>결과물</td>
							<td><span class="star-rating"><span style="width:${resAvg}%"></span></span></td>
						</tr>
					</table>
				</div>
				<c:if test="${!empty reList}">
					<c:forEach var="re" items="${reList}">
						<section class="comment2">
							<div class="star2">
								<table class="starTable2">
									<tr>
										<td colspan="5">${re.content}</td>
									</tr>
									<tr>
										<td>
											★ <fmt:formatNumber value="${re.avg}" pattern=".0"/>
											<span class="satif">
												<c:choose>
													<c:when test="${re.avg >=70}">만족해요</c:when>
													<c:when test="${re.avg >=40}">보통이에요</c:when>
													<c:otherwise>불만이에요</c:otherwise>
												</c:choose>
											</span>
										</td>
										<td>${re.name}</td>
										<td>${re.cgName}</td>
										<td>작성일 <fmt:formatDate value="${re.regdate}" pattern="yyyy.MM.dd"/></td>
										<td>${sName} 전문가</td>
									</tr>
								</table>
							</div>
						</section>
					</c:forEach>
				</c:if>
				<div class="divPage">
				<!-- 페이지 번호 추가 -->		
				<!-- 이전 블럭으로 이동 -->
				<c:if test="${pageVo.firstPage>1 }">
					<a href="#" onclick="pageFunc(${pageVo.firstPage-1})">
						<span class="pageNum3">
						PREV
						</span>
					</a>
				</c:if>
				
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pageVo.firstPage }" end="${pageVo.lastPage}">
					<c:if test="${i==pageVo.currentPage }">
						<span class="pageNum1">
							${i}</span>
					</c:if>
					<c:if test="${i!=pageVo.currentPage }">
						<a href="#" onclick="pageFunc(${i})">
							<span class="pageNum2">
							${i}
							</span>
						</a>
					</c:if>
				</c:forEach>
					
				<!-- 다음 블럭으로 이동 -->
				<c:if test="${pageVo.lastPage<pageVo.totalPage }">
					<a href="#" onclick="pageFunc(${pageVo.lastPage+1})">
						<span class="pageNum3">
						NEXT
						</span>
					</a>
				</c:if>
				<!--  페이지 번호 끝 -->
			</div>
		</section>
			
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
			<div class="container" style="width: 100%;">
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