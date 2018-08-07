<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/write.css'/>">

<title>Insert title here</title>
</head>
<body>
<div id="itlt" style="margin-bottom:25px;color:#345F93;">이용방법</div>

<div id="infot">고객회원</div>

<div class="infoc" style="height:450px; margin-bottom:30px;">
<span id="tn">01</span> <span id="cntb">원하는 가격, 지역, 시간, 상세요구사항을 포함한  맞춤형 Request를 작성합니다.</span><br><br>

- 고객회원 본인의 Request글만 상세보기가 가능하며, Pick이 선택되기 전에만 글 삭제가 가능합니다.<br><br><br><br>

<span id="tn">02</span> <span id="cntb">전문가회원에 의해 Pick이 되면 1차 제시가격과 전문가회원의 포트폴리오를 보고 선택합니다.</span><br><br>

- Pick을 선택하면 2단계인 세부조율단계에서 서비스 세부사항과 금액에 대한 최종결정을 하게 되고, 전문가회원이 최종금액을 입력합니다.<br><br><br><br>

<span id="tn">03</span> <span id="cntb">최종결제단계에서 고객회원이 결제를 하면 서비스거래가 마무리됩니다.</span><br>

</div>

<div id="infot" style="padding-top:70px;">전문가회원</div>

<div class="infoc" style="margin-bottom:100px;">
<span id="tn">00</span> <span id="cntb">자신의 전문분야를 돋보일 Portfolio를 작성합니다.</span><br><br><br>

<span id="tn">01</span> <span id="cntb">고객회원의 Request 목록 중 원하는 Request를 Pick합니다.</span><br><br>
-Request글 하나당 하나의 Pick만 선택 가능합니다.<br>
-Request글 하나당 최대 Pick 갯수는 5개입니다.<br><br><br>

<span id="tn">02</span> <span id="cntb">고객회원에 의해 Pick이 선택된 경우 2단계인 세부조율단계로 넘어가고 
서비스 세부사항과 금액에 대한 최종결정을 하게 되며,<br> 전문가회원이 최종금액을 입력합니다.</span><br><br><br><br>

<span id="tn">03</span> <span id="cntb">최종결제단계에서 고객회원이 결제를 하면 서비스가 마무리됩니다.</span><br>
</div>



      
</body>
</html>



<%@ include file="../inc/bottom.jsp"%>