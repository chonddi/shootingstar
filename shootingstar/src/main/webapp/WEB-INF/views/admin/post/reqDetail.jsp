<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${vo.RQNo}번 Request글 상세보기</title>
</head>
<body>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	$('.cBtn').click(function(){
		self.close();
	});
});

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

	

</script>
</head>

<body>
<div class="rbody">


	 			<div class="title2">
					${vo.memberId}님의 Request 입니다.</div>
	 			<div class="pS">   
		 			<div class="title3"> <span class="mint">등록일</span> : <fmt:formatDate value="${vo.regDate}" pattern="yyyy년 MM월 dd일" />  
						&nbsp;&nbsp;&nbsp;&nbsp;<span class="mint">요청금액</span> : &#8361; <fmt:formatNumber value="${vo.RQPrice}" pattern="#,###" />원
						</div><br>
					
					    <span class="mint">촬영을 원하시는 지역</span>-&nbsp;&nbsp;   ${vo.RQRegion}<br><br>
					  <span class="mint"> 촬영을 원하시는 날짜</span>-&nbsp;&nbsp;   ${vo.RQDate}<br><br>
					   <span class="mint">사용 용도</span>-&nbsp;&nbsp;   ${vo.RQType}<br><br>
			   </div>     
		<hr>	   
			   <div class="pS1">   
				 <span class="title4"> 세부요청사항</span> <br><br>
				 <div class="rqdetail">${vo.RQDetail}</div>
			
			</div> 
			
		  <hr>
		   
		
			<div id="pS4"> 
			  <span class="title4">참고자료</span>	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:forEach var="ivo" items="${list}">
					<img src="../../pd_images/${ivo.fileName}" style="width:140px;height:70px;" title="클릭하시면 원본크기로 보실 수 있습니다."
					style="cursor: pointer;" onclick="doImgPop('../../pd_images/${ivo.fileName}')">
				</c:forEach>
			</div>
			<hr>
					 
			 <div id="pS5"> <div class="title2">STATUS</div><br>
			 	
			 	
			 <table class="box2">
			 <colgroup>
				<col style="width:8%;" />
				<col style="width:40%;" />
				<col style="width:25%;" />
				<col style="width:*;" />		
			 </colgroup>
			 	<thead >
				  <tr>
				  	<th scope="col" id="ttlt"> </th>
				  	<th scope="col" id="ttlt">전문가명</th>
				    <th scope="col" id="ttlt"> 최초 제시 금액</th>
				  
				   
				  </tr>
				</thead>
			<tbody>  
			
		
			 <c:forEach var="pvo" items="${pList}">
			 
			<%-- <form name="frm6" method="post" action="<c:url value='/request/detail2.do'/>" > --%>
			<tr>
			<td id="ttlt2"><img src="../../images/rchecks.png" style="vertical-align:middle; width:20px; height:20px;"> </td>
			 
			 <td id="ttlt2">
			<div class="pdt">${pvo.sName}</div> 전문가님 </td>
			
			 <td id="ttlt2">
			  <div class="pdt">
			  <fmt:formatNumber value="${pvo.sPrice}" pattern="#,###" /> 원</div>
			 </td>
			 
			 
			 
			<tr>
			<!-- </form> -->
			 </c:forEach>
		  </tbody>
		 </table>
		   
		  </div>
		
</div>
<div style="text-align: center;">
		<input type="button" class="cBtn" value="닫기">
	</div>
</body>
</html>