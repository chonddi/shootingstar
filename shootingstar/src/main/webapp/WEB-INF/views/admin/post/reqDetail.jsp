<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css"
	href="<c:url value='/css/aDetail.css'/>">
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

	
//디테일 팝업뜨게하기
function detailView(rqNo) {
	document.detailFrm.detailNo.value=rqNo;
	detailViewSubmit();
}
function detailViewSubmit(){
	frm = document.getElementById("detailFrm");
	x = (screen.availWidth - 700) / 1.2;
	y = (screen.availHeight - 600) / 2;
	window.open("","viewer","left=" + x + ", top=" + y + ", width=90, height=100, location=yes, resizable=no");
	frm.action = "<c:url value='/admin/post/reqDetail2.do'/>";
	frm.target = "viewer";
	frm.method = "post";
	frm.submit();
}

</script>
</head>
<body>

<form id="detailFrm" name="detailFrm" style="width:1400px;">
		<input type="hidden" name="detailNo">
</form>

<div class="rbody">
				

	 			<div>
					<span class="mint">${vo.memberId}</span>님의 Request글 세부내용</div><br><hr><br>
					<span class="mint">거래단계:
						<c:if test="${plevel==0}">
							<span class="mint2"><0> PICK선택 전</span>
						</c:if>
						<c:if test="${plevel==1}">
							<span class="mint2"><1> 세부조율단계 - 고객회원이 PICK선택</span>
						</c:if>
						<c:if test="${plevel==2}">
							<span class="mint2"><2> 전문가가 최종금액 입력완료</span> &nbsp;
								<input type="button" class="mBtn" style="height:30px;"value="금액수정" onclick="detailView('${vo.RQNo}')">
								
						</c:if>
						<c:if test="${plevel==3}">
							<span class="mint2"><3> 결제완료</span>
						</c:if></span> <br><br>
	 			<div class="pS">   
		 			<div class="title3"> <span class="mint">등록일</span> : <fmt:formatDate value="${vo.regDate}" pattern="yyyy년 MM월 dd일" />  
						&nbsp;&nbsp;&nbsp;&nbsp;<span class="mint">요청금액</span> : &#8361; <fmt:formatNumber value="${vo.RQPrice}" pattern="#,###" />원
						</div><br>
					
					    <span class="mint">촬영을 원하시는 지역</span>-&nbsp;&nbsp;   ${vo.RQRegion}<br><br>
					  <span class="mint"> 촬영을 원하시는 날짜</span>-&nbsp;&nbsp;   ${vo.RQDate}<br><br>
					   <span class="mint">사용 용도</span>-&nbsp;&nbsp;   ${vo.RQType}<br><br>
			   </div>     
		<hr><br>   
			   <div>   
				 <span class="mint"> 세부요청사항</span> <br><br>
				 <div class="rqdetail">${vo.RQDetail}</div>
			
			</div> 
		  <br>	
		  <hr>
		   <br>
		
			<div> 
			  <span class="mint" style="vertical-align:top;">참고자료</span>	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:forEach var="ivo" items="${list}">
					<img src="../../pd_images/${ivo.fileName}" style="width:100px;height:70px;" title="클릭하시면 원본크기로 보실 수 있습니다."
					style="cursor: pointer;" onclick="doImgPop('../../pd_images/${ivo.fileName}')">
				</c:forEach>
			</div><br>
			<hr>
			<br>		 
			 <div id> <div class="mint">전문가 PICK</div><br>
			 	
			 	
			 <table class="box2">
			 <colgroup>
				<col style="width:20%;" />
				<col style="width:55%;" />
				<col style="width:*;" />		
			 </colgroup>
			 	<thead >
				  <tr>
				  	<th scope="col" id="ttlt"> 채택된PICK</th>
				  	<th scope="col" id="ttlt">전문가명</th>
				    <th scope="col" id="ttlt"> 거래 금액</th>
				  
				   
				  </tr>
				</thead>
			<tbody>  
			
		
			 <c:forEach var="pvo" items="${pList}">
			 
			<%-- <form name="frm6" method="post" action="<c:url value='/request/detail2.do'/>" > --%>
			<tr>
			
							
						
			<td id="ttlt2">
			<c:if test="${pvo.pLevel!=0}">
				<img src="../../images/rchecks.png" style="vertical-align:middle; width:20px; height:20px;">
			</c:if> 
			</td>
			 
			 <td id="ttlt2">
			<div class="pdt">${pvo.sName}</div> 전문가 </td>
			
			 <td id="ttlt2">
			  <div class="pdt">
			  &#8361; <fmt:formatNumber value="${pvo.sPrice}" pattern="#,###" /> 원</div>
			 </td>
			 
			 
			 
			<tr>
			<!-- </form> -->
			 </c:forEach>
		  </tbody>
		 </table>
		   
		  </div>
		
</div>
<div style="text-align: center;margin-top:70px;">
		<input type="button" class="cBtn" value="닫기">
	</div>
</body>
</html>