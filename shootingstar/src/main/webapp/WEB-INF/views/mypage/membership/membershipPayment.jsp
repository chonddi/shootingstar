<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
	
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp23383302"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '멤버십 결제: ${mSPaymentVo.pContent}',
	    //amount : ${mSPaymentVo.pPrice},
	    amount : 100,
	    buyer_name : '${sessionScope.name}',
	    buyer_email : '${sessionScope.userid}'
	}, function(rsp) {
	    if ( rsp.success ) {
	        opener.document.paymentFrm.pPrice.value=${mSPaymentVo.pPrice};
		    opener.document.paymentFrm.pContent.value='${mSPaymentVo.pContent}';
		    opener.document.paymentFrm.period.value=${mSPaymentVo.period};
		    opener.document.paymentFrm.submit();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    	alert(msg);
	    }
	    self.close();
	});
</script>
