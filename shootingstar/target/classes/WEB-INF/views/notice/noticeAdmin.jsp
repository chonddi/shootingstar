<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminTop.jsp"%>
<%
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
/*
자바스크립트 줄바꿈 : cn  
html 줄바꿈: br 
&nbsp; (non breaking space, 공백을 다수 표시)
cn부터 먼저 해줘야함
*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>슈팅스타 관리자 공지사항</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/notice.css'/>" />
<style type="text/css">
/* .on{
	background-image:url(<c:url value='/images/noticeup.png'/>);
	background-repeat: no-repeat;

	 background-size:50px; 

}
.off{
	background-image:url(<c:url value='/images/noticedown.png'/>);
	background-repeat: no-repeat;

	 background-size:50px; 

}
 */
 #width{padding-left:200px;
	padding-right:200px;}
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){

	$('.notice .tbody .content').hide(); //내용(짝수tr) 숨김
	
/* 	$('.notice .tbody .title').click(function(){ //제목(홀수tr) 클릭하면 (체크박스 제외)

			$(this).next(".content").toggle();
		
		var iconClass= $(this).find("#icon").attr("class");	
			$(this).find("#icon").removeClass('off');
			$(this).find("#icon").addClass('on');
			
			if(iconClass=="on"){
				$(this).find("#icon").removeClass('on');
				$(this).find("#icon").addClass('off');
			
			} 
	}); */
	
	$('.notice .tbody .title').find('#title').click(function(){
		$(this).parent().next().toggle();
	})

	$('form[name=deleteNotice]').submit(function(){
		var count=0;
		$('input[name=chk]').each(function(idx, item){
			if($(this).is(':checked')){
				count++;
			}
		});	
		
		if(count==0){
			alert('삭제할 글을 체크하세요');
			return false;
		}
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}
	});
	
	
	
});
	function allChecked(bool){
		$('input[name=chk]').prop('checked', bool);
	}
</SCRIPT>
</head>
<body>
<h1>공지사항</h1>
<input type="button" value="공지사항작성" 
 onclick="location.href='<c:url value="/notice/noticeWrite.do"/>'"/>

<form name="deleteNotice" method="post"
action="<c:url value='/notice/noticeDelete.do'/>">
 <table class="notice">
 <colgroup>
		<col style="width:3%;" />
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:7%;" />
</colgroup>
	<thead>
		<tr>
			<th><input type="checkbox" name="chkAll" 
	    	onclick="allChecked(this.checked)"></th>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>수정</th>
			<th>삭제/복구</th>
		</tr>
	</thead>
	<tbody class="tbody">


 	<c:if test="${empty list }">
 	
	 	<tr>
			<td colspan=6>공지사항이 없습니다</td>
		</tr>
	</c:if>
	
	<c:if test="${!empty list }"> 
	<!--for 돌려서 db 출력  -->
		<c:forEach var="vo" items="${list}">
		<tr class="title">
			
			<!-- 삭제된 원본글에 '삭제된 글' 처리 -->
 					<c:choose>
						<c:when test="${vo.delflag=='Y' }">
						<td colspan=5>
							<span style="color:gray ; font-size:1.0em">삭제된 글입니다</span>
						</c:when>
					<c:otherwise> 
			<td>
			<input type="checkbox" name="chk" value="${vo.nNo}">
			</td>
			<td>${vo.nNo}</td>
			<td id="title">
				<c:if test="${fn:length(vo.nTitle)>40}">
				${fn:substring(vo.nTitle, 0, 40)}...
				</c:if>
				<c:if test="${fn:length(vo.nTitle)<=40}">
				${vo.nTitle}
				</c:if>
			</td>
			<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
			<td onclick="location.href='<c:url value="/notice/noticeEdit.do?nNo=${vo.nNo }"/>'">
			수정				
			</td>
			</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${vo.delflag=='N' }">
						<td onclick="location.href='<c:url value="/notice/deleteOne.do?nNo=${vo.nNo }"/>'" >
						삭제
						</td>
					</c:when>
				<c:otherwise> 
			<td onclick="location.href='<c:url value="/notice/noticeBack.do?nNo=${vo.nNo }"/>'" >
				복구
			</td>
				</c:otherwise>
				</c:choose>	
		</tr>
		<tr class="content">
			<td colspan=6><div id="width">${fn:replace(vo.nContent, cn, br)}</div></td>
		</tr>
		</c:forEach>
	<!-- for 끝 -->
	</c:if> 
	</tbody>
</table>
<p id="button">
<input type="submit" value="삭제"/>

 </p>
</form>

 
<!-- 검색없음!!! 페이징!!! -->
</body>
</html>
<%@ include file="../inc/adminBottom.jsp"%>