<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
<style type="text/css">
.selectedPage{
	width:50%;
    height: 430px;
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
span{
	font-weight: bold;
}
.h1{
	font-weight: bold;
	font-size: 1.5em;
	margin-top:60px;
	margin-bottom: 40px;
}
#finishTable{
	width:40%;
	margin:0 auto;
}
#finishTable tr td:nth-child(odd){
	font-weight: bold;
	padding:  8px;
}
.tblDiv{
    margin-bottom: 65px;
}
.mypageBtn{
    width: 164px;
}

</style>
<script type="text/javascript">
	$(function(){
		$('#mlBtn').click(function(){
			location.href='<c:url value="/mypage/membership/membershipList.do"/>';
		});
	});
</script>

		멤버십 결제완료
	</div>
	<div class="selectedPage">
		<div class="h1">결제가 완료되었습니다.</div>
		<div class="tblDiv">
			<table id="finishTable">
				<tr>
					<td>결제번호</td>
					<td>${mSPaymentVo.pNo }</td>
					<td>결제수단</td>
					<td>${mSPaymentVo.pMethod }  </td>
				</tr>
				<tr>
					<td>멤버십 이용권</td>
					<td>${mSPaymentVo.pContent }</td>
					<td>결제금액</td>
					<td><fmt:formatNumber value="${mSPaymentVo.pPrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td>결제 일시</td>
					<td colspan="3" style="padding-right: 55px;"><fmt:formatDate value="${mSPaymentVo.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
				</tr>
			</table>
		
			
		</div>
		<div style="text-align: center;">
			<input type="button" id="mlBtn" class="mypageBtn" value="결제 내역 보기">
		</div> 

	</div>
</div>