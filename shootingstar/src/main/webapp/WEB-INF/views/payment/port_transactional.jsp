<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Request 거래 내역 페이지</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/QlistStyle.css'/>" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#review").click(function(){
			RwOpen();
		});
	});

	function RwOpen(){
		x = (screen.availWidth - 600) / 2;
		y = (screen.availHeight - 500) / 2;
		var pNo = document.getElementById("pNo").value;
		window.open("<c:url value='/payment/Twrite.do?no=" + pNo + "'/>","후기 작성","left=" + x + ", top=" + y + ", width=600, height=500, location=yes, resizable=no");
	}
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}

</script>
</head>
<body>
<h1>나의 거래 내역</h1>
<br><br>
<span style="color:gray;">나의 Request(견적) 거래 내역을 확인할 수 있습니다.</span>
<!-- 페이징 처리를 위한 form -->
<form name="frmPage" method="post" action="<c:url value='/payment/Tlist.do'/>">
<input type="hidden" name="currentPage" >	
</form>
<br>

<div class="divList">
<table class="box2" summary="Q&A에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<colgroup>
		<col style="width:10%;" />	<!-- 주문번호 -->
		<col style="width:15%;" />	<!-- 결제일시 -->		
		<col style="width:10%;" />	<!-- 전문가 이름 -->
		<col style="width:15%;" />	<!-- 전문가 아이디 -->
		<col style="width:10%;" />	<!-- 카테고리 -->
		<col style="width:10%;" />	<!-- 사용한 마일리지 -->
		<col style="width:10%;" />	<!-- 결제 금액 -->
		<col style="width:10%;" />	<!-- 결제 방법 -->
		<col style="width:*;" />	<!-- 후기 -->
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">주문번호</th>
	    <th scope="col">결제일시</th>
	    <th scope="col">전문가 이름</th>
	    <th scope="col">전문가 아이디</th>
	    <th scope="col">카테고리</th>
	    <th scope="col">사용한 마일리지</th>
	    <th scope="col">결제금액</th>
	    <th scope="col">결제방법</th>
	    <th scope="col">후기</th>
	  </tr>
	</thead>
	<tbody>  
		<c:if test="${empty list }">
			<tr>
				<td colspan="9" style="text-align: center">
					글이 존재하지 않습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
		  	<c:forEach var="vo" items="${list}">
	  			<tr style="text-align:center">
					<td>
						${vo.pNo}
						<input type="hidden" id="pNo" value="${vo.pNo}">
					</td>
					<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
					<td>${vo.sName}</td>
					<td>${vo.sMemberid}</td>
					<td>${vo.cgName}</td>
					<td>${vo.useMile}</td>
					<td>${vo.pPrice}</td>
					<td>${vo.pMethod}</td>
					<c:if test="${vo.flag == 'N'}">
						<td><input type="button" name="review" id="review" value="후기등록"></td>
					</c:if>
					<c:if test="${vo.flag == 'Y'}">
						<td>후기완료</td>
					</c:if>
				</tr>
			</c:forEach>
		  	<!--반복처리 끝  -->
	  	</c:if>
	</tbody>
</table>
</div>
<br>
<br>
<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<c:if test="${pageVo.firstPage>1 }">
		<a href="#" onclick="pageFunc(${pageVo.firstPage-1})">
			<span class="pageNum3">
			PREV
			</span>
		</a>
	</c:if>
	
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pageVo.firstPage }" end="${pageVo.lastPage}">
		<c:if test="${i==pageVo.currentPage }">
			<span class="pageNum1">
				${i}</span>
		</c:if>
		<c:if test="${i!=pageVo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
				<span class="pageNum2">
				${i}
				</span>
			</a>
		</c:if>
	</c:forEach>

	<!-- 다음 블럭으로 이동 -->
	<c:if test="${pageVo.lastPage<pageVo.totalPage }">
		<a href="#" onclick="pageFunc(${pageVo.lastPage+1})">
			<span class="pageNum3">
			NEXT
			</span>
		</a>
	</c:if>
	<!--  페이지 번호 끝 -->
</div>
<br>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>