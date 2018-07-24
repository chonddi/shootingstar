<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>쪽지 보내기</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/msgWrite.css'/>" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#regit").click(function(){
			var bool= true;
			$('.text').each(function(idx, item) {
				if ($(this).val().length < 1) {
					alert($(this).prop("placeholder"));
					$(this).focus();
					bool=false;
					return false; //each() 탈출
				}
			});
			if(bool){
				if($('#idCount').val()!='Y'){
					alert('아이디가 없습니다.');
					$('#receiver').focus();
					bool=false;
					return false;
				}
				if(bool){
					if(confirm("전송하시겠습니까?")){
						$('form[name=msgFrm]').submit();
						
						opener.parent.location.reload();
					}
				}
			}
					setTimeout(function() {self.close()}, 10);
		});
		
		$('#receiver').keyup(function(){
			var receiverId=$('#receiver').val();
			$.ajax({
				url:"<c:url value='/mypage/message/messageWriteReceiver.do' />",
				type:"GET",
				data:"receiver="+receiverId,	//파라미터
				success:function(res){
					if(res>0){
						$('#noId').css('display', 'none');
						$('#idCount').val('Y');
					}else{
						$('#noId').css('display','');
						$('#idCount').val('N');
					}
				},
				error:function(xhr, status, error){
					alert('error:'+error+", status: "+status)
				}
				
			});
		});
		
		$('#title').keydown(function(){
			if($(this).val().length > 30){
				alert("제목은 30자 이내만 가능합니다.");
		        $(this).val($(this).val().substr(0, 30));
			}			
		});
		
		$('#title').keydown();
		
		//글자수 체크하기
		var textCountLimit = 1000;
		
		$('#content').keydown(function (e){
			//텍스트영역의 길이를 체크
	        var textLength = $(this).val().length;
			
			//입력된 텍스트 길이를 #textleng에 업데이트 해줌	     	
		    var content = $(this).val();
		    $('#textleng').html(content.length + '/1000');
		    
	     	//제한된 길이보다 입력된 길이가 큰 경우 제한 길이만큼만 자르고 텍스트영역에 넣음
	        if (textLength > textCountLimit) {
	        	$(this).val($(this).val().substr(0, textCountLimit));
	        }

		});
		
		$('#content').keydown();
		
		//새로 고침 방지
		function noEvent() {
            if (event.keyCode == 116 || (event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82))) {
                if(confirm("새로고침 하면 작성된 내용이 지워집니다. 계속하시겠습니까?")){
                	return true;
                }else{
	                event.keyCode = 2;
	                return false;                	
                }
            }
        }
    	document.onkeydown = noEvent;

	});
</script>

</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<form name="msgFrm" method="post" action="<c:url value='/mypage/message/messageWrite.do'/>">
	<div class="h1">
		<h1>쪽지보내기</h1>
	</div>
	<div class="msgDiv">
		<input type="text" id="receiver" name="receiver" class="text" placeholder="받는사람 아이디를 입력하세요"><br>
		<span id="noId">아이디가 없습니다.</span>
	</div>
	<div class="msgDiv">
		<!-- 제목 -->
	    <input type="text" id="title" name="title" class="text" placeholder="제목을 입력하세요"/>
	</div>
	<div class="msgDiv">
		<!-- 내용 -->        
		<textarea id="content" name="content" class="text" placeholder="내용을 입력하세요"></textarea>
	<span id="textleng"></span>
	</div>
	<div class="center">
		<input type="button" class="button" id="regit" value="등록"/>
		&nbsp;
		<input type="button" class="button" id="cancel" value="취소" onclick="window.open('','_self').close()" />
	</div>
	<input type="text" id="idCount" value="N">
</form>       
</body>
</html>
