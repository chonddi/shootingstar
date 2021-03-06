<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Q&A 글쓰기</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/QwriteStyle.css'/>" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#regit").click(function(){			
		if($('#qTitle').val().length < 1){
			alert("제목을 입력하세요.");
			$('#qTitle').focus();
			return false;
		}else if($('#qContent').val() == ""){
			alert("내용을 입력하세요.");
			$('#qContent').focus();
			return false;
		}else if(confirm("수정하시겠습니까?")){
			$('form[name=frmEdit]').submit();
			setTimeout(function() {opener.parent.location.reload()}, 10);
			setTimeout(function() {self.close()}, 10);
		}
		
	});
		
	$('#qTitle').keydown(function(){
		if($(this).val().length > 30){
			alert("제목은 30자 이내만 가능합니다.");
	        $(this).val($(this).val().substr(0, 30));
		}			
	});
	
	$('#qTitle').keydown();
	
	//글자수 체크하기
	var textCountLimit = 1000;
	
	$('#qContent').keydown(function (e){
		//텍스트영역의 길이를 체크
        var textLength = $(this).val().length;
		
		//입력된 텍스트 길이를 #textleng에 업데이트 해줌	     	
	    var qContent = $(this).val();
	    $('#textleng').html(qContent.length + '/1000');
	    
     	//제한된 길이보다 입력된 길이가 큰 경우 제한 길이만큼만 자르고 텍스트영역에 넣음
        if (textLength > textCountLimit) {
        	$(this).val($(this).val().substr(0, textCountLimit));
        }

	});
	
	$('#qContent').keydown();
	
	//새로 고침 방지
	function noEvent() {
        if (event.keyCode == 116 || (event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82))) {
            if(confirm("새로고침 하시면 작성한 정보가 지워집니다. 계속하시겠습니까?")){
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
<form name="frmEdit" method="post" action="<c:url value='/serviceA/Qedit.do'/>">
<input type="hidden" id="qNo" name="qNo" value="${vo.qNo}"/>
	<div class="h1">
		<h1>Q&A 수정하기</h1>
	</div>
	<div class="firstDiv">
		<!-- 제목 -->
	    <input type="text" id="qTitle" name="qTitle" class="text" value="${vo.qTitle}" placeholder="제목을 입력하세요"/>
	</div>
	<div class="secondDiv">
		<!-- 내용 -->        
		<textarea id="qContent" name="qContent" class="text" placeholder="내용을 입력하세요">${vo.qContent}</textarea>
	<span id="textleng"></span>
	</div>
	<div class="center">
		<input type="button" class="button" id="regit" value="수정"/>
		&nbsp;
		<input type="button" class="button" id="cancel" value="취소" onclick="window.open('','_self').close()" />
	</div>
</form>
</body>
</html>
