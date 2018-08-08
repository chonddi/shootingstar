<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Email 문의</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/email.css'/>" />
<script type="text/javascript">

</script>
</head>
<body>
<form name="efrm" action="<c:url value='/SERVICE/send.do'/>">
	<section id="sec1">
		<h1>문의 할 수 있는 내용</h1>
		<nav>
			<ol>
				<li>a</li>
				<li>b</li>
				<li>c</li>
				<li>d</li>
				<li>e</li>
				<li>f</li>
				<li>g</li>
			</ol>
		</nav>
	</section>
	<section id="sec2">
		<table id="table1">
			<tr>
				<th>전문가 이름 *</th>
				<th colspan="3"><input type="text" id="sName" class="text" placeholder="빅스타"></th>
			</tr>
			<tr>
				<th>이메일 *</th>
				<th><input type="text" id="email" class="text" placeholder="example@example.com"></th>
				<th>연락처</th>
				<th><input type="text" id="tel" class="text" placeholder="01033335555(- 없이)"></th>
			</tr>
		</table>
	</section>
	<section id="sec3">
		<textarea id="content" placeholder="이용 및 제휴 문의 내용을 작성해주세요.&#13;&#10;이용상에 문제가 있는 경우 사용하시는 OS종류와 인터넷 브라우저를 기재하시면&#13;&#10;보다 정확한 답변을 드릴 수 있습니다.">
		</textarea>
	</section>
	<section id="sec4">
		<button id="send">문의하기</button>
	</section>
</form>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>