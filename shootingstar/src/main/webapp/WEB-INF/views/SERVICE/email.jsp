<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Email 문의</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/email.css'/>" />
<script type="text/javascript">
$(document).ready(function(){
	$("#send").click(function(){
		//공백 제거
		var str = $("#sName").val();
		var str2 = $("#email").val();
		var str3 = $("#tel").val();
		var str4 = $("#content").val();
		var sNameT = str.trim();
		var emailT = str2.trim();
		var telT = str3.trim();
		var conT = str4.trim();
		
		if(sNameT == ""){
			alert("이름을 입력하세요.");
			$("#sName").focus();
			return false;
		}else if(emailT == ""){
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return false;
		}else if(telT == ""){
			alert("전화번호를 입력하세요.");
			$("#tel").focus();
			return false;
		}else if(conT == ""){
			alert("내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
		
		//이메일 유효성 검사
		var email = $("#email").val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if(exptext.test(email) == false){
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
				alert("이메일 형식이 올바르지 않습니다.");
				$("#email").focus();
				return false;
			}
			
		if(confirm("전송하시겠습니까?")){
			$("form[name=efrm]").submit();
		}else{
			return false;
		}
			
	});//click
	
	//이름
	$("#sName").keydown(function (event) {
		//10자리까지만 가능
		var textLength = $(this).val().length;
			if (textLength > 10) {
				alert("최대 10자리까지만 가능합니다.");
	        	$(this).val($(this).val().substr(0, 10));
	        }
     });
	
	//이메일
	$("#email").keydown(function (event){
		//40자리까지만 가능
		var textLength = $(this).val().length;
			if (textLength > 40) {
				alert("최대 40자리까지만 가능합니다.");
	        	$(this).val($(this).val().substr(0, 40));
	        }
	});
	
	//전화번호
	$("#tel").blur(function (event) {
		//숫자만 가능
		var regexp = /[^0-9]/gi;
		var v = $(this).val();
			if (regexp.test(v)) {
				alert("숫자만 입력가능 합니다.");
				$(this).val('');
				$(this).focus();
				event.preventDefault();
         	}
		
		//숫자 11자리까지만 가능
		var textLength = $(this).val().length;
			if (textLength > 11) {
				alert("전화번호는 11자리까지만 가능합니다.");
	        	$(this).val($(this).val().substr(0, 11));
	        	event.preventDefault();
	        }else if (textLength < 9 && textLength > 0){
	        	alert("올바른 전화번호를 입력해주세요.");
	        	$(this).val('');
	        	$(this).focus();
	        	event.preventDefault();
	        }
     });
	
	//새로고침 방지
	function noEvent() {
        if (event.keyCode == 116 || (event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82))) {
            if(confirm("새로고침 하시면 작성한 정보가 지워집니다. 계속하시겠습니까?")){
            	return true;
            }else{ 
                event.keyCode = 2;
                return false;                	
            }
        }
    }
	
	document.onkeydown = noEvent;

});
</script>
</head>
<body>
<form name="efrm" action="<c:url value='/SERVICE/send.do'/>">
	<section id="sec1">
		<h1>문의 할 수 있는 내용</h1>
		<nav>
			<ol>
				<li>슈팅스타 사용 중에 어려움을 발견했어요.</li>
				<li>슈팅스타와 마케팅 및 제휴를 맺는데 궁금한게 있어요.</li>
				<li>회원 정보 수정에 관하여 물어보고 싶어요.</li>
				<li>결제와 관련하여 궁금한게 있어요.</li>
				<li>이용 중 버그나 에러가 발생했어요.</li>
				<li>불량한 고객이 있어요!</li>
			</ol>
		</nav>
	</section>
	<section id="sec2">
		<table id="table1">
			<tr>
				<th>전문가 이름 *</th>
				<th colspan="3"><input type="text" name="sName" id="sName" class="text" placeholder="박스타"></th>
			</tr>
			<tr>
				<th>이메일 *</th>
				<th><input type="text" name="email" id="email" class="text" placeholder="example@example.com"></th>
				<th>연락처</th>
				<th><input type="text" name="tel" id="tel" class="text" placeholder="01033335555(- 없이)"></th>
			</tr>
		</table>
	</section>
	<section id="sec3">
		<textarea name="content" id="content" placeholder="이용 및 제휴 문의 내용을 작성해주세요.&#13;&#10;이용상에 문제가 있는 경우 사용하시는 OS종류와 인터넷 브라우저를 기재하시면&#13;&#10;보다 정확한 답변을 드릴 수 있습니다."></textarea>
	</section>
	<section id="sec4">
		<input type="button" id="send" value="문의하기">
	</section>
</form>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>