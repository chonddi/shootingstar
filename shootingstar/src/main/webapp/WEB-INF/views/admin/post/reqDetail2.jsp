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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>${vo.RQNo}번 Request글 상세보기</title>
</head>
<body>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	$('.cBtn').click(function(){
		self.close();
	});
	
	document.querySelector('#frm7').addEventListener('submit', function(e) {
		  var form = this;
		  var price = $(".price2").val();
		  var price2 = price.replace(/[^\d]+/g, '');
		  
		  $('.sPrice').val(price2);
		  
		  e.preventDefault(); // <--- prevent form from submitting

		  swal({
		      title: "입력하신 가격:"+price+"원",
		      text: "수정하실 최종가격입니다.계속하시겠습니까?",
		      icon: "warning",
		      buttons: [
			        '아니요!',
			        '네!'
			      ],
			      dangerMode: true,
		    }).then(function(isConfirm) {
		      if (isConfirm) {
		        swal({
		          title: '수정이 완료되었습니다',
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
	

var rgx1 = /\D/g;  
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

	
//디테일 팝업뜨게하기
function detailView(rqNo) {
	document.detailFrm.detailNo.value=rqNo;
	detailViewSubmit();
}
function detailViewSubmit(){
	frm = document.getElementById("detailFrm");
	x = (screen.availWidth - 700) / 1.2;
	y = (screen.availHeight - 600) / 2;
	window.open("","viewer","left=" + x + ", top=" + y + ", width=700, height=600, location=yes, resizable=no");
	frm.action = "<c:url value='/admin/post/reqDetail2.do'/>";
	frm.target = "viewer";
	frm.method = "post";
	frm.submit();
}

</script>
</head>

<body>
<div class="rbody">


				<span class="mint">${vo.RQNo} 번 글<br> 전문가가 입력한 최종금액:</span>
				<c:set var="rqno" value="${vo.RQNo}"/>
				<c:forEach var="ivo" items="${pList}">
					<c:if test="${ivo.pLevel==plevel}">	 
						<span class="mint">&#8361; <fmt:formatNumber value="${ivo.sPrice}" pattern="#,###" />원</span>
					</c:if> 
				</c:forEach><br>
				<hr>
				<form id="frm7" method="post"  action="<c:url value='/admin/post/reqDetail3.do'/>" onsubmit="return send(this)">
				<span class="mint">수정할 금액 입력</span>
				<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);"
		            		style="text-align:right;" class="price2" name="Price" autocomplete=off required maxlength="11" />
				<button >입력</button>
				<input type="hidden" class="sPrice" name="sPrice" value="" />
				<input type="hidden" name="RQNo" value="${vo.RQNo}" />
				</form>
				
	 			
</div>
<div style="text-align: center;margin-top:70px;">
		<input type="button" class="cBtn" value="닫기">
	</div>
</body>
</html>