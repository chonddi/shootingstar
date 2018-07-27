<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 삭제</title>
<style type="text/css">
body{
	text-align: center;
}
fieldset{
	width:500px;
	
}
</style>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("input[type=submit]").click(function(){
						
			if(!confirm("정말 삭제하시겠습니까?")){
				return false;
			}
		});
	});	
</script>
</head>
<body>
<div class="divForm">
<form name="noticeBack" method="post" 
	action="<c:url value='/faq/deleteOne.do'/>"
	onsubmit="return send(this)">
		<fieldset>
		<legend>글 삭제</legend>
			<input type="hidden" name="faqNo" value="${param.faqNo}">
	        <div>           
	        	<span class="sp">${param.faqNo} 번 글을 삭제하시겠습니까?</span>                        
	        </div>
	        <div class="center">
	            <input type ="submit"  value="삭제" />
	            <input type = "Button" value="글목록" onclick="location.href='<c:url value='/faq/faqAll.do'/>'" />
	        </div>
	    </fieldset>
    </form>
</div>

</body>
</html>