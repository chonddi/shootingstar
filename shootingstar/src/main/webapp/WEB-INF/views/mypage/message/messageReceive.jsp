<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypageTop.css'/>" />
<script type="text/javascript">
	$(function(){
		//보낸쪽지로 이동
		$('.anotherBtn').click(function(){
			location.href="<c:url value='/mypage/message/message.do'/>";
		});
		
	});

	//읽으면 readFlag Y로
	function msgRead(sMsgNo) {
		document.detailFrm.sMsgNo.value=sMsgNo;
		msgViewSubmit();
	}
	
	function msgViewSubmit(){
		frm = document.getElementById("detailFrm");
		x = (screen.availWidth - 460) / 2;
		y = (screen.availHeight - 550) / 2;
		window.open("","viewer","left=" + x + ", top=" + y + ", width=460, height=700, location=yes, resizable=no");
		frm.action = "<c:url value='/mypage/message/messageDetailRead.do'/>";
		frm.target = "viewer";
		frm.method = "post";
		frm.submit();
	}
	//상세보기
	function msgView(sMsgNo) {
		document.detailFrm.sMsgNo.value=sMsgNo;
		msgViewSubmit2();
	}
	function msgViewSubmit2(){
		frm = document.getElementById("detailFrm");
		x = (screen.availWidth - 460) / 2;
		y = (screen.availHeight - 550) / 2;
		window.open("","viewer","left=" + x + ", top=" + y + ", width=460, height=700, location=yes, resizable=no");
		frm.action = "<c:url value='/mypage/message/messageDetail2.do'/>";
		frm.target = "viewer";
		frm.method = "post";
		frm.submit();
	}
	
</script>
<script  src="<c:url value='/js/message.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/msg.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
<style type="text/css">
.mypageBtn{
    height: 30px;
    font-size: 0.8em;
}
</style>

		쪽지함
	</div>
	<form id="detailFrm" name="detailFrm" method="post"> 
		<input type="hidden" name="sMsgNo">
	</form>
	<!-- 페이징 처리를 위한 form -->
	<form name="frmPage" method="post"
		action="<c:url value='/mypage/message/messageReceive.do'/>">
		<input type="hidden" name="currentPage" >
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
	</form>
	<div class="selectedPage">
		<div class="msgBtn"><span class="btnMsgType"><input type="button" class="anotherBtn" value="보낸쪽지"></span> <span class="nowMsgType">받은쪽지</span></div>
		<form name="frmDel" method="post" action="<c:url value='/mypage/message/rDeleteMulti.do'/>">
		<table id="msgTbl">
			<colgroup>
				<col style="width:31px" />
				<col style="width:211px">
				<col style="width:665px;">
				<col style="width:*">
			</colgroup>
			<tr>
				<th scope="col"><input type="checkbox" name="chkAll" 
	    			onclick="allChecked(this.checked)"></th>
				<th scope="col">보낸 사람</th>
				<th scope="col">제목</th>
				<th scope="col">보낸날짜</th>
			</tr>
			<c:if test="${empty receiveList}">
				<td></td>
				<td colspan="2" style="text-align:center">받은 쪽지가 없습니다.</td>
				<td></td>
			</c:if>
			<c:if test="${!empty receiveList }">
				${pageVo.totalRecord}개의 쪽지가 있습니다.<br><br>
		    	<c:forEach var="receiveMap" items="${receiveList}">
				<tr>
					<td>
						<input type="checkbox" name="chk" value="${receiveMap['RMSGNO']}">
					</td>
					<td>${receiveMap["SENDER"] }</td>
		    		<td>
		    			<c:if test="${receiveMap['READFLAG']=='N'}">
		    				<b><a href="#" onclick="msgRead('${receiveMap['SMSGNO']}')">
		    					${receiveMap["TITLE"]}</a></b>
		    				<img alt="new이미지" src="<c:url value='/images/new.png'/>">		
		    			</c:if>
		    			<c:if test="${receiveMap['READFLAG']=='Y'}">
		    				<b><a href="#" onclick="msgView('${receiveMap['SMSGNO']}')">${receiveMap["TITLE"]}</a></b>		
		    			</c:if>
		    		</td>
		    		<td><fmt:formatDate value="${receiveMap['REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
		    	</c:forEach>
	    	</c:if>
	    </table><br>
	    <div style="margin-top: 25px;">
	    	<input type="submit" class="mypageBtn" value="글 삭제" >
	    </div>
    </form>
	    
	    <!-- 페이지처리 -->
		<div class="divPage">
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
	   		action='<c:url value="/mypage/message/message.do"/>'>
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
	            	<c:if test="${param.searchCondition=='sender'}">
	            		selected="selected"
	            	</c:if>
	            >보낸사람</option>
	        </select>   
	        <input type="text" name="searchKeyword" title="검색어 입력"
	        	value="${param.searchKeyword}">   
			<input type="submit" value="검색">
	    </form>
	</div>
	  
</div>
<%@ include file="../../inc/bottom.jsp"%>