<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="<c:url value='/css/loginstyle.css'/>">
<style type="text/css">
	.regiBtn{
		border-style: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('.regiBtn').click(function(){
			location.href="<c:url value='/member/registerMain.do'/>";
		});
		if($('.ids').val()!=""){
			 $('.labels').addClass('active highlight');
		}
	});
</script>
 <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#login">고객회원</a></li>
        <li class="tab"><a href="#slogin">전문가회원</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="login">   
          <h1 style="font-size: 1.5em;">고객회원 로그인</h1>
          
          <form action="<c:url value='/login/loginMember.do'/>" method="post"
          	style="position:relative;">
          <div class="field-wrap" style="padding-bottom: 20px; margin-bottom: 20px;">
	 	  <input type="checkbox" name="saveId" id="saveId" style="
 			   height:15px;width:20px;position:absolute;top:6px;"  
				<c:if test="${!empty cookie.saveId}">
					checked="checked"
				</c:if>	>
		  <label for="saveId" style="padding-left:10px;font-size:0.9em;">아이디 저장하기</label>
		  </div>
          <div class="field-wrap">
            <label class="labels">
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off" class="ids" name="memberId" value="${cookie.saveId.value}"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="pwd"/>
          </div>
          <p class="forgot"><a href="#">Forgot Password?</a></p><br>
          <button type="submit" class="button button-block">로그인</button>
          <input type="button" class="regiBtn" value="회원가입">
          </form>
        </div>
        
        
        <div id="slogin">   
          <h1 style="font-size: 1.5em;">전문가회원 로그인</h1>
          
          <form action="<c:url value='/login/loginSMember.do'/>" method="post"
          		style="position:relative;">
          <div class="field-wrap" style="padding-bottom: 20px;margin-bottom: 20px;">
          <input type="checkbox" name="sSaveId" id="sSaveId" style="
 			   height:15px;width:20px;position:absolute;top:6px;" 
				<c:if test="${!empty cookie.sSaveId}">
					checked="checked"
				</c:if>	>
		  <label for="sSaveId" style="padding-left:10px;font-size:0.9em;">아이디 저장하기</label>
		  </div>
		  <div class="field-wrap">
            <label class="labels">
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off" class="ids" name="sMemberId" value="${cookie.sSaveId.value}"/>
          </div>
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="sPwd"/>
          </div>
          <p class="forgot"><a href="#">Forgot Password?</a></p><br>
          <button class="button button-block">로그인</button>
	      <input type="button" class="regiBtn" value="회원가입">
	      
          
          </form>

        </div>
        
      </div><!-- tab-content -->
</div> <!-- /form -->
<script  src="<c:url value='/js/login.js'/>"></script>
<%@ include file="../inc/bottom.jsp"%>