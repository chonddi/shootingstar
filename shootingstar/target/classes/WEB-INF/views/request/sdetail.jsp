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
document.querySelector('#frm5').addEventListener('submit', function(e) {
	  var form = this;

	  e.preventDefault(); // <--- prevent form from submitting

	  swal({
	      title: "이 금액으로 PICK 하시겠습니까?",
	      text: "한번 결정한 금액은 변경할 수 없습니다. 계속하시겠습니까?",
	      icon: "warning",
	      buttons: [
	        '아니요!',
	        '네!'
	      ],
	      dangerMode: true,
	    }).then(function(isConfirm) {
	      if (isConfirm) {
	        swal({
	          title: '완료되었습니다',
	          text: 'pick등록이 완료되었습니다.',
	          icon: 'success'
	        }).then(function() {
	          form.submit(); // <--- submit form programmatically
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

<div>


	<!-- <div class="main2"> -->
	
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
			
					 
			 <div id="pS5"> 
			 <form name="frm1" id="frm5" method="post"  action="<c:url value='/request/addpick.do'/>"> 
			 
			 <br><hr><br><div class="title2">PICK하기</div>매칭금액 미입력시 request의 요청 금액과 동일하게 입력됩니다. <div class="title5">${vo.memberId}님과 매칭하길 원하는 금액을 입력해주세요.</div><br>
			 				
			 		<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);"
		            style="text-align:right;" class="price1" name="price" autocomplete=off />
		            &nbsp; <span id="cg5">원</span>  <br><br>
		            
		            <input type="hidden" name="RQNo" value="${vo.RQNo}"/>
		            
		            <button class="oky1" id="oky1">PICK</button>
		     </form>
		            
		            <br>
		            <button class="oky1" onclick="location.href='<c:url value='/request/list.do'/>'">List로</button>
		       
		           
		          
			 </div>
			 
	
		  

</div>


</body>
</html>
<%@ include file="../inc/bottom.jsp"%>