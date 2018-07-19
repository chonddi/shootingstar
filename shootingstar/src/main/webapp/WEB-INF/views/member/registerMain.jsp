<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style type="text/css">
	#tbldiv{
		margin: 0 auto;
		text-align: center;
	}
	#tbl{
		margin: 0 auto;
	}
	
	#tbl td{
		padding: 30px;
	}
	.regi{
		margin-bottom: 20px;
		font-size: 1.3em;
	}
	.custom{
		color:#0e4699;
		font-weight: bold;
	}
	.customBtn{
		background:#0e4699;
		color: white;
	}
	.profess{
		color:#2c8e06;
		font-weight: bold;
	}
	.professBtn{
		background:#2c8e06;
		color: white;
	}
	.regidiv{
		padding:20px;
		padding-top:55px;
		border-radius: 20px;
		width: 300px;
		height: 320px;
	}
	.customdiv{
		border: 1px solid #0e4699;	
	}
	.professdiv{
		border: 1px solid #2c8e06;
	}
	.regiBtn{
		width: 100px;
    	height: 35px;
    	border-style:none; 
	}
	.imgs{
		padding-bottom: 15px;
	}
	.tblSpan{
		color:gray;
		font-size: 0.9em;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('#btnCustom').click(function(){
			location.href='<c:url value="/member/register.do"/>'
		});
		$('#btnProfess').click(function(){
			location.href='<c:url value="/sMember/sRegister.do"/>'
		});
	});
</script>

<div id="tbldiv">
	<table id="tbl">
		<tr>
		<td>
		<div class="regidiv customdiv">
			<div class="custom regi">고객회원</div>
			<img class="imgs" src="<c:url value='/images/custom.JPG'/>"><br>
			<span class="tblSpan">사진 견적 의뢰 <br>서비스를 이용하는 회원</span><br><br>
			<input type="button" id="btnCustom" class="customBtn regiBtn" value="가입하기">
		</div>
		</td>
		<td>
		<div class="regidiv professdiv">
			<div class="profess regi">전문가회원</div>
			<img class="imgs" src="<c:url value='/images/profess.JPG'/>"><br>	
			<span class="tblSpan">포트폴리오를 <br>등록할 수 있는 회원</span><br><br>
			<input type="button" id="btnProfess" class="professBtn regiBtn" value="가입하기">
		</div>
		</td>
		</tr>
	</table>
</div>
<%@ include file="../inc/bottom.jsp"%>