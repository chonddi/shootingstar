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
	});
</script>
    
    
    <input type="button" id="sendMsg" value="쪽지보내기">
</div>
<%@ include file="../../inc/bottom.jsp"%>