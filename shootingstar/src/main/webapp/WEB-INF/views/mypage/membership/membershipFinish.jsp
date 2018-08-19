<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypageTop.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/payfinish.css'/>" />
<style type="text/css">
.selectedPage{
	width:50%;
    height: auto;
	text-align: center;
}
.selectName{
	width:50%;
}
#membership {
    color: #1f1f1f;
    font-weight: 700;
    border-bottom: 3px solid #e46c0a;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#membershipList").click(function(){
			location.href='<c:url value="/mypage/membership/membershipList.do"/>';
		});
		
		$("#mainPage").click(function(){
			location.href="<c:url value='/index.do'/>";
		});
	});
</script>

		멤버십 결제완료
	</div>
	<div class="selectedPage">
		<form name="fnFrm">
			<section class="sec2">
				<table class="table2">
					<tr>
						<th colspan="2">결제정보</th>
					</tr>
					<tr>
						<th>결제번호</th>
						<th>${vo.pNo}</th>
					</tr>
					<tr>
						<th>결제수단</th>
						<th>${vo.pMethod}</th>
					</tr>
					<tr>
						<th>구매 일시</th>
						<th><fmt:formatDate value="${vo.regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></th>
					</tr>
					<tr>
						<th>결제 금액</th>
						<th><fmt:formatNumber value="${vo.pPrice}" pattern="#,###"/> 원</th>
					</tr>
				</table>
			</section>
			<section class="sec3">
				<input type="button" id="membershipList" class="btns" value="멤버십 관리">
				<input type="button" id="mainPage" class="btns" value="메인페이지">
			</section>
		</form>
	</div>
</div>