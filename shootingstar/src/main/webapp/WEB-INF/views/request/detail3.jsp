<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 단계</title>
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/write.css'/>">

<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").click(function(event){
			payOpen();
			event.preventDefault();
		});
		
		$("#btn2").click(function(){
			history.back();
		});
		
		$("input[name=price2]").click(function(){
			$(this).val("");
		});
		
		$("#apply").click(function(event){
			if($(".price2").val() == 0){
				event.preventDefault();
			}else {//if(confirm("적용하시겠습니까?")){
				var str = $("input[name=price2]").val();	//마일리지 입력 값
				var price = str.replace(/,/g, '');	//마일리지 입력 값 콤마 제거
				
				if(price > ${mvo.mileage}){	//입력한 마일리지가 가지고 있는 마일리지보다 큰 경우
					$("input[name=price2]").val($("#mileage").text());	//보유 마일리지 전체 삽입 
				}else if(str == 0){	//마일리지 입력 값이 공백인 경우
					alert("성공");
					$("input[name=price2]").val(0);	//0을 삽입
				}
				
				var str2 = $(".price2").val();
				var price2 = str.replace(/,/g, '');
				var FnPrc = ${pvo.sPrice} - price2;
				var usePrc = "";
				
				if(FnPrc < 0){
					FnPrc = 0;
				}
				
				var outNum = setComma(FnPrc);
				$(".pdt2").html("&#8361;" + outNum);
				
				if(${pvo.sPrice} <= price2){
					usePrc = ${pvo.sPrice};
				}else if(${pvo.sPrice} > price2){
					usePrc = price2;
				}
				
				var FnRemn = ${mvo.mileage} - usePrc;
				$("#usePrc").html(setComma(usePrc));
				$("#FnRemn").html(FnRemn);
				
				$("input[name=price]").val(FnPrc);
				$("input[name=mileage]").val(FnRemn);
				$("input[name=useMile]").val(usePrc);
				
			}
			
			event.preventDefault();
		});
		
		$("#cancel").click(function(){
			var outNum = setComma(${pvo.sPrice});
			$(".pdt2").html("&#8361;" + outNum);
			$(".price2").val(0);
			$("#usePrc").html(0);
			$("#FnRemn").html(0);
			
			$("input[name=price]").val(${pvo.sPrice});
			$("input[name=mileage]").val(0);
			$("input[name=useMile]").val(0);
			
			event.preventDefault();
		});
		
		$("#all").click(function(event){
			$("input[name=price2]").val($("#mileage").text());
			event.preventDefault();
		});
		
	});
	
	function payOpen(){
		x = (screen.availWidth - 840) / 2;
		y = (screen.availHeight - 605) / 2;
		var gsWin = window.open("about:blank","payviewer","left=" + x + ", top=" + y + ", width=840, height=600, location=yes, resizable=no");
		var frm = document.frm2;
		frm.action = "<c:url value='/payment/port_payment.do?no=${param.no}'/>";
		frm.target ="payviewer";
		frm.method ="post";
		frm.submit();
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
			
					 
			
			 
		<div id="pS5"> 
			<form name="frm2" id="frm6">
			
				
					<div class="payDiv">
						<div class="title2">STATUS</div>
						
						<div class="title5" style="text-align:left;">최종결제단계입니다.</div><br><hr>
			
						<div style="margin:30px 0;">
						<p><span style="font-size:1.3em; color:#c9ccc7;">${pvo.sName}</span> 전문가님이 입력하신 최종 금액은</p><br>
						<span class="pdt2">&#8361;<fmt:formatNumber value="${pvo.sPrice}" pattern="#,###" /></span><span>원 입니다.</span>
						<p style="margin-top:20px;">결제하시겠습니까?</p></div>
						<button class="oky1" id="btn1">예</button>&nbsp;<input type="button" class="oky1" id="btn2" value="아니오">
						
						<div style="margin:40px 0;">
						<p>사용가능한 마일리지 : <span id="mileage"><fmt:formatNumber value="${mvo.mileage}" type="number"/></span>&nbsp;<button id="all">전액사용</button></p><br>
						<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" style="text-align:right;" class="price2" name="price2" value="0" autocomplete=off required />
						<input type="button" id="apply" value="적용">
						<input type="button" id="cancel" value="취소">
						<p class="brp">마일리지 사용 : <span id="usePrc">0</span></p>
						<p>잔여 마일리지 : <span id="FnRemn">0</span></p>
						</div>					
					</div>
						
						<input type="hidden" name="price" value="${pvo.sPrice}">
						<input type="hidden" name="mileage" value="${mvo.mileage}">
						<input type="hidden" name="useMile" value="0">
				
			</form>
		    		
			 </div> 
  

</div>


</body>
</html>

<%@ include file="../inc/bottom.jsp"%>