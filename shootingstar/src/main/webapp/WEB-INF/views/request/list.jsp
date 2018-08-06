<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE HTML>
<head>
<title>Request 목록</title>
<meta charset="utf-8">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='../css/write.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>"> 
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">	
	$(document).ready(function(){
		$('table.box2 tbody tr').hover(function(){
			$(this).css('background','skyblue');
		}, function(){
			$(this).css('background','');
		});	
		
	});
	
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
	
	
 	 function onClick(memberId, vmemberid, rqno) { 
 		if(memberId==vmemberid){ 
 			location.href="<c:url value='/request/detail.do?no="+rqno+"'/>"
 		
 		}else{
 		 
			swal({
				text: "회원님 본인의 Request글 상세보기만 제공합니다.",
				icon: "error",
				button: "확인"
				}); 
 			}
			
		}	 
 	 
 	 
 	 
 	function onClick2(rqno) { 
 		
 		location.href="<c:url value='/request/sdetail.do?no="+rqno+"'/>"
 		
			}	
 	
	function onClick3() { 
 		
 		location.href="<c:url value='/request/detail.do'/>"
 		
			}	
					

	function onLoad() {
		
	}

	

</script>
	
</head>	
<body>

<div class="title">REQUEST 리스트</div>


<c:if test="${!empty param.searchKeyword}">
	<p>검색어: ${param.searchKeyword}(으)로  ${fn:length(list)}건 검색되었습니다. </p> 
</c:if>
<c:if test="${empty param.searchKeyword}">
	<p>총 ${pageVo.totalRecord}건의 REQUEST가 조회되었습니다. </p> 
</c:if>
<br><hr>
<br><br>
<%-- <c:if test="${!empty param.cgNo }">
	<p>${ctgProductVO.cgName } 상품 : ${pagingInfo.totalRecord } 건 입니다.</p>
</c:if> --%>

<div class="divA">
	<div class="divLeft">
	<form name="frmPage1" method="post"
		action="<c:url value='/request/list.do'/>">
		
		Category
		<select name="cgNo" onchange="this.form.submit()">
			<option>
			<c:choose>
				 <c:when test="${cno ==null }">---전체---</c:when>
				 <c:when test="${cno ==1 }">-인물/프로필-</c:when>
				 <c:when test="${cno ==2 }">---푸드---</c:when>
				 <c:when test="${cno ==3 }">---패션---</c:when>
				 <c:when test="${cno ==4 }">---웨딩---</c:when>
				 <c:when test="${cno ==5 }">-행사/컨퍼런스-</c:when>
				 <c:when test="${cno ==6 }">-건축/인테리어-</c:when>
				 <c:when test="${cno ==7 }">---공연---</c:when>
				 <c:when test="${cno ==8 }">---광고---</c:when>
				 <c:when test="${cno ==9 }">-스냅사진-</c:when>
			</c:choose>
			
			</option>
			<option value="0">전체</option>
			<option value="1" 
				<c:if test="${param.eventName=='1'}">selected</c:if>
				>인물/프로필</option>
			<option value="2"
				<c:if test="${param.eventName=='2'}">selected</c:if>
				>푸드</option>
			<option value="3"
				<c:if test="${param.eventName=='3'}">selected</c:if>
				>패션</option>	
			<option value="4"
				<c:if test="${param.eventName=='4'}">selected</c:if>
				>웨딩</option>	
			<option value="5"
				<c:if test="${param.eventName=='5'}">selected</c:if>
				>행사/컨퍼런스</option>	
			<option value="6"
				<c:if test="${param.eventName=='6'}">selected</c:if>
				>건축/인테리어</option>	
			<option value="7"
				<c:if test="${param.eventName=='7'}">selected</c:if>
				>공연</option>	
			<option value="8"
				<c:if test="${param.eventName=='8'}">selected</c:if>
				>광고</option>	
			<option value="9"
				<c:if test="${param.eventName=='9'}">selected</c:if>
				>스냅사진</option>	
						
		</select>
		
	
	</form>
	</div>

	<div class="divSearch">
	   	<form name="frmSearch" method="post" 
	   		action='<c:url value="/request/list.do"/>'>
	        <select name="searchCondition">        	
	          <option value="memberId"
	            	<c:if test="${param.searchCondition=='memberId'}">
	            		selected="selected"
	            	</c:if>
	            >작성자</option>
	            <option value="RQDetail"
	            	<c:if test="${param.searchCondition=='RQDetail'}">
	            		selected="selected"
	            	</c:if>
	            >내용</option>
	           <option value="RQNo"
	            	<c:if test="${param.searchCondition=='RQNo'}">
	            		selected="selected"
	            	</c:if>
	            >글번호</option>
	        </select>   
	        <input type="text" name="searchKeyword" title="검색어 입력"
	        	value="${param.searchKeyword}">   
			<input type ="image" src="<c:url value='../images/black18s.png'/>" 
			align="absmiddle" >	
			
			
				
	    </form>
	</div>
</div>

<!-- 페이징 처리를 위한 form -->
<form name="frmPage" method="post"
	action="<c:url value='/request/list.do'/>">
	<input type="hidden" name="currentPage" >
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
</form>
<br><br>
<div class="divList">

<table class="box2">
	<colgroup>
		<col style="width:8%;" />
		<col style="width:10%;" />
		<col style="width:29%;" />
		<col style="width:20%;" />
		<col style="width:15%;" />
		<col style="width:*;" />		
	</colgroup>
	<thead >
	  <tr>
	
	    <th scope="col" id="ttlt">번호</th>
	    <th scope="col" id="ttlt">카테고리</th>
	    <th scope="col" id="ttlt">내용</th>
	    <th scope="col" id="ttlt">작성자</th>
	    <th scope="col" id="ttlt">작성일</th>
	    <th scope="col" id="ttlt">PICK</th>
	  </tr>
	</thead> 
	
	<tbody>  
	
		<c:if test="${empty list }">
			<tr>
				<td colspan="6" style="text-align: center">
					데이터가 존재하지 않습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
		  	<!--게시판 내용 반복문 시작  -->	
		  	<c:forEach var="vo" items="${list}">
	  			<tr >
	  				
					<td id="ttl">${vo.RQNo}</td>
					<td id="ttl"> 
					<c:choose>
						 <c:when test="${vo.cgNo ==1 }">인물/프로필</c:when>
						 <c:when test="${vo.cgNo ==2 }">푸드</c:when>
						 <c:when test="${vo.cgNo ==3 }">패션</c:when>
						 <c:when test="${vo.cgNo ==4 }">웨딩</c:when>
						 <c:when test="${vo.cgNo ==5 }">행사/컨퍼런스</c:when>
						 <c:when test="${vo.cgNo ==6 }">건축/인테리어</c:when>
						 <c:when test="${vo.cgNo ==7 }">공연</c:when>
						 <c:when test="${vo.cgNo ==8 }">광고</c:when>
						 <c:when test="${vo.cgNo ==9 }">스냅사진</c:when>
						</c:choose>
					</td>
					
					
					<td id="ttl" > 
						<fmt:formatNumber value="${vo.RQNo}" type="number" var="rqno"/> 
						
						
						<c:if test="${ucode==1}">
						<a onclick='onClick("${vo.memberId}", "${vmemberid}", "${rqno}")'>
						</c:if>
						<c:if test="${ucode==2}">
						<a onclick='onClick2("${rqno}")'>
						</c:if>
						<c:if test="${ucode!=1&&ucode!=2}">
						<a onclick='onClick3()'>
						</c:if>
								
						<!-- 삭제된 원본글인 경우 삭제된 글로 처리 -->
						<c:choose>
							<c:when test="${vo.delFlag=='Y'}">
								<span style="color:gray;font-size: 1.0em">
									삭제된 글입니다.</span>
							</c:when>
							<c:otherwise>				
									<!-- 내용 일부만 보여주기 -->
									<c:if test="${fn:length(vo.RQDetail)>18}">	
										${fn:substring(vo.RQDetail, 0, 18)}...
									</c:if>
									<c:if test="${fn:length(vo.RQDetail)<=18}">
										${vo.RQDetail}
									</c:if>								
								</a>
					
							</c:otherwise>
						</c:choose>		
					</td>
					
					
					
					
					<td id="ttl"> ${vo.memberId} </td>
					<td id="ttl"><fmt:formatDate value="${vo.regDate}"
						pattern="yyyy-MM-dd"/> </td>
					
					<!-- pickcount 갯수 표시 -->
					<td class="pick" id="ttl"> 
					<c:choose>
				       <c:when test="${vo.pickCount>='1'}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>

					
					<c:choose>
				      <c:when test="${vo.pickCount>='2'}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
								
					<c:choose>
				      <c:when test="${vo.pickCount>='3'}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
					
					<c:choose>
				       <c:when test="${vo.pickCount>='4'}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
					
					<c:choose>
				       <c:when test="${vo.pickCount>='5'}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>		
					
					</td>	
				</tr>
			</c:forEach>
		  	<!--반복처리 끝  -->
	  	</c:if>
	  </tbody>
</table>
<br>
</form>	   
</div>

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
			<span class="pageNum1">
				${i}</span>
		</c:if>
		<c:if test="${i!=pageVo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
			<span class="pageNum2">
			[${i }]</span></a>
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



</body>
</html>
<%@ include file="../inc/bottom.jsp"%>
