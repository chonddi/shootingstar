<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
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
	font-size:1.5em;
	margin-bottom: 45px;
}
#membership {
    color: #1f1f1f;
    font-weight: 700;
    border-bottom: 3px solid #e46c0a;
}
</style>
<script type="text/javascript">
	$(function(){
		//멤버십 구매하기
		$('#memBuy').click(function(){
			location.href="<c:url value='/mypage/membership/membershipBuy.do'/>";
		});
	});
</script>
		
		멤버십 관리
	</div>
	<div class="selectedPage">
		<div class="membershipTop">멤버십 만료일: </div>
		<div style="text-align: center;">
			
			<div>3개월 이용권 결제일시: 2018년 00월 00일 05:56:22</div>
			<div>3개월 이용권 결제일시: 2018년 00월 00일 05:56:22</div>
			<div>3개월 이용권 결제일시: 2018년 00월 00일 05:56:22</div>
			<div>3개월 이용권 결제일시: 2018년 00월 00일 05:56:22</div>
			<div>3개월 이용권 결제일시: 2018년 00월 00일 05:56:22</div>
		
		</div>
		<div class="alignRight"><input type="button" id="memBuy" value="멤버십 구매하기"></div>
	</div>
	
	
</div>




<%@ include file="../../inc/bottom.jsp"%>