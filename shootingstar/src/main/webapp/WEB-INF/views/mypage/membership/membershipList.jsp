<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypageTop.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
<style type="text/css">
.selectedPage{
	width:40%;
	text-align: center;
}
.selectName{
	width:40%;
}
.membershipTop{
	font-weight: bold;
	font-size:1.2em;
    margin-top: 10px;
	margin-bottom: 45px;
}
#membership {
    color: #1f1f1f;
    font-weight: 700;
    border-bottom: 3px solid #e46c0a;
}
.mypageBtn{
	width:120px;
	height: 35px;
	font-size: 0.8em;
}
.listDiv{
	width: 70%;
    margin: 0 auto;
    border: 1px solid #376092;
    border-radius: 7px;
    margin-bottom: 15px;
    padding: 10px;
}
.divPage a:hover{
	cursor:pointer;
}
</style>
<script type="text/javascript">
	$(function(){
		//멤버십 구매하기
		$('#memBuy').click(function(){
			location.href="<c:url value='/mypage/membership/membershipBuy.do'/>";
		});
	});
	//페이징처리
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
		
		<span class="title">멤버십 관리</span>
	</div>
	<!-- 페이징 처리를 위한 form -->
	<form name="frmPage" method="post" action="<c:url value='/mypage/membership/membershipList.do'/>">
		<input type="hidden" name="currentPage" >
	</form>
	<div class="selectedPage">
		<div class="membershipTop">멤버십 만료일<span style="font-size: 0.9em; font-weight: 300"> <fmt:formatDate value='${sMemberVo.membership }' pattern="yyyy-MM-dd hh:mm:ss"/> </span></div>
		<div style="text-align: center;">
			<c:if test="${empty list }">
				<div>멤버십 결제 내역이 없습니다.</div>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="map" items="${list}">
					<div class="listDiv">${map['PCONTENT']} 이용권 &nbsp;&nbsp;&nbsp;  결제일시: <fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd hh:mm:ss"/></div>
				</c:forEach>
			</c:if>
		</div>
		<div class="alignRight" style="margin-top: 30px;"><input type="button" id="memBuy" class="mypageBtn" value="멤버십 구매하기"></div>
		
		<!-- 페이지처리 -->
		<div class="divPage" style="clear: both; margin-top:30px;">
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
	</div>
	
	
</div>




<%@ include file="../../inc/bottom.jsp"%>