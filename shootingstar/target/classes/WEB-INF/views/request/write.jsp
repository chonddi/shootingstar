<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp"%>

<!DOCTYPE html>	
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/write.css'/>">



<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">



$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);
		

</script>




<title>Insert title here</title>
</head>

<body>
<div class="title">어떤 촬영이 필요하신가요? </div>
<br>


		<div class="main">
		
		<form name="frmWrite1" method="post" id="frm1" action="<c:url value='/request/write2.do'/>" 
					onsubmit="return send(this)">
					
				<div class="frmfrm">	
					 <figure class="snip1384">
					  <input type=image src="../images/profile.jpg"  id="img1">
					 
					  <figcaption>
					    <h3>인물/프로필</h3><br>
					    <p>개인화보, 모델, 연출촬영, 컨셉프로필, 사원프로필, 매거진, 인터뷰촬영 </p><i class="ion-ios-arrow-right"></i>
					  </figcaption>
					   <a href="<c:url value='/request/write2.do'><c:param name="cg1" value="인물/프로필"></c:param></c:url>"></a>
					  </figure>
					  
					  
					  
					   <figure class="snip1384">
					  <input type=image src="../images/food.jpg"  id="img2">
					 
					  <figcaption>
					    <h3>푸드</h3><br>
					    <p>프랜차이즈, 레스토랑, 메뉴판촬영, 상세컷, 연출이미지, 요리사진, SNS </p><i class="ion-ios-arrow-right"></i>
					  </figcaption>
					   <a href="<c:url value='/request/write2.do'><c:param name="cg1" value="푸드"></c:param></c:url>"></a>
					  </figure>
					  
					  
					  
					   <figure class="snip1384">
					  <input type=image src="../images/fashion.jpg"  id="img1">
					 
					  <figcaption>
					    <h3>패션</h3><br>
					    <p>룩북, 피팅촬영, 광고, 쇼핑몰, 브랜드 </p><i class="ion-ios-arrow-right"></i>
					  </figcaption>
					   <a href="<c:url value='/request/write2.do'><c:param name="cg1" value="패션"></c:param></c:url>"></a>
					  </figure>
					  
				</div>	  
				<div class="frmfrm">		  
					   <figure class="snip1384">
					  <input type=image src="../images/wedding.jpg"  id="img1">
					 
					  <figcaption>
					    <h3>웨딩</h3><br>
					    <p> 본식촬영, 스튜디오, 야외촬영, 드론촬영, 리허설촬영 </p><i class="ion-ios-arrow-right"></i>
					  </figcaption>
					   <a href="<c:url value='/request/write2.do'><c:param name="cg1" value="웨딩"></c:param></c:url>"></a>
					  </figure>
					  
					    <figure class="snip1384">
					  <input type=image src="../images/party.jpg"  id="img1">
					 
					  <figcaption>
					    <h3>행사/컨퍼런스</h3><br>
					    <p>기업행사, 세미나, 외부행사, 시상식, 강연회 </p><i class="ion-ios-arrow-right"></i>
					  </figcaption>
					   <a href="<c:url value='/request/write2.do'><c:param name="cg1" value="행사/컨퍼런스"></c:param></c:url>"></a>
					  </figure>
					
					  <figure class="snip1384">
					  <input type=image src="../images/interior.jpg"  id="img1">
					 
					  <figcaption>
					    <h3>건축/인테리어</h3><br>
					    <p>관공서/기업, 공간인테리어, 펜션, 호텔, 모델하우스, 드론촬영 </p><i class="ion-ios-arrow-right"></i>
					  </figcaption>
					   <a href="<c:url value='/request/write2.do'><c:param name="cg1" value="건축/인테리어"></c:param></c:url>"></a>
					  </figure>
					  
					</div>	  
				<div class="frmfrm">
				
				  
					    <figure class="snip1384">
					  <input type=image src="../images/concert.jpg"  id="img1">
					 
					  <figcaption>
					    <h3>공연</h3><br>
					    <p>무대, 행사, 파티, 연회장, 콘서트 </p><i class="ion-ios-arrow-right"></i>
					  </figcaption>
					   <a href="<c:url value='/request/write2.do'><c:param name="cg1" value="공연"></c:param></c:url>"></a>
					  </figure>
					
					
					  <figure class="snip1384">
					  <input type=image src="../images/advertisment.jpg"  id="img1">
					 
					  <figcaption>
					    <h3>광고</h3><br>
					    <p>개인프로필, 개인화보, 모델, 연출촬영, 컨셉프로필, 사원프로필, 매거진, 인터뷰촬영 </p><i class="ion-ios-arrow-right"></i>
					  </figcaption>
					   <a href="<c:url value='/request/write2.do'><c:param name="cg1" value="광고"></c:param></c:url>"></a>
					  </figure>
					  
					    <figure class="snip1384">
					  <input type=image src="../images/snap.jpg"  id="img1">
					 
					  <figcaption>
					    <h3>스냅사진</h3><br>
					    <p>웨딩, 가족, 데이트, 반려동물  </p><i class="ion-ios-arrow-right"></i>
					  </figcaption>
					   <a href="<c:url value='/request/write2.do'><c:param name="cg1" value="스냅사진"></c:param></c:url>"></a>
					  </figure>
					</div>	  
			
					
					
					</form>
					
					
				</div>
				
				<br><br>
			



</body>
</html>
<%@ include file="../inc/bottom.jsp"%>