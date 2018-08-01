<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/write.css'/>">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

<script type="text/javascript">

//이미지 클릭시 원본 크기로 팝업 보기
function doImgPop(img){ 
 img1= new Image(); 
 img1.src=(img); 
 imgControll(img); 
} 
  
function imgControll(img){ 
 if((img1.width!=0)&&(img1.height!=0)){ 
    viewImage(img); 
  } 
  else{ 
     controller="imgControll('"+img+"')"; 
     intervalID=setTimeout(controller,20); 
  } 
}

function viewImage(img){ 
 W=img1.width; 
 H=img1.height; 
 O="width="+W+",height="+H+",scrollbars=yes"; 
 imgWin=window.open("","",O); 
 imgWin.document.write("<html><head><title>----이미지상세보기----</title></head>");
 imgWin.document.write("<body topmargin=0 leftmargin=0>");
 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
 imgWin.document.close();
}

$(document).ready(function(){
	
	//뒤로가기 막기
	history.pushState(null, null, location.href);
	window.onpopstate = function () {
	    history.go(1);
	};
	
	$("#payBtn").click(function(){
		
	});
	
	
});

function payBtn(RQNo){
	location.href="<c:url value='/request/detail2.do?no=" + RQNo + "'/>";
}


</script>
</head>

<body>
<div class="rbody">


		
	
	 			<div class="title2">
					${vo.memberId}님의 Request 입니다.</div>
	 			<div class="pS">   
		 			<div class="title3"> <span class="mint">등록일</span> : <fmt:formatDate value="${vo.regDate}" pattern="yyyy년 MM월 dd일" />  
						&nbsp;&nbsp;&nbsp;&nbsp;<span class="mint">요청금액</span> :  <fmt:formatNumber value="${vo.RQPrice}" pattern="#,###" />원
						</div><br>
					
					   <span class="mint">촬영을 원하시는 지역</span>&nbsp;&nbsp;   ${vo.RQRegion}<br><br>
					  <span class="mint"> 촬영을 원하시는 날짜</span>&nbsp;&nbsp;   ${vo.RQDate}<br><br>
					   <span class="mint">사용 용도</span>&nbsp;&nbsp;   ${vo.RQType}<br><br>
			   </div>   
			   
			   <div class="pS1">   
				 <span class="title4"> 세부요청사항</span> <br><br>
				 <div class="rqdetail">${vo.RQDetail}</div>
			
			</div> 
			
		  
		   
		
			<div id="pS4"> 
			  <span class="title4">참고자료</span>	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:forEach var="ivo" items="${list}">
					<img src="../pd_images/${ivo.fileName}" class="imgup" title="클릭하시면 원본크기로 보실 수 있습니다."
					style="cursor: pointer;" onclick="doImgPop('../pd_images/${ivo.fileName}')">
				</c:forEach>
			</div>
			
		
			 <div id="pS5"> <div class="title2">STATUS</div><br>
			 	
			 <c:forEach var="pvo" items="${pList}">
			 	<c:if test="${pvo.pickNo == pno}">	
			 	
			 <div class="title5" style="text-align:left;">세부조율단계입니다.</div><br>
			 <div style="text-align:left;">고객회원과 전문가회원이 2차 협의를 하는 단계입니다.<br> 서비스 세부사항과 금액에 대한 최종결정을 하게 되고, 전문가회원이 최종금액을 입력하는 단계입니다.</div><br><hr><br>
			
			<div style="font-size:25px;padding-top:30px;"> <p><span style="color:#c9ccc7">${pvo.sMemberId}</span>전문가님이 아직 최종금액을 입력하지 않았습니다.</p>
			
			<p>* 전문가회원이 최종가격을 입력하면 마지막 결제단계 화면으로 이동합니다.</p> </div>
		
		  		</c:if>
			 </c:forEach>
			 <br><br><br>
			  <div style="width:1100px;padding-left:23px;">
		            <button class="oky1" onclick="location.href='<c:url value='/request/list.do'/>'">List로</button>
		       		</div>
		  </div>
		 

</div>

</body>
</html>
<%@ include file="../inc/bottom.jsp"%>