<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>결제창 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp26546611"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	//IMP.init("imp23383302"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
   
	IMP.request_pay({
       pg : 'inicis', // version 1.1.0부터 지원.
       pay_method : $("#pMethod").val(),
       merchant_uid : 'merchant_' + new Date().getTime(),
       name : '견적요청 결제',
       amount : document.getElementById("sPrice").value,
       buyer_email : $("#memberId").val(),
       buyer_name : $("#name").val(),
       buyer_tel : $("#tel").val(),
   }, function(rsp) {
       if ( rsp.success ) {
		var msg = '결제가 완료되었습니다.';
		
		alert(msg);
		$("form[name=payfrm]").submit();
		opener.parent.location.href="<c:url value='/payment/port_payfinish.do?no=${param.no}'/>";
          
       } else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			
			alert(msg);
       		window.open("<c:url value='/request/detail.do?no=${param.no}'/>");
       }
       
       setTimeout(function() {self.close()}, 10);
       
   });
	
});

</script>
<body>
<form name="payfrm" method="post" action="<c:url value='/payment/port_payfinish.do'/>">
	<input type="hidden" id="RQNo" name="RQNo" value="${payfinishVo.RQNo}"/>
	<input type="hidden" id="CGNo" name="CGNo" value="${payfinishVo.CGNo}"/>
	<input type="hidden" id="rqRegion" name="rqRegion" value="${payfinishVo.rqRegion}"/>
	<input type="hidden" id="rqDetail" name="rqDetail" value="${payfinishVo.rqDetail}"/>
	<input type="hidden" id="memberId" name="memberId" value="${payfinishVo.memberId}"/>
	<input type="hidden" id="pickNo" name="pickNo" value="${payfinishVo.pickNo}"/>
	<input type="hidden" id="sMemberid" name="sMemberid" value="${payfinishVo.sMemberid}"/>
	<input type="hidden" id="sPrice" name="sPrice" value="${payfinishVo.sPrice}"/>
	<input type="hidden" id="sName" name="sName" value="${payfinishVo.sName}"/>
	<input type="hidden" id="name" name="name" value="${payfinishVo.name}"/>
	<input type="hidden" id="tel" name="tel" value="${payfinishVo.tel}"/>
	<input type="hidden" id="pMethod" name="pMethod" value="card"/>
	<input type="hidden" id="mileage" name="mileage" value="${payfinishVo.mileage}"/>
	<input type="hidden" id="useMile" name="useMile" value="${payfinishVo.useMile}"/>
	
	<!-- 세션 유저 코드 값 -->
	<input type="hidden" id="userCode" value="${sessionScope.userCode}">
</form>
</body>
</html>