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
	IMP.init("imp23383302"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
   
	IMP.request_pay({
       pg : 'inicis', // version 1.1.0부터 지원.
       pay_method : 'card',
       merchant_uid : 'merchant_' + new Date().getTime(),
       name : '주문명:결제테스트',
       amount : document.getElementById("price").value,
       buyer_email : $("#memberid").val(),
       buyer_name : $("#name").val(),
       buyer_tel : $("#tel").val(),
   }, function(rsp) {
       if ( rsp.success ) {
		var msg = '결제가 완료되었습니다.';
		
		alert(msg);
		$(opener.document).find("form[name=frm]").attr("action","<c:url value='/index.do'/>").submit();
          
       } else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			
			alert(msg);
       		window.open("<c:url value=''/>");
       }
       
       setTimeout(function() {self.close()}, 10);
       
   });
	
   
});
</script>

<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<form name="frm2" method="post" action="<c:url value='/index.do'/>">
	
<!-- 임시값 -->
<input type="hidden" id="memberid" name="memberid" value="abc@naver.com"/>
<input type="hidden" id="name" name="name" value="고객이름"/>
<input type="hidden" id="tel" name="tel" value="01012341234"/>
<input type="hidden" id="price" name="price" value="100"/>
<%-- <input type="hidden" id="memberid" name="memberid" value="${vo.memberid}"/>
<input type="hidden" id="name" name="name" value="${vo.name}"/>
<input type="hidden" id="tel" name="tel" value="${vo.tel}"/>
<input type="hidden" id="price" name="price" value="${vo.price}"/> --%>
<!-- 세션 유저 코드 값 -->
<%-- <input type="hidden" id="userid" value="${sessionScope.userCode}"> --%>
<input type="hidden" id="userid" value="1">

</form>       
</body>
</html>