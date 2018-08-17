<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 작성하기</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/review.css'/>" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.starRev span:not(:first)').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).parent().children('span').html(0);
		$(this).addClass('on').prevAll('span').addClass('on');
		$(this).next().prevAll('span').html(10);
		
		$(".starRev").find("span").each(function(idx, item){
			rev1sum += parseInt($(this).text());
		});
		$("#sum").val(rev1sum);
		
		return false;
	});
	$('.starRev2 span:not(:first)').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).parent().children('span').html(0);
		$(this).addClass('on').prevAll('span').addClass('on');
		$(this).next().prevAll('span').html(10);
		
		$(".starRev2").find("span").each(function(idx, item){
			var rev2sum = 0;
			rev2sum += $(this).text();
		});
		
		$(".starRev2").find("span").each(function(idx, item){
			rev2sum += parseInt($(this).text());
		});
		$("#sum2").val(rev2sum);
		
		return false;
	});
	
	//글자수 체크하기
	var textCountLimit = 200;
	
	$('#content').keydown(function (e){
		//텍스트영역의 길이를 체크
        var textLength = $(this).val().length;
		
		//입력된 텍스트 길이를 #textleng에 업데이트 해줌	     	
	    var content = $(this).val();
	    $('#textleng').html(content.length + '/200');
	    
     	//제한된 길이보다 입력된 길이가 큰 경우 제한 길이만큼만 자르고 텍스트영역에 넣음
        if (textLength > textCountLimit) {
        	$(this).val($(this).val().substr(0, textCountLimit));
        }
     	
	});
	
	$('#content').keydown();
	
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
	
	$(".regit").click(function(){
		var str = $("#content").val();
		var content = str.trim();
		
		if(content == ""){
			alert("내용을 입력하세요.");
			$('#content').focus();
			return false;
		}else if(confirm("등록하시겠습니까?")){
			goParent();
			setTimeout(function() {self.close()}, 10);
		}
		
	});

});

	function goParent() {
	    window.opener.name = "Tlist"; // 부모창의 이름 설정
	    document.starfrm.target = "Tlist"; // 타켓을 부모창으로 설정
	    document.starfrm.action = "<c:url value='/payment/Twrite.do'/>";
	    document.starfrm.submit();
	}
	
</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<form name="starfrm" method="post" action="<c:url value='/payment/Twrite.do'/>">
	<section class="title">
		<h1>후기 작성하기</h1>
	</section>
	<section class="starSec1">
		<table class="starTbl">
			<tr>
				<th>커뮤니케이션</th>
				<th>
					<div class="starRev">
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span style="display: none;"></span>
					</div>
				</th>
				<th>결과만족도</th>
				<th>
					<div class="starRev2">
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span class="starR1 on"></span>
						<span class="starR2 on"></span>
						<span style="display: none;"></span>
					</div>
				</th>
			</tr>
		</table>
	</section>
	<section class="starSec2">
		<textarea class="content" name="content" id="content" placeholder="후기를 작성해주세요."></textarea>
		<span id="textleng"></span>
	</section>
	<section class="starSec3">
		<input type="button" class="regit" value="등록하기">
	</section>
<input type="hidden" name="communication" id="sum" value="100">
<input type="hidden" name="result" id="sum2" value="100">
<input type="hidden" name="sMemberid" value="${transacVo.sMemberid}">
<input type="hidden" name="memberid" value="${sessionScope.userid}">
<input type="hidden" name="pNo" value="${transacVo.pNo}">
</form>
</body>
</html>