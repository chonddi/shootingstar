<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css"
	href="<c:url value='/css/aDetail.css'/>">
	
<title>전문가 상세정보</title>
</head>
<body>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	$('.cBtn').click(function(){
		self.close();
	});
	//쪽지보내기
	$('#sendMsg').click(function(smemid){
		x = (screen.availWidth - 460) / 2;
	    y = (screen.availHeight - 550) / 2;
	    window.open("<c:url value='/mypage/message/messageWrite.do?sMemberId=${smemid}'/>",
			"쪽지보내기","left=" + x + ", top=" + y + ", width=460, height=550, location=yes, resizable=no");

		});
});

//이미지 클릭시 원본 크기로 팝업 보기
function doImgPop(img){ 
 img1= new Image(); 
 img1.src=(img); 
 imgControll(img); 
} 
  
function imgControll(img){ 
 if((img1.width!=0)&&(img1.height!=0)){ 
    viewImage(img); 
  } 
  else{ 
     controller="imgControll('"+img+"')"; 
     intervalID=setTimeout(controller,20); 
  } 
}

function viewImage(img){ 
	 W=img1.width; 
	 H=img1.height; 
	 O="width="+W+",height="+H+",scrollbars=yes"; 
	 imgWin=window.open("","",O); 
	 imgWin.document.write("<html><head><title>----이미지상세보기----</title></head>");
	 imgWin.document.write("<body topmargin=0 leftmargin=0>");
	 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	 imgWin.document.close();
	}
</script>
</head>

<body>
<div class="dbody">
<div style="font-size:1.3em;">
					

<c:forEach var="map" items="${list }" end="0">
				<c:set var="pnum" value='${map["PFNO"] }'/>
				<c:set var="sname" value='${map["SNAME"] }' />
				<c:set var="cgname" value='${map["CGNAME"] }' />
				<c:set var="pr" value='${map["PR"] }'/>
				<c:set var="ptitle" value='${map["PFTITLE"] }'>
				
				</c:set>
						
</c:forEach>

<span class="mint" style="font-size:1.1em;">${sname}</span>님의 INFORMATION</div><hr>
		 			<div class="title3"> 
		 			<span class=>전문가명</span> :   ${sname} &nbsp;&nbsp;&nbsp;&nbsp; <br><span>전문 분야</span> : ${cgname}
					
						</div>
						<hr><br>
			
			<!-- 포트폴리오 새창 띄우기 -->			
			<form name="frmSearch" method="post">
			<div class="input-group">
				<button type="submit" class="mBtn1" onclick="window.open('<c:url value="/portfolio/portfolioList.do?searchKeyword=${sname}"/>',
				'new','resizable=no fullscreen');return false">포트폴리오 보기 (새창)</button>
			</div>
			</form><br>
			<img src="../images/mail.png" title="button" id="sendMsg" value="${smemid}" style="cursor: pointer;width:32px;height:30px;" >
			[쪽지보내기]
</div>			
	
<div style="text-align: center;margin-top:30px;">
		<input type="button" class="cBtn" value="닫기">
	</div>
	
</body>
</html>
