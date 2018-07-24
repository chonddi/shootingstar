<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp"%>

<!DOCTYPE html>	
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
$('.price').bind("keyup", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
});
</script>

<title>Insert title here</title>
</head>

<body><br>

<div class="divP">
	<form name="frm1" method="post" 
		action="<c:url value='/request/write3.do'/>" onsubmit="return send(this)">
	   <table class="pWrite">
		  <tr>
		     <th>
				<div>
		            <label for="name">선택하신 항목은   <span id="cg2">${cg1}</span> 입니다. <br><br>
		            				원하시는 가격을 입력하세요.</label><br><br>
		            <input type="text" style="text-align:right;" class="price" name="price"/>원
		            <input type="hidden" id="cg1" name="cg1" value="${cg1 }"> 
		        </div>
		        <br>
		        	<input type="submit"  value="입력완료"/>
             </th>
          </tr>
       </table>
     </form>
</div>	
	
	



</body>
</html>
<%@ include file="../inc/bottom.jsp"%>