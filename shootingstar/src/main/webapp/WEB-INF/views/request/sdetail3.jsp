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

//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 

function getNumber(obj){
	
  var num01;
  var num02;
  num01 = obj.value;
  num02 = num01.replace(rgx1,"");
  num01 = setComma(num02);
  obj.value =  num01;

}

function setComma(inNum){
  
  var outNum;
  outNum = inNum; 
  while (rgx2.test(outNum)) {
       outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
   }
  

  
  return outNum;

}
$( document ).ready(function() {
	
document.querySelector('#frm7').addEventListener('submit', function(e) {
	  var form = this;
	  var price = $(".price2").val();
	  var price2 = price.replace(/[^\d]+/g, '');
	  
	  $('.sPrice').val(price2);
	  
	  e.preventDefault(); // <--- prevent form from submitting

	  swal({
	      title: "입력하신 가격:"+price+"원",
	      text: "고객회원님이 결제하실 최종가격입니다.계속하시겠습니까?",
	      icon: "warning",
	      buttons: [
		        '아니요!',
		        '네!'
		      ],
		      dangerMode: true,
	    }).then(function(isConfirm) {
	      if (isConfirm) {
	        swal({
	          title: '가격등록이 완료되었습니다',
	          text: '다음 단계로 이동합니다.',
	          icon: 'success'
	        }).then(function() {
	          form.submit(); //submit
	        });
	      } else {
	        swal("Cancelled", "취소되었습니다:)", "error");
	      }
	    }) 
	    
	    
	});
});	
	



</script>
</head>

<body>

<div class="rbody">


	<!-- <div class="main2"> -->
	
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
			
					 
			
			 
		<div id="pS7"> 
			 <form name="frm1" id="frm7" method="post"  action="<c:url value='/request/detail3.do'/>"> 
			 
			 <c:forEach var="pvo" items="${pList}">
			 	
			 <!-- PICK을 선택받지 못한 전문가가 글을 클릭할 경우 -->	
			 	<c:if test="${pvo.sMemberId==sessionScope.userid && pvo.pLevel!=1}">
			 	
				 	
				 <br><br><div class="title2">STATUS</div> <div class="title5">${vo.memberId}님이 다른전문가의 PICK을 선택하였습니다.</div><br><br>
			 	</c:if>
			 
			
			 <!-- PICK을 선택받은 전문가가 글을 클릭할 경우 -->
			 	<c:if test="${pvo.sMemberId==sessionScope.userid && pvo.pLevel==1}">
			 <br><br><div class="title2">STATUS</div> <div class="title5">${vo.memberId}님이 고객님의 PICK을 선택하였습니다!</div><br><br>
			 	
			 	<div class="title5" style="text-align:left;">세부조율단계입니다.</div><br>
			 <div style="text-align:left;border-bottom:1px solid grey;padding-bottom:20px;">고객회원과 전문가회원이 2차 협의를 하는 단계입니다.<br> 서비스 세부사항과 금액에 대한 최종결정을 하게 되고, 전문가회원이 최종금액을 입력하는 단계입니다.</div><br><br>
			 	
			 	<div style="font-size:20px;"> 
			 	<span style="color:#c9ccc7"> ${pvo.sName}</span>님이 고객회원님과 조율한 최종가격을 입력하면 마지막 결제단계로 넘어가게 됩니다.</div> <br>
			 		
			 	  <div style="width:1000px;padding-top:20px;padding-left:130px; ">		
			 	  <div class="pP1">${sessionScope.userid}님이 제시하신 금액:
			 			</div><div class="pP2">&#8361;	<fmt:formatNumber value="${pvo.sPrice}" pattern="#,###" />원
			 		
			 			 </div>	 	
			 		</div>
			 			<div class="mdiv1" style="text-align:left;">
						 	<img src='../images/cinfo.png' style="vertical-align:middle;" />
						 	${vo.memberId }님의 Contact Info<br>
						 	<img src='../images/mcall.png' /> <br>
						 	<img src='../images/mtxt.png' />[쪽지보내기]
						 	
						 </div>
						 <div class="mdiv1" style="text-align:left;">
						 	<span style="color: #F06659; font-size:1.3em;"> 최종결정 </span> <br><br>
						 	마지막 단계인 결제단계로 넘어가시려면<br>
						 	상호협의하신 최종가격을 입력하시고 버튼을 클릭하세요.<br><br>
						 	<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);"
		            		style="text-align:right;" class="price2" name="Price" autocomplete=off required maxlength="9" />
		            		&nbsp; <span id="cg5">원</span>  <br><br>
		            		
		            		<input type="hidden" name="sName" value="${pvo.sName}" />
		            		<input type="hidden" name="pickNo" value="${pvo.pickNo}" />
		     				<input type="hidden" class="sPrice" name="sPrice" value="" />
		  
		            		<button class="oky1" id="oky1">최종결정</button>
		            		
		            		
						 </div>
			 		</c:if>
			 	</c:forEach>
			 		
			 	
		            <input type="hidden" name="no" value="${vo.RQNo}"/>
		            
		   			
		     </form>
		            
		            <br><br>
		            <button class="oky1" onclick="location.href='<c:url value='/request/list.do'/>'">List로</button>
		    		
			 </div> 
  

</div>


</body>
</html>
<%@ include file="../inc/bottom.jsp"%>