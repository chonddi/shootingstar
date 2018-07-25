<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypageTop.jsp"%>
    
<script type="text/javascript">
	$(function(){
		/* 유효성 */
		$('#editFrm').click(function(){
			var bool=true;
			$('.val').each(function(){
				if($(this).val()==''){
					alert($(this).parent().parent().find('td').eq(0).text()+"를 입력해주세요");
					$(this).focus();
					bool=false;
					return false;
				}
			});
			return bool;
		});
		
		$('#outBtn').click(function(){
			if(confirm('탈퇴하시겠습니까?')){
				location.href="<c:url value='/mypage/del.do'/>";
			}
		});
	});
</script>
회원정보 수정
</div>
<div id="selectedPage">
<form name="frm" method="post"
			action="<c:url value='/mypage/sMemberEdit.do'/>" enctype="multipart/form-data">
	<fieldset class="formDiv">
		
		<div>
			${sMemberVo.sMemberId}
		</div>
		<div>
			${sMemberVo.sName}
		</div>
		<div>
			<input type="password" placeholder="비밀번호" id="sPwd" name="sPwd" class="valid"> 
		</div>
		<div>
			<input type="text" placeholder="휴대폰 번호" id="sTel" name="sTel"
				class="valid" value="${sMemberVo.sTel}"> <span>(-없이)</span>
		</div>
		
		<div><textarea name="pr" rows="10" cols="45" placeholder="회원님의 소개를 간략하게 입력해주세요" class="valid">${memberVo.pr }</textarea></div>
		<div><input type="text" placeholder="우편번호" id="zipcode" name="zipcode" size="7" class="valid addr" readonly="readonly" value="${sMemberVo.zipcode }">  
		<input type="button" id="btnZipcode" value="우편번호 검색"></div>
		<div><input type="text" placeholder="주소" id="address1" name="address1" size="60" readonly="readonly" class="addr" value="${sMemberVo.address1 }"> </div>
		<div><input type="text" placeholder="상세주소" id="address2" name="address2" size="60" class="valid addr" value="${sMemberVo.address2}"></div>
		<div><table id="fileTbl">
			<tr>
				<td>신분증 사본</td>
				<td><input type="file" id="identifi" name="identifi" class="valid2" style="display: inline-block;"></td>
			</tr>
			<tr style="margin-top: 10px">
				<td>계좌 사본</td>
				<td><input type="file" id="account" name="account" class="valid2" style="display: inline-block;"></td>
			</tr>
		</table></div> 
	</fieldset>
</form>



</div>
</div>
<%@ include file="../inc/bottom.jsp"%>