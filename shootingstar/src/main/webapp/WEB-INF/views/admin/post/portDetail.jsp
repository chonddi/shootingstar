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
	
<title>${vo.pfNo}번 Request글 상세보기</title>
</head>
<body>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	$('.cBtn').click(function(){
		self.close();
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

<div style="font-size:1.3em;">
					

<c:forEach var="map" items="${list }" end="0">
				<c:set var="pnum" value='${map["PFNO"] }'/>
				<c:set var="sname" value='${map["SNAME"] }' />
				<c:set var="cgname" value='${map["CGNAME"] }' />
				<c:set var="pr" value='${map["PR"] }'/>
				<c:set var="ptitle" value='${map["PFTITLE"] }'>
				
				</c:set>
						
</c:forEach>

<span class="mint" style="font-size:1.1em;">${smemberid}</span>님의 PORTFOLIO 상세내용</div><br><hr><br>
	 			<div class="pS">   
		 			<div class="title3"> 
		 			<span class="mint">전문가명</span> :   ${sname} &nbsp;&nbsp;&nbsp;&nbsp; <span class="mint">카테고리</span> : ${cgname}<br><br>
					<span class="mint">포트폴리오제목</span> : <span class="mint2">${ptitle}</span> <br>
						</div><br>
						<hr><br>
						<span class="mint">전문가 소개</span> :  ${pr}
						</div><br><hr><br>
						<span class="mint">포트폴리오 이미지</span> (클릭 시 원본크기 보기)<br>
	<div style="margin-top:15px;">
		<c:forEach var="map" items="${list}">
					<img src="<c:url value='../../portfolio_images/${map["FILENAME"] }'/>" class="imgup" title="클릭하시면 원본크기로 보실 수 있습니다."
					style="cursor: pointer;width:100px;height:80px;" onclick="doImgPop('<c:url value='../../portfolio_images/${map["FILENAME"] }'/>')">
				</c:forEach>
		</div>
<div style="text-align: center;margin-top:70px;">
		<input type="button" class="cBtn" value="닫기">
	</div>
</body>
</html>
