<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="<c:url value='/css/loginstyle.css'/>">
<style type="text/css">
	#regiBtn{
		border-style: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('#regiBtn').click(function(){
			location.href="<c:url value='/member/registerMain.do'/>";
		});
	});
</script>
 <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">고객회원</a></li>
        <li class="tab"><a href="#login">전문가회원</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>고객회원 로그인</h1>
          
          <form action="<c:url value='/login/loginMember.do'/>" method="post">
          <div class="field-wrap" style="padding-bottom: 20px;">
	 	  <input type="checkbox" name="saveId" id="saveId" 
					<c:if test="${!empty cookie.saveId}">
						checked="checked"
					</c:if>	>
		  <label for="saveId">아이디 저장하기</label>
		  </div>
          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off" name="memberId"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="pwd"/>
          </div>
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          <button type="submit" class="button button-block">로그인</button>
          </form>
        </div>
        
        
        <div id="login">   
          <h1>전문가회원 로그인</h1>
          
          <form action="<c:url value='/login/loginSMember.do'/>" method="post">
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off" name="sMemberId"/>
          </div>
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="sPwd"/>
          </div>
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          <button class="button button-block">로그인</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      <input type="button" id="regiBtn" value="회원가입">
</div> <!-- /form -->
<script  src="<c:url value='/js/login.js'/>"></script>
<%@ include file="../inc/bottom.jsp"%>