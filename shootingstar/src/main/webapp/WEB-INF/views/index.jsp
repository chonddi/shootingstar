<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/index.css'/>">

<script type="text/javascript">
$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);
		
		
function onClick(usercode) { 
		if(usercode==1){ 
			location.href="<c:url value='/request/write.do'/>"
		
		}else{
		 
		swal({
			text: "고객회원으로 로그인해주세요.",
			icon: "error",
			button: "확인"
			}); 
			}
		
	}	 		
		
		
		
</script>

<head>
    <!-- Custom styles for this template -->
    <link href="css/agency.css" rel="stylesheet">
</head>

<div id="mainHeaderAd"
			style="background-image: url('<c:url value='/images/mmain.gif'/>');">
			<div id="mainSentence">
				원하는 항목, 보다 합리적인 가격에<br>
				나에게 딱 맞는 포토그래퍼를 찾아보세요 !
				<p id="mainBtn">
				
				
					<a class="btn btn-info" role="button"
						style="width: 150px; font-size: 0.35em;" 
						onclick='onClick("${sessionScope.userCode}")'>견적신청</a>
				</p>
				<div id="tableDiv">
					<table id="mainTable">
						<col width="150" align="center">
						<col width="150" align="center">
						<col width="150" align="center">
						<col width="150" align="center">
						<tr id="mainTr">
							<td class="border1">등록 전문가 수&nbsp;</td>
							<td class="border2">&nbsp;견적 요청 수&nbsp;</td>
							<td class="border3">&nbsp;요청별 견적서&nbsp;</td>
							
						</tr>
						<tr> 
							<td class="border1">1업체&nbsp;</td>
							<td class="border2">&nbsp;2개&nbsp;</td>
							<td class="border3">&nbsp;3.2개&nbsp;</td>
							
						</tr>
					</table>
				</div>
			</div>
		</div>

<div class="prt">

PORTPOLIO
by category

</div>



<div class="figbody">

	<figure class="snip1445">
	  <img src="images/profile.jpg" alt="sample21" />
	   <figcaption>
	    <div>
	      <h2>Profile</h2>
	      <h4>인물/프로필</h4>
	    </div>
	  </figcaption>
	  <a href="#"></a>
	</figure>
	
	<figure class="snip1445"><img src="images/food.jpg" alt="sample21" />
	  <figcaption>
	    <div>
	      <h2>Food</h2>
	      <h4>음식</h4>
	    </div>
	  </figcaption>
	  <a href="#"></a>
	</figure>
	
	<figure class="snip1445"><img src="images/fashion.jpg" alt="sample51" />
	  <figcaption>
	    <div>
	      <h2>Fashion</h2>
	      <h4>패션</h4>
	    </div>
	  </figcaption>
	  <a href="#"></a>
	</figure><figure class="snip1445"><img src="images/wedding.jpg" alt="sample51" />
	  <figcaption>
	    <div>
	      <h2>Wedding</h2>
	      <h4>웨딩</h4>
	    </div>
	  </figcaption>
	  <a href="#"></a>
	</figure>
	
	<figure class="snip1445"><img src="images/party.jpg" alt="sample51" />
	  <figcaption>
	    <div>
	      <h2>Events</h2>
	      <h4>행사/컨퍼런스</h4>
	    </div>
	  </figcaption>
	  <a href="#"></a>
	</figure>
	
	<figure class="snip1445"><img src="images/interior.jpg" alt="sample51" />
	  <figcaption>
	    <div>
	      <h2>Architecture&Interior</h2>
	      <h4>건축/인테리어</h4>
	    </div>
	  </figcaption>
	  <a href="#"></a>
	</figure>
	
	<figure class="snip1445"><img src="images/concert.jpg" alt="sample51" />
	  <figcaption>
	    <div>
	      <h2>Concert</h2>
	      <h4>공연</h4>
	    </div>
	  </figcaption>
	  <a href="#"></a>
	</figure>
	
	<figure class="snip1445"><img src="images/advertisment.jpg" alt="sample51" />
	  <figcaption>
	    <div>
	      <h2>Advertisement</h2>
	      <h4>광고</h4>
	    </div>
	  </figcaption>
	  <a href="#"></a>
	</figure>
	
	<figure class="snip1445"><img src="images/snap.jpg" alt="sample51" />
	  <figcaption>
	    <div>
	      <h2>Snapshots</h2>
	      <h4>스냅사진</h4>
	    </div>
	  </figcaption>
	  <a href="#"></a>
	</figure>
	
</div>

<%@ include file="inc/bottom.jsp"%>