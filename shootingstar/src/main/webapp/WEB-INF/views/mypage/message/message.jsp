<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#sendMsg').click(function(){
			x = (screen.availWidth - 460) / 2;
			y = (screen.availHeight - 550) / 2;
			window.open("<c:url value='/mypage/message/messageWrite.do'/>","쪽지보내기","left=" + x + ", top=" + y + ", width=460, height=550, location=yes, resizable=no");
		});
		$('#receiveMsg').click(function(){
			location.href="<c:url value='/mypage/message/messageReceive.do'/>";
		});
	});
</script>

<div><span>보낸쪽지</span><span><input type="button" id="receiveMsg" value="받은쪽지"></span></div>

	<table>
		<tr>
			<th>받는사람</th>
			<th>제목</th>
			<th>보낸날짜</th>
		</tr>
		<c:if test="${empty sendList}">
			<td colspan="3" style="text-align: center">보낸 쪽지가 없습니다.</td>
		</c:if>
		<c:if test="${!empty sendList }">
	    	<c:forEach var="sendMap" items="${sendList}">
			<tr>
				<td>${sendMap["RECIPIENT"] }</td>
	    		<td>${sendMap["TITLE"]}</td>
	    		<td><fmt:formatDate value="${sendMap['REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
	    	</c:forEach>
		</c:if>    
    </table>

    
</div>
    <div style="text-align: right"><input type="button" id="sendMsg" value="쪽지보내기"></div>
<%@ include file="../../inc/bottom.jsp"%>