<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>슈팅스타 공지사항</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	var flag=true;
	$('.notice .tbody tr:odd').hide(); //내용(짝수tr) 숨김
	
	$('.notice .tbody tr:even').click(function(){ //제목(홀수tr) 클릭하면
		$(this).next("tr").toggle(); //show()
		
		if(flag){ //아이콘 스위치
			$('#icon').prop('src',"<c:url value='/images/noticeup.png'/>" );
		}else{	
			$('#icon').prop('src',"<c:url value='/images/noticedown.png'/>" );
		}
		flag=!flag;
	});
});
</SCRIPT>
</head>
<body>
<h1>공지사항</h1>
<hr>
 <table class="notice">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th colspan=2>날짜</th>

		</tr>
	</thead>
	<tbody>

 	<c:if test="${empty list }">
	 	<tr>
			<td colspan=4>공지사항이 없습니다</td>
		</tr>
	</c:if>
	
	<!-- 체크박스 삭제 기능? -->
	
	<c:if test="${!empty list }"> 
	<!--for 돌려서 db 출력  -->
		<c:forEach var="noticeVo" items="${list }">
		<tr>
			<td>${noticeVo.Nno }</td>
			<td>${noticeVo.Ntitle }</td>
			<td><fmt:formatDate value="${noticeVo.regdate }" pattern="yyyy-MM-dd"/></td>
			<td><image src="<c:url value='/images/noticedown.png'/>"  width="30px" id="icon"></td>
		</tr>
		<tr>
			<td colspan=3>${noticeVo.Ncontent }</td>
			<td><input type="button" value="수정" onclick="location.href='<c:url value="/notice/noticeEdit.do?Nno=${noticeVo.Nno}"/>'"></td>
		</tr>
		</c:forEach>
	<!-- for 끝 -->
	</c:if> 
	</tbody>
</table>   

<!-- 검색없음!!! 페이징!!! -->
<input type="button" value="공지사항 작성" onclick="location.href='<c:url value="/notice/noticeWrite.do"/>'">
</body>
</html>