<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript">
	$(function(){
		//받은쪽지 클릭
		$('.anotherBtn').click(function(){
			location.href="<c:url value='/admin/message/messageReceive.do'/>";
		});
		
		//쪽지보내기
		$('#sendMsg').click(function(){
			x = (screen.availWidth - 460) / 2;
			y = (screen.availHeight - 550) / 2;
			window.open("<c:url value='/mypage/message/messageWrite.do'/>","쪽지보내기","left=" + x + ", top=" + y + ", width=460, height=550, location=yes, resizable=no");
		});
	});
	
	function msgView(sMsgNo) {
		document.detailFrm.sMsgNo.value=sMsgNo;
		msgViewSubmit();
	}
	function msgViewSubmit(){
		frm = document.getElementById("detailFrm");
		x = (screen.availWidth - 460) / 2;
		y = (screen.availHeight - 550) / 2;
		window.open("","viewer","left=" + x + ", top=" + y + ", width=460, height=550, location=yes, resizable=no");
		frm.action = "<c:url value='/mypage/message/messageDetail.do'/>";
		frm.target = "viewer";
		frm.method = "post";
		frm.submit();
	}
	
	//페이징처리
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/msg.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
<style type="text/css">
.mypageBtn{
    height: 30px;
    font-size: 0.8em;
}
.message{
width:1300px;
margin: 50px auto;
}
</style>
<div class=message>
		<h1>쪽지함</h1>
	<br>
	<form id="detailFrm" name="detailFrm">
		<input type="hidden" name="sMsgNo">
	</form>
	<!-- 페이징 처리를 위한 form -->
	<form name="frmPage" method="post"
		action="<c:url value='/admin/message/message.do'/>">
		<input type="hidden" name="currentPage" >
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
	</form>
	<div class="selectedPage">
		<div class="msgBtn"><span class="nowMsgType">보낸쪽지</span> <span class="btnMsgType"><input type="button" class="anotherBtn" value="받은쪽지"></span></div>
		<form name="frmDel" method="post" action="<c:url value='/admin/message/deleteMultiAdmin.do'/>">
		<table id="msgTbl">
			<colgroup>
				<col style="width:31px" />
				<col style="width:211px">
				<col style="width:665px">
				<col style="width:150px">
			</colgroup>
			<tr>
			 	<th scope="col"><input type="checkbox" name="chkAll" 
	    			onclick="allChecked(this.checked)"></th>
				<th scope="col">받는사람</th>
				<th scope="col">제목</th>
				<th scope="col">보낸날짜</th>
			</tr>
			<c:if test="${empty sendList}">
				<td></td>
				<td colspan="2" style="text-align:center">보낸 쪽지가 없습니다.</td>
				<td></td>
			</c:if>
			<c:if test="${!empty sendList }">
				${pageVo.totalRecord}개의 쪽지가 있습니다.<br><br>
		    	<c:forEach var="sendMap" items="${sendList}">
				<tr>
					<td>
						<input type="checkbox" name="chk" value="${sendMap['SMSGNO']}">
					</td>
					<td>${sendMap["RECIPIENT"] }</td>
		    		<td><a href="#" onclick="msgView('${sendMap['SMSGNO']}')">${sendMap["TITLE"]}</a></td>
		    		<td><fmt:formatDate value="${sendMap['REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
		    	</c:forEach>
			</c:if>    
	    </table><br>
	    <div style="margin-top: 25px;">
		    <div style="float: left"><input type="submit" class="mypageBtn" value="쪽지 삭제" ></div>
			<div style="float:right"><input type="button" id="sendMsg" class="mypageBtn" value="쪽지 보내기"></div>
		</div>
    </form>
		
		<!-- 페이지처리 -->
		<div class="divPage" style="clear: both; margin-top:90px;">
			<!-- 페이지 번호 추가 -->		
			<!-- 이전 블럭으로 이동 -->
			<c:if test="${pageVo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pageVo.firstPage-1})">
					<img alt="이전 블럭으로 이동" src="../images/first.JPG">
				</a>		
			</c:if>
			
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pageVo.firstPage }" end="${pageVo.lastPage}">
				<c:if test="${i==pageVo.currentPage }">
					<span style="color: blue;font-weight: bold;font-size:1.0em">
						${i}</span>
				</c:if>
				<c:if test="${i!=pageVo.currentPage }">
					<a href="#" onclick="pageFunc(${i})">
					[${i }]</a>
				</c:if>
			</c:forEach>
				
			<!-- 다음 블럭으로 이동 -->
			<c:if test="${pageVo.lastPage<pageVo.totalPage }">
				<a href="#" onclick="pageFunc(${pageVo.lastPage+1})">
					<img alt="다음 블럭으로 이동" src="../images/last.JPG">
				</a>	
			</c:if>
			<!--  페이지 번호 끝 -->
		</div>
	</div>
	<!-- 검색조건 -->
	<div class="divSearch">
	   	<form name="frmSearch" method="post" 
	   		action='<c:url value="/admin/message/message.do"/>'>
	        <select name="searchCondition">        	
	            <option value="title"
	            	<c:if test="${param.searchCondition=='title'}">
	            		selected="selected"
	            	</c:if>	 
	            >제목</option>
	            <option value="content"
	            	<c:if test="${param.searchCondition=='content'}">
	            		selected="selected"
	            	</c:if>
	            >내용</option>
	            <option value="recipient"
	            	<c:if test="${param.searchCondition=='recipient'}">
	            		selected="selected"
	            	</c:if>
	            >받는사람</option>
	        </select>   
	        <input type="text" name="searchKeyword" title="검색어 입력"
	        	value="${param.searchKeyword}">   
			<input type="submit" value="검색">
	    </form>
	</div>
</div>
<script  src="<c:url value='/js/message.js'/>"></script>
<%@ include file="../../inc/adminBottom.jsp"%>