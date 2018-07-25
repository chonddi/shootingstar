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
<style type="text/css">
#msg{
	color:#1f1f1f;
	font-weight:700;
	border-bottom: 2px solid #e46c0a;
}

#msgTbl tr>td{
	padding-top:20px;
}
</style>
		쪽지함
	</div>
	<div class="selectedPage">
		<div class="msgBtn"><span><input type="button" id="sendMsg" value="보낸쪽지"></span><span>받은쪽지</span></div>
		<table id="msgTbl">
			<colgroup>
				<col style="width:20%">
				<col style="width:66%">
				<col style="width:*">
			</colgroup>
			<tr>
				<th scope="col">보낸 사람</th>
				<th scope="col">제목</th>
				<th scope="col">보낸날짜</th>
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
</div>
<%@ include file="../../inc/bottom.jsp"%>