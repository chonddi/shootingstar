<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
});

</script>
<style type="text/css">
th, td{ padding:10px;
}</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객회원 조회</title>
</head>
<body>
<h1>고객회원 목록</h1>
<c:if test="${!empty param.searchKeyword}">
	<p>검색어: ${param.searchKeyword}(으)로  ${fn:length(list)}건 검색되었습니다. </p> 
</c:if>
<c:if test="${empty param.searchKeyword}">
	<p>총 ${pageVo.totalRecord}건의 REQUEST가 조회되었습니다. </p> 
</c:if>
<form name="frmPage" method="post" action="<c:url value='/admin/member/memberList.do'/>">
<input type="hidden" name="currentPage" >	
</form>
<div>
	<table id="member">
	<thead>
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>탈퇴/복구</th>
		<th>정보수정</th>
	</tr>
	</thead>
	<tbody>
		<c:if test="${!empty list }"> 
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.rownum }</td>

					<td>${vo.name}</td>

					<td>${vo.memberId}</td>

<c:if test="${empty vo.outdate}">
					<td><a href="<c:url value='/admin/member/memberOut.do?id=${vo.memberId}'/>">탈퇴</a></td>
</c:if>
<c:if test="${!empty vo.outdate}">
					<td><a href="<c:url value='/admin/member/memberBack.do?id=${vo.memberId}'/>">계정복구</a></td>
</c:if>

					<td><a href="<c:url value='/admin/member/memberEdit.do?id=${vo.memberId}'/>">정보수정</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	</table>
</div>	
<br>
<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<c:if test="${pageVo.firstPage>1 }">
		<a href="#" onclick="pageFunc(${pageVo.firstPage-1})">
			<img alt="이전 블럭으로 이동" src="../images/first.JPG">
		</a>		
	</c:if>
	
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pageVo.firstPage }" end="${pageVo.lastPage}">
		<c:if test="${i==pageVo.currentPage }">
			<span style="color: blue;font-weight: bold;font-size:1.0em">
				${i}</span>
		</c:if>
		<c:if test="${i!=pageVo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
			[${i }]</a>
		</c:if>
	</c:forEach>
		
	<!-- 다음 블럭으로 이동 -->
	<c:if test="${pageVo.lastPage<pageVo.totalPage }">
		<a href="#" onclick="pageFunc(${pageVo.lastPage+1})">
			<img alt="다음 블럭으로 이동" src="../images/last.JPG">
		</a>	
	</c:if>
	<!--  페이지 번호 끝 -->
</div>
<br>

	<div class="divSearch">
	   	<form name="frmSearch" method="post" 
	   		action='<c:url value="/admin/member/memberList.do"/>'>
	        <select name="searchCondition">        	
	          <option value="memberId"
	            	<c:if test="${param.searchCondition=='memberId'}">
	            		selected="selected"
	            	</c:if>
	            >아이디</option>
	            <option value="name"
	            	<c:if test="${param.searchCondition=='name'}">
	            		selected="selected"
	            	</c:if>
	            >이름</option>
	           <option value="rownum"
	            	<c:if test="${param.searchCondition=='rownum'}">
	            		selected="selected"
	            	</c:if>
	            >회원</option>
	        </select>   
	        <input type="text" name="searchKeyword" title="검색어 입력"
	        	value="${param.searchKeyword}">   
			<input type ="image" src="<c:url value='../../images/black18s.png'/>" 
			align="absmiddle" >	
			
			
				
	    </form>
	</div>
<br>
</body>
</html>
<%@ include file="../../inc/adminBottom.jsp"%>