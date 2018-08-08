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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/write.css'/>">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

<script type="text/javascript">

//PICK?좏깮 ??sweetalert?쇰줈 而⑦럩




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



function payBtn(RQNo, pickNo){
	 swal({
	      title: "선택하시겠습니까?",
	      text: "PICK은 1개만 선택가능합니다.계속하시겠습니까?",
	      icon: "warning",
	     
	      }).then(function(isConfirm) {
	      if (isConfirm) {
	        swal({
	          title: 'PICK이 선택되었습니다.',
	          text: '다음 단계로 이동합니다.',
	          icon: 'success'
	        }).then(function() {
		location.href="<c:url value='/request/detail2.do?no=" + RQNo + "&pno="+pickNo+"'/>"; 
	        });
	      } else {
	        swal("Cancelled", "취소되었습니다 :)", "error");
	      }
	    }) 
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
				    <th scope="col" id="ttlt">선택하기</th>
				   
				  </tr>
				</thead>
			<tbody>  
			
		
			 <c:forEach var="pvo" items="${pList}">
			 
			<%-- <form name="frm6" method="post" action="<c:url value='/request/detail2.do'/>" > --%>
			<tr>
			<td id="ttlt2"><img src="../images/rchecks.png" style="vertical-align:middle; width:30px; height:30px;"> </td>
			 
			 <td id="ttlt2">
			<img src="../images/faceb.png" style="vertical-align:middle"> <div class="pdt">${pvo.sName}</div> 전문가 </td>
			
			 <td id="ttlt2">
			  <div class="pdt">
			  <fmt:formatNumber value="${pvo.sPrice}" pattern="#,###" /> 원</div>
			 </td>
			 
			 <td id="ttlt2">
			 
			  <button class="hover effect8" id="btn5" onclick="payBtn(${pvo.RQNo}, ${pvo.pickNo})">선택하기</button>
			
			 </td>
			 
			<tr>
			<!-- </form> -->
			 </c:forEach>
		  </tbody>
		 </table>
		 
			  <div style="margin-top:50px;"> 
			  	<button class="oky1" style="text-align:center;" onclick="location.href='<c:url value='/request/list.do'/>'">List로</button>
			  </div>
			  
		  </div>
		 
		
</div>

</body>
</html>
<%@ include file="../inc/bottom.jsp"%>