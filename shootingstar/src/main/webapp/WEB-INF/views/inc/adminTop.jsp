<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<link rel="SHORTCUT ICON" href="<c:url value='/images/favi.png'/>"/>
<title>ShootingStar</title>
<style type="text/css">

nav ul {
	list-style: none;
}

</style>

<!-- 부트스트랩 -->
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

<!-- jquery -->
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.3.1.min.js'/>">

	</script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<%--  <link rel="stylesheet" type="text/css"
	href="<c:url value='/css/resetCss.css'/>"> --%> 
 <link rel="stylesheet" type="text/css"
	href="<c:url value='/css/adminTop.css'/>"> 
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/bottom.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/topLeft.css'/>">



</head>
<body>
	<nav class="navbar navbar-default">
			<div class="container-fluid">
				<a class="navbar-brand" href="<c:url value='/admin/adminMain.do'/>"><img id="logo"
					alt="ShootingStar" src="<c:url value='/images/mainTopLogo.png'/>"
					width="130" /></a>


			<nav id="topMenu">
				
				
				
				<ul >
					<li style="margin-top:20px;"><img id="userli" alt="마이 페이지"
						src="<c:url value='/images/lm.png'/>" style="width:38px; height:40px;">
						<ul id="userul" style="margin-right:800px;">
						<c:if test="${empty sessionScope.adminCode}">
							<li><a href="<c:url value='/admin/login/login.do'/>">로그인</a></li>
						</c:if>
						
						<c:if test="${!empty sessionScope.adminCode}">
							<li><a href="<c:url value='/admin/adminEdit.do'/>">마이페이지</a></li>
						</c:if>
						<c:if test="${!empty sessionScope.adminCode}">
							<li><a href="<c:url value='/admin/login/logout.do'/>">로그아웃</a></li>
						</c:if>
						</ul>
						
					</li>	
				</ul>

			</nav>
		</div>
		
	</nav>
	
	
<div class="menubar">
<ul>
 <li id="fc"><a href="#">관리자페이지</a>
 	<ul>
     <li><a href="<c:url value='/admin/register.do'/>">관리자 신규등록</a></li>
     <li><a href="<c:url value='/admin/adminEdit.do'/>">관리자 정보수정</a></li>
 	</ul>
 </li>
 <li><a href="#" >회원관리</a>
	<ul>
     <li><a href="<c:url value='/admin/member/memberList.do'/>">고객 회원 정보 관리</a></li>
     <li><a href="<c:url value='/admin/member/smemberList.do'/>">전문가 회원 정보 관리</a></li>
     <li><a href="<c:url value='/admin/member/smemberOutList.do'/>">멤버십 만료 회원 조회</a></li>
    </ul>
 </li>
  <li><a href="#">게시물관리</a>
 	<ul>
     <li><a href="<c:url value='/admin/post/request.do'/>">견적 요청 글 관리</a></li>
     <li><a href="<c:url value='/admin/post/portfolio.do'/>">포트폴리오 글 관리</a></li>
 	</ul>
 </li>
 <li><a href="#" >등록현황 통계</a>
	<ul>
     <li><a href="#">회원 등록 현황</a></li>
     <li><a href="#">견적 등록 현황</a></li>
     <li><a href="#">포트폴리오 등록 현황</a></li>
    </ul>
 </li>
 <li><a href="#" >페이지 관리</a>
	<ul>
     <li><a href="<c:url value='/admin/faq/faqAdmin.do'/>">FAQ 관리</a></li>
     <li><a href="<c:url value='/admin/notice/noticeAdmin.do'/>">공지사항 관리</a></li>
     <li><a href="<c:url value='/serviceA/Qlist.do'/>">Q&A 관리</a></li>
    </ul>
 </li>
 <li><a href="<c:url value='/admin/message/message.do'/>">쪽지함</a></li>
</ul>
</div>	



			
		
	