<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/adminTop.jsp"%>
<%
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 관리자</title>

<style type="text/css">
#title{text-align: left;
vertical-align: middle;}
.button{padding: 10px 0 10px 0;
}
#button{
width:100px;
height:60px;
}
.faqdiv{
width:1500px;
margin: 50px auto;
}

</style>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />

<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$('body').css({'font-style':'NanumGothic'});
	
	$('th').not(':first').css('border-left','1px solid gray'); //옆줄
	$('.faq .tbody .content').hide(); //내용(짝수tr) 숨김
		
	$('.faq .tbody .title').find('#title').click(function(){
		$(this).parent().next().toggle();
	});

});
	
$('form[name=deleteFaq]').submit(function(){
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
function allChecked(bool){
	$('input[name=chk]').prop('checked', bool);
}
	</SCRIPT>
	</head>
	<body>
<div class="faqdiv">

	<h1>FAQ</h1>
	<p class="button">
	<input type="button" style=margin:10px; value="FAQ작성" class="mypageBtn"
 	onclick="location.href='<c:url value="/admin/faq/faqWrite.do"/>'"/>
 	</p>
<form name="deleteFaq" method="post"
action="<c:url value='/admin/faq/deleteFaq.do'/>">

	 <table class="faq">
	<thead>
	<tr id="linetop"><td colspan=9></td>
	</tr>

		<tr>	
		<th width=50px ><input type="checkbox" name="chkAll" 
	    	onclick="allChecked(this.checked)">
		</th>	
		<th width=90px onclick='location.href="<c:url value='/admin/faq/faqAdmin.do?category=일반'/>"'>
		일반</th>
		<th onclick='location.href="<c:url value='/admin/faq/faqAdmin.do?category=가입/탈퇴'/>"'>
		가입/탈퇴</th>
		<th onclick='location.href="<c:url value='/admin/faq/faqAdmin.do?category=계정/로그인/인증'/>"'>
		계정/로그인/인증</th>
		<th onclick='location.href="<c:url value='/admin/faq/faqAdmin.do?category=견적요청'/>"'>
		견적요청</th>
		<th onclick='location.href="<c:url value='/admin/faq/faqAdmin.do?category=포트폴리오'/>"'>
		포트폴리오</th>	
		<th onclick='location.href="<c:url value='/admin/faq/faqAdmin.do?category=결제/환불'/>"'>
		결제/환불</th>
		<th onclick='location.href="<c:url value='/admin/faq/faqAdmin.do?category=정산'/>"'>
		정산</th>
		<th onclick='location.href="<c:url value='/admin/faq/faqAll.do'/>"'>
		모아보기</th>
		</tr>
	<tr id="linebot"><td colspan=9></td>
	</thead>
	
		<tbody class="tbody">
	 	<c:if test="${empty list }">
		 	<tr class="notitle">
				<td colspan=8 style="color:gray ; font-size:1.0em">공지사항이 없습니다</td>
			</tr>
		</c:if>
		
		<c:if test="${!empty list }"> 
		<!--for 돌려서 db 출력  -->
			<c:forEach var="vo" items="${list}">
			<tr class="title">
			
				<!-- 삭제된 원본글에 '삭제된 글' 처리 -->
	 					<c:choose>
							<c:when test="${vo.delflag=='Y' }">
				<td colspan=1></td>
				<td colspan=1  id='quest'>Q. ${vo.faqNo}</td>
				<td colspan=4 class="notitle" style="color:gray ; font-size:1.0em">${vo.faqTitle }</td>	
				<td colspan=1 class="notitle">
								<span style="color:red ; font-size:1.0em">삭제된 글입니다</span>
							</c:when>
						<c:otherwise> 
				<td width=50px ><input type="checkbox" name="chk" value="${vo.faqNo}"></td>
						<c:choose>
							<c:when test="${vo.rownum=='0' }">
				<td id='quest'>Q. ${vo.faqNo}</td>	
							</c:when>
						<c:otherwise>
				<td id='quest'>Q ${vo.rownum}.</td>
						</c:otherwise>
						</c:choose>
				
				<td colspan=4 id="title">
				
					<c:if test="${fn:length(vo.faqTitle)>60}">
					${fn:substring(vo.faqTitle, 0, 60)}...
					</c:if>
					<c:if test="${fn:length(vo.faqTitle)<=60}">
					${vo.faqTitle}
					</c:if>
					
				</td>
				<td><fmt:formatDate value="${vo.faqRegdate}" pattern="yyyy-MM-dd"/></td>
						</c:otherwise>
							</c:choose>
				<td onclick="location.href='<c:url value="/admin/faq/faqEdit.do?faqNo=${vo.faqNo }"/>'">
				수정				
				</td>
				<!-- 삭제복구 -->	
					<c:choose>
						<c:when test="${vo.delflag=='N' }">
							<td onclick="location.href='<c:url value="/admin/faq/deleteOne.do?faqNo=${vo.faqNo }"/>'" >
							삭제
							</td>
						</c:when>
					<c:otherwise> 
				<td onclick="location.href='<c:url value="/admin/faq/faqBack.do?faqNo=${vo.faqNo }"/>'" >
					복구
				</td>
					</c:otherwise>
						</c:choose>
			</tr>
			<tr class="content">
			<td id="answer">
			<img alt="answer" src="<c:url value='../../images/answerc.PNG'/>" >
			</td>
				<td colspan=8>
				<div id='width'>
				${fn:replace(vo.faqContent, cn, br)}</div></td>
			</tr>

			</c:forEach>
		<!-- for 끝 -->
		</c:if> 
		</tbody>
	</table>   
<p class="button">
<input type="submit" value="삭제" class="mypageBtn"/>
</p>
</form>
</div>
	</body>
	</html>
<%@ include file="../../inc/adminBottom.jsp"%>