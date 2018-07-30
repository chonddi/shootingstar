<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm1" method="post" class="cau1"
		action="<c:url value='/request/write3.do'/>" onsubmit="return send(this)">
				
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