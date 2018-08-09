<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp"%>

<!DOCTYPE html>	
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    $('.price').keyup(function() {
    	if($('.price').val()==""){
    		$('#okyoky').css('background','#eceded');
    	}else{
    		$('#okyoky').css('background','#469bc4');
    		
    	}	
    }); 
    
    
    document.querySelector('.cau1').addEventListener('submit', function(e) {
  	  var form = this;
  	  var price = $(".price").val();
  	  var price2 = price.replace(/[^\d]+/g, '');
  	  
  	  $('.sPrice').val(price2);
  	  
  	  e.preventDefault(); // <--- prevent form from submitting

  	  swal({
  	      title: "입력하신 가격:"+price+"원",
  	      text: "다음 단계로 넘어갑니다.계속하시겠습니까?",
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
    
    



//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
// /[^0-9]/g 와 같은 표현
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


	
</script>

<title>Insert title here</title>
</head>

<body >
<br>


		<div class="main1">
	   
	   
	   			<div class="cau">
	   			<img src="../images/caub2.png" style="vertical-align:middle"><span id="caut">주의사항</span><br>
	   			-글 등록 후 List에서 본인이 올린 Request글만 상세보기 가능합니다. (고객회원 기준)<br>
	   			-전문가 회원에 의한 pick이 한 개 이상인 Request글은 금액 수정이 불가합니다.<br>
	   			-전문가 회원에 의한 pick이 한 개 이상인 Request글을 삭제요청 시 3일의 동의기간을 거쳐 삭제처리됩니다.<br>
	   			-비합리적이거나 터무니 없는 가격제시는 반려될 수 있습니다.
	 
	   			</div>
		
		
		
		 <form name="frmB" method="post" class="cau1"
		action="<c:url value='/request/write3.do'/>" onsubmit="return send(this)">
				
		            <span id="cg1">선택하신 카테고리는  <span id="cg2">${cg1}</span> 입니다.</span> <br><br>
		            				<span id="cg3">원하시는 가격을 입력하세요.</span><br><br><br>
		            <input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);"
		            style="text-align:right;" class="price" name="price" autocomplete=off required maxlength="10" />
		            &nbsp;<span id="cg4">원</span>
		            <input type="hidden" id="cg1" name="cg1" value="${cg1 }"> 
		       		<input type="hidden" class="sPrice" name="sPrice" value="" />
		        <br><br><br>
		        	<div id="sm"><button class="oky" id="okyoky" onclick="submit">입력완료</button></div> <br><br>
            		
            		
            		
    		 </form>

		
	
	</div>


</body>
</html>
<%@ include file="../inc/bottom.jsp"%>