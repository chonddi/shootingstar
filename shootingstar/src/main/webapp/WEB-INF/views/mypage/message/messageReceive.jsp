<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypageTop.jsp"%>
<script type="text/javascript">
	$(function(){
		$('.anotherBtn').click(function(){
			location.href="<c:url value='/mypage/message/message.do'/>";
		});
	});
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/msg.css'/>">

		쪽지함
	</div>
	<!-- 페이징 처리를 위한 form -->
	<form name="frmPage" method="post"
		action="<c:url value='/mypage/message/message.do'/>">
		<input type="hidden" name="currentPage" >
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
	</form>
	<div class="selectedPage">
		<div class="msgBtn"><span class="btnMsgType"><input type="button" class="anotherBtn" value="보낸쪽지"></span> <span class="nowMsgType">받은쪽지</span></div>
		<table id="msgTbl">
			<colgroup>
				<col style="width:20%">
				<col style="width:66%">
				<col style="width:*">
			</colgroup>
			<tr>
				<th scope="col">보낸 사람</th>
				<th scope="col">제목</th>
				<th scope="col">보낸날짜</th>
			</tr>
			<c:if test="${empty receiveList}">
				<td colspan="3" style="text-align: center">받은 쪽지가 없습니다.</td>
			</c:if>
			<c:if test="${!empty receiveList }">
		    	<c:forEach var="receiveMap" items="${receiveList}">
				<tr>
					<td>${receiveMap["RECIPIENT"] }</td>
		    		<td>
		    			<c:if test="${receiveMap['READFLAG']=='N'}">
		    				<b><a href="<c:url value='/mypage/message/msgDetail.do?sMsgNo=${receiveMap["SMSGNO"]}'/>">${receiveMap["TITLE"]}</a></b>		
		    			</c:if>
		    			<c:if test="${receiveMap['READFLAG']=='Y'}">
		    				<b><a href="<c:url value='/mypage/message/msgDetail.do?sMsgNo=${receiveMap["SMSGNO"]}'/>">${receiveMap["TITLE"]}</a></b>		
		    			</c:if>
		    		</td>
		    		<td><fmt:formatDate value="${receiveMap['REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
		    	</c:forEach>
	    	</c:if>
	    </table>
	    
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