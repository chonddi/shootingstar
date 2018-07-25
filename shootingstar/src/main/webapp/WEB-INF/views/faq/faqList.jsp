<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>
<style type="text/css">

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
/* 	$('th').click(function(){
		var ctg= $('#ctg').val();
		var thead= $(this).text();
			if(true){
			alert("thead="+thead+", ctg="+ctg);
			} 
		$(this).css('color','blue'); 
		}
	}); */
	//alert('${param.category}');
	/*$('th').each(function(){
		 if(this.text 가 param.category와 같다면){
			this.text에 css
		}); */
/* 	var param= ${param.category} ;
	$('th').each(function(){
		if($(this).text()=='정산'){
			alert(param);
		}
	}); */

/* 	$('th').click(function(){
		$(this).css('color','blue')
	}); */
});


	
	</SCRIPT>
	</head>
	<body>
	<h1>FAQ</h1>
	 <table class="faq">

	<thead>
	<tr id="linetop"><td colspan=7></td>
	</tr>
		<tr>		
		<th onclick='location.href="<c:url value='/faq/faqList.do?category=일반'/>"'>
		일반</th>
		<th onclick='location.href="<c:url value='/faq/faqList.do?category=가입/탈퇴'/>"'>
		가입/탈퇴</th>
		<th onclick='location.href="<c:url value='/faq/faqList.do?category=계정/로그인/인증'/>"'>
		계정/로그인/인증</th>
		<th onclick='location.href="<c:url value='/faq/faqList.do?category=견적요청'/>"'>
		견적요청</th>
		<th onclick='location.href="<c:url value='/faq/faqList.do?category=포트폴리오'/>"'>
		포트폴리오</th>	
		<th onclick='location.href="<c:url value='/faq/faqList.do?category=결제/환불'/>"'>
		결제/환불</th>
		<th onclick='location.href="<c:url value='/faq/faqList.do?category=정산'/>"'>
		정산</th>
		</tr>
	<tr id="linebot"><td colspan=7></td></tr>
	</thead>

	 
<%-- 	<input type="hidden" value="${param.category }" id="ctg"> --%>
		<tbody class="tbody">
	 	<c:if test="${empty list }">
		 	<tr class="notitle">
				<td colspan=7 style="color:gray ; font-size:1.0em">공지사항이 없습니다</td>
			</tr>
		</c:if>
		
		<c:if test="${!empty list }"> 
		<!--for 돌려서 db 출력  -->
			<c:forEach var="vo" items="${list}">
			<tr class="title">
			
				<!-- 삭제된 원본글에 '삭제된 글' 처리 -->
	 					<c:choose>
							<c:when test="${vo.delflag=='Y' }">
							<td colspan=7 class="notitle">
								<span style="color:gray ; font-size:1.0em">삭제된 글입니다</span>
							</c:when>
						<c:otherwise> 
				
				<td width=150px id='quest'>Q ${vo.rownum}.</td>
				
				<td id="title" colspan=6>
				
					<c:if test="${fn:length(vo.faqTitle)>60}">
					${fn:substring(vo.faqTitle, 0, 60)}...
					</c:if>
					<c:if test="${fn:length(vo.faqTitle)<=60}">
					${vo.faqTitle}
					</c:if>
					
				</td>
				<%-- <td><fmt:formatDate value="${vo.faqRegdate}" pattern="yyyy-MM-dd"/></td> --%>
				</c:otherwise>
					</c:choose>
			</tr>
			<tr class="content">
			<td id="answer">
			<img alt="answer" src="<c:url value='../images/answerc.PNG'/>" >
			</td>
				<td colspan=6>
				
				<div id='width'>
				${fn:replace(vo.faqContent, cn, br)}
				</div>
				</td>
			</tr>

			</c:forEach>
		<!-- for 끝 -->
		</c:if> 
		</tbody>
	</table>   
 
	<!-- 검색없음!!! 페이징!!! -->
	</body>
	</html>