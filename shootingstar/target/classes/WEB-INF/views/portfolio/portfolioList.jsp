<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<head>
<script type="text/javascript">	
	$(document).ready(function(){
	});
	
		function pageFunc(curPage){
			document.frmPage.currentPage.value=curPage;
			frmPage.submit();
		}
	
	
</script>

<link href="<c:url value='/css/portfolioList.css'/>" rel="stylesheet">

<style type="text/css">
.pageNum1, .pageNum2, .pageNum3 {
	font-size: 1.0em;
	display: inline-block;
	width: 35px;
	height: 35px;
	margin: 0 4px;
	line-height: 35px;
}
.pageNum1 {
	color: white;
	font-weight: bold;
	background-color: rgba(52, 96, 147, 1);
	cursor: pointer;
}

.pageNum2 {
	color: black;
	background-color: white;
	cursor: pointer;
}

.pageNum3 {
	font-size: 0.8em;
	color: gray;
	background-color: white;
	cursor: pointer;
}

</style>

</head>
<body>
	<!-- 페이징 처리를 위한 form -->
	<form name="frmPage" method="post"
		action="<c:url value='/portfolio/portfolioList.do'/>">
		<input type="hidden" name="currentPage" value="">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
	</form>


	<div id="portfolioListSideBar">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" class="active"><a>카테고리</a></li>
			<li role="presentation"><a href='<c:url value="/portfolio/portfolioList.do?searchCondition=''&searchKeyword=''"/>'>전체보기</a></li>
		<c:forEach var="vo" items="${list }" begin="0" >
		<li role="presentation"><a href='<c:url value="/portfolio/portfolioList.do?searchCondition=${vo.cgNo }"/>'>${vo.cgName}</a></li>
		</c:forEach>
		</ul>
	</div>
	<div id="portSearch">
		<div id="topSearch">
		
		<c:if test="${!empty param.searchKeyword}">
			(카테이름) : <span>${totalRecord}건</span> 
		</c:if>
		<c:if test="${empty param.searchKeyword}">
			전체 조회 : <span>${totalRecord}건</span> 
		</c:if>

		</div>
		<form name="frmSearch" method="post" action='<c:url value="/portfolio/portfolioList.do"/>'>
			<div class="col-lg-6">
				<div class="input-group">
					<input type="text" class="form-control" name="searchKeyword" placeholder="작가명, 포트폴리오 타이틀로 검색"> 
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary">검색</button>
					</span>
				</div>
			</div>
			<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
		</form>
	</div>

		<c:forEach var="map" items="${vList}">
		<a href="<c:url value='/portfolio/portfolioDetail.do?pfNo=${map["PFNO"]}'/>">
		<div id="portList">
			<img alt="" src="<c:url value='/images/${map["FILENAME"]}'/>">
			<div id="listInfo">
				<div id="portName">${map["PFTITLE"]}</div>
				<div id="photoInfo">
					<span class="phothgrahper">phothgrahper</span> <span>${map["SNAME"]}</span> <span class="phothgrahper">${map["CGNAME"]}</span>
				</div>
			</div>
		</div>
		</a>
		</c:forEach>
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
</body>
<%@ include file="../inc/bottom.jsp"%>