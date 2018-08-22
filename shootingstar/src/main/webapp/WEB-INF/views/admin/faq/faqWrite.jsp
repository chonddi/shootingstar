<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>faqWrite</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faqWrite.css'/>" />
<script src="//cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").click(function(){		
			if($("#faqTitle").val().length > 60){
				alert("제목은 60자까지만 가능합니다.");
				$("#faqTitle").focus();
				return false;
			}else if($("#faqTitle").val().length == 0){
				alert("제목을 입력하세요.");
				$("#faqTitle").focus();
				return false;
			}
			
			var ckeditor = CKEDITOR.instances['faqContent']; 
			if (ckeditor.getData()==""){
			 alert('내용을 입력하세요');
			 ckeditor.focus();
			 return false;
			}
		});
	});
</script>
</head>
<body>
<form name="faqWrite" method="post" action="<c:url value='/admin/faq/faqWrite.do'/>" onsubmit="return send(this)">
	<h1>FAQ 작성</h1>
	<section class="sec1">
	<table id="faqTbl">
		<tr>
			<th>카테고리</th>
			<td>
				<select id="category" name="category">
					<option value="일반">일반</option>
					<option value="가입/탈퇴">가입/탈퇴</option>
					<option value="계정/로그인/인증">계정/로그인/인증</option>
					<option value="견적요청">견적요청</option>
					<option value="포트폴리오">포트폴리오</option>
					<option value="결제/환불">결제/환불</option>
					<option value="정산">정산</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="faqTitle" id="faqTitle" placeholder="제목을 입력하세요."></td>
		</tr>
	</table>
	</section>
	<section class="sec2">
		<textarea name="faqContent" id="faqContent" placeholder="내용을 입력하세요."></textarea>
		<script>
                CKEDITOR.replace( 'faqContent' );
		</script>
	</section>
	<section class="sec3">
		<input type="submit" id="submit" value="작성하기"/>
		<input type="button" value="FAQ 목록" onclick="location.href='<c:url value="/admin/faq/faqAdmin.do"/>'"/>
	</section>
<input type="hidden" id="adminId" name="adminId" value='${adminId}'>
</form>	
</body>
</html>