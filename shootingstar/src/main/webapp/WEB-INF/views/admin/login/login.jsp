<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="<c:url value='/css/loginstyle.css'/>">
<script type="text/javascript">
$(function(){

	if($('.ids').val()!=""){
		 $('.labels').addClass('active highlight');
	}
});
</script>
<style type="text/css">

</style>
<article class="form">
	<div class="content">
        <div id="login">   
          <h1 style="font-size: 1.5em;">관리자 로그인</h1>

	<form name="frmLogin" method="post" action="<c:url value='/admin/login/login.do'/>" style="position:relative;">
		 <div class="field-wrap" style="padding-bottom: 20px; margin-bottom: 20px;">
		<input type="checkbox" name="adminSaveId" id="adminSaveId" 
		 style="height:15px;width:20px;position:absolute;top:6px;"
					<c:if test="${!empty cookie.adminSaveId}">
						checked="checked"
					</c:if>	>
			<label for="adminSaveId" style="padding-left:10px;font-size:0.9em;">아이디 저장하기</label>
			</div><!-- field wrap -->
			<div class="field-wrap">
			<!-- <label class="labels">
			 Admin id<span class="req">*</span></label> -->
			<div>
				 <input type="text" required autocomplete="off" class="ids" name="adminId" 
				 value="${cookie.adminSaveId.value}" placeholder="Admin Id" />
         	 </div>
			</div>	
			<div class="field-wrap">
           <!--  <label class="labels">
              Password<span class="req">*</span>
            </label> -->
            	<input type="password"required autocomplete="off" name="pwd" placeholder="password"/>
          	</div>

			<button type="submit" class="button button-block">로그인</button>

	</form>
</div><!-- login -->
</div><!--tabcontent  -->

</article>

<%@ include file="../../inc/bottom.jsp" %>