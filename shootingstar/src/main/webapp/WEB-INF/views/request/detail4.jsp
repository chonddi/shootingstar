<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 단계</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").click(function(){
			location.href="<c:url value='/payment/practice2.do'/>";
		});
		
		$("#btn2").click(function(){
			history.back();
		});
	});
	
	function payOpen(){
		x = (screen.availWidth - 600) / 2;
		y = (screen.availHeight - 500) / 2;
		window.open("<c:url value='/payment/practice2.do'/>","결제 확인창","left=" + x + ", top=" + y + ", width=600, height=500, location=yes, resizable=no");
	}
</script>
</head>
<body>
<form name="frm2" method="post" action="<c:url value='/request/detail.do'/>">
	<div class="payDiv">
		<p>${pList.sName} 전문가님이 아직 최종금액을 입력하지 않았습니다.</p>
		<p>* 전문가회원이 최종가격을 입력한 후 결제단계로 이동 가능합니다.</p>
	</div>
	<div>	
		<p>${pvo.sName} 전문가님이 입력하신 최종 금액은</p>
		<p>\${pvo.sPrice} 원입니다.</p>
		<p>결제하시겠습니까?</p>
		
		<button id="btn1">예</button>&nbsp;<input type="button" onclick='btn2()' value="아니오">
	</div>
				
		            <span id="cg1">선택하신 카테고리는  <span id="cg2">${cg1}</span> 입니다.</span> <br><br>
		            				<span id="cg3">원하시는 가격을 입력하세요.</span><br><br><br>
		            <input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);"
		            style="text-align:right;" class="price" name="price" autocomplete=off />
		            &nbsp;<span id="cg4">원</span>
		            <input type="hidden" id="cg1" name="cg1" value="${cg1 }"> 
		       
		        <br><br><br>
		        	<div id="sm"><button class="oky" id="okyoky" onclick="submit">입력완료</button></div> <br><br>
            		
            		
            		
    		 </form>
</body>
</html>

<%@ include file="../inc/bottom.jsp"%>