<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#sendMsg').click(function(){
			location.href="<c:url value='/mypage/message/message.do'/>";
		});
	});
</script>

<div><span><input type="button" id="sendMsg" value="보낸쪽지"></span><span>받은쪽지</span></div>

	<table>
		<tr>
			<th>보낸 사람</th>
			<th>제목</th>
			<th>보낸날짜</th>
		</tr>
		<c:if test="${empty receiveList}">
			<td colspan="3" style="text-align: center">받은 쪽지가 없습니다.</td>
		</c:if>
		<c:if test="${!empty receiveList }">
	    	<c:forEach var="receiveMap" items="${receiveList}">
			<tr>
				<td>${receiveMap["RECIPIENT"] }</td>
	    		<td>${receiveMap["TITLE"]}</td>
	    		<td><fmt:formatDate value="${receiveMap['REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
	    	</c:forEach>
    	</c:if>
    </table>
    
</div>
<%@ include file="../../inc/bottom.jsp"%>