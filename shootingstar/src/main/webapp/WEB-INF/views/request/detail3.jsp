<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 단계</title>
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request2.css'/>">
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").click(function(event){
			payOpen();
			event.preventDefault();
		});
		
		$("#btn2").click(function(){
			history.back();
		});
	});
	
	function payOpen(){
		x = (screen.availWidth - 840) / 2;
		y = (screen.availHeight - 605) / 2;
		window.open("<c:url value='/payment/port_payment.do?no=${param.no}'/>","결제창","left=" + x + ", top=" + y + ", width=840, height=600, location=yes, resizable=no");
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
	}
</script>
</head>
<body>
<form name="frm2" class="de3form">
	<c:if test="${empty pvo.sPrice}">
		<div class="payDiv">
			<p>${pvo.sName} 전문가님이 아직 최종금액을 입력하지 않았습니다.</p>
			<p>* 전문가회원이 최종가격을 입력한 후 결제단계로 이동 가능합니다.</p>
		</div>
	</c:if>
	<c:if test="${!empty pvo.sPrice}">
		<div class="payDiv">
			<p>${pvo.sName} 전문가님이 입력하신 최종 금액은</p>
			<span class="spn1">${pvo.sPrice}</span><span class="spn2"> 원입니다.</span>
			<p>결제하시겠습니까?</p>
			<button class="oky" id="btn1">예</button>&nbsp;<input type="button" class="oky" id="btn2" value="아니오">
			<p>사용가능한 마일리지 : <span>${mvo.mileage}</span></p>
			<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" style="text-align:right;" class="price2" name="price" autocomplete=off required />
		</div>
	</c:if>
</form>
</body>
</html>

<%@ include file="../inc/bottom.jsp"%>