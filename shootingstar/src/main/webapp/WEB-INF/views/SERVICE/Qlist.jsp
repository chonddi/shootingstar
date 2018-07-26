<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>Q&A</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/QlistStyle.css'/>" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#regit").click(function(){
			if($("#userid").val() == ""){
				alert("로그인이 필요한 서비스입니다.");
				location.href="<c:url value='/login/login.do'/>";
				return false;
			}else if($("#userid").val() == 2){
				alert("고객 회원만 이용가능한 서비스입니다.");
				return false;
			}else{
				QwOpen();
			}
			
		});
	});

	function QwOpen(){
		x = (screen.availWidth - 600) / 2;
		y = (screen.availHeight - 500) / 2;
		window.open("<c:url value='/SERVICE/Qwrite.do'/>","Q&A 글쓰기","left=" + x + ", top=" + y + ", width=600, height=500, location=yes, resizable=no");
	}
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
	
	function detailFunc(qNo, memberid){
		document.detail.qNo.value=qNo;
		document.detail.memberid.value=memberid;
		detail.submit();
	}
	
</script>
</head>	
<body>
<h1>Q&A</h1>
<br><br>
<span style="color:gray;">관리자에게 1:1로 문의하실 사항이 있으시면 글을 작성해주세요.</span>
<!-- 세션 아이디 값 -->
<%-- <input type="hidden" id="userid" value="${sessionScope.userCode}"> --%>
<input type="hidden" id="userid" value="1">
<!-- 페이징 처리를 위한 form -->
<form name="frmPage" method="post" action="<c:url value='/SERVICE/Qlist.do'/>">
<input type="hidden" name="currentPage" >	
</form>
<!-- 디테일 처리를 위한 form -->
<form name="detail" method="post" action="<c:url value='/SERVICE/Qdetail.do'/>">
<input type="hidden" name="qNo">
<input type="hidden" name="memberid">
</form><br>

<div class="divList">
<table class="box2" summary="Q&A에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<colgroup>
		<col style="width:10%;" />	<!-- 번호 -->
		<col style="width:*;" />	<!-- 제목 -->
		<col style="width:10%;" />	<!-- 작성자 -->
		<col style="width:15%;" />	<!-- 작성일 -->		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	  </tr>
	</thead>
	<tbody>  
		<c:if test="${empty list }">
			<tr>
				<td colspan="4" style="text-align: center">
					글이 존재하지 않습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
		  	<!--게시판 내용 반복문 시작  -->	
		  	<c:forEach var="vo" items="${list}">
	  			<tr style="text-align:center">
					<td>${vo.qNo}</td>
					<td style="text-align:left">
						<c:if test="${sessionScope.id == vo.memberid}">
							<a href="#" onclick="detailFunc(${vo.qNo}, '${vo.memberid}')">
							<!-- 제목이 긴 경우 일부만 보여주기 -->
								<c:if test="${fn:length(vo.qTitle)>50}">	
									${fn:substring(vo.qTitle, 0, 50)}...
								</c:if>
								<c:if test="${fn:length(vo.qTitle)<=50}">
									${vo.qTitle}
								</c:if>
							</a>
						</c:if>
						<c:if test="${sessionScope.id != vo.memberid}">
							<span style="color:gray;font-size:0.9em;">비공개 글입니다.</span>&nbsp;
							<img src="<c:url value='/images/lock.PNG'/>" alt="lock 이미지" style="vertical-align:middle;">
						</c:if>
						<!-- 댓글이 달린 경우 댓글 수 보여주기 -->
<%-- 						<c:if test="${!empty rlist.size}">
							(${fn:length(rlist})
						</c:if> --%>
						<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->
						<c:if test="${vo.newImgTerm<24 }">
							&nbsp;&nbsp;&nbsp;<img src="<c:url value='/images/new.png'/>" alt="new 이미지">
						</c:if>
					</td>
					<td>
						<c:if test="${sessionScope.id == vo.memberid}">
							${vo.memberid}
						</c:if>
						<c:if test="${sessionScope.id != vo.memberid}">
							<c:if test="${fn:length(vo.memberid)>3}">
								<span style="color:gray;font-size:0.9em;">	
									${fn:substring(vo.qTitle, 0, 3)}****
								</span>
							</c:if>
						</c:if>
					</td>
					<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy.MM.dd."/></td>
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
<div class="divBtn">
	<input type="button" id="regit" value="Q&A 작성하기" style="cursor:pointer;">
</div>
<br>
</body>
</html>

<%@ include file="../inc/bottom.jsp" %>
