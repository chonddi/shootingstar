<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../inc/adminTop.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="width:1903px;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">	
//게시판 목록 css처리
$(document).ready(function(){
		$('table.box2 tbody tr').hover(function(){
			$(this).css('background','skyblue');
		}, function(){
			$(this).css('background','');
		});	
		
		
		//체크박스 다중선택	
		$("input[name=chkAll]").click(function(){
			$("tbody input[type=checkbox]").prop("checked",this.checked);
		});
		
		//다중삭제
		$("#delMulti").click(function(){
			var count=$("tbody input[type=checkbox]:checked").length;
			if(count==0){
				alert("삭제할 상품을 먼저 체크하세요");
				return;
			}
			//삭제 confirm창 처리
			  swal({
			      title: "삭제하시겠습니까?",
			      text: "선택한 글들이  Flag처리될 예정입니다. 계속하시겠습니까?",
			      icon: "warning",
			      buttons: [
			        '아니요!',
			        '네!'
			      ],
			      dangerMode: true,
			    }).then(function(isConfirm) {
			      if (isConfirm) {
			        swal({
			          title: '완료되었습니다',
			          text: '글 삭제가 완료되었습니다.',
			          icon: 'success'
			        }).then(function() {
			        	$("form[name=frmList]")
						.prop("action","<c:url value='/admin/post/deleteMulti.do'/>");
						$("form[name=frmList]").submit();
			        });
			      } else {
			        swal("Cancelled", "취소되었습니다:)", "error");
			      }
			    })
			
			/* $("form[name=frmList]")
			.prop("action","<c:url value='/admin/post/deleteMulti.do'/>");
			$("form[name=frmList]").submit(); */
		});
		
 
	});
	



//페이징 펑션
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	frmPage.submit();
}

//디테일 팝업뜨게하기
function detailView(rqNo) {
	document.detailFrm.detailNo.value=rqNo;
	detailViewSubmit();
}
function detailViewSubmit(){
	frm = document.getElementById("detailFrm");
	x = (screen.availWidth - 800) / 1.2;
	y = (screen.availHeight - 600) / 2;
	window.open("","viewer","left=" + x + ", top=" + y + ", width=800, height=600, location=yes, resizable=no");
	frm.action = "<c:url value='/admin/post/reqDetail.do'/>";
	frm.target = "viewer";
	frm.method = "post";
	frm.submit();
}

</script>	
	
<title>Insert title here</title>
</head>
<body>


<div style="width:1800px;margin:50px auto;">
<form id="detailFrm" name="detailFrm">
		<input type="hidden" name="detailNo">
</form>



<div class="title">REQUEST 리스트 관리 Page</div>


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

<div style="width:1700px;margin:0 auto;">		<!-- 리스트 가운데 정렬 -->
<div class="divA">
	<div class="divLeft">
	<form name="frmPage1" method="post"
		action="<c:url value='/admin/post/request.do'/>">
		
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

	<div class="divSearch" style="width:1300px; margin:0 auto;">
	   	<form name="frmSearch" method="post" 
	   		action='<c:url value="/admin/post/request.do"/>'>
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
			<input type ="image" src="<c:url value='../../images/black18s.png'/>" 
			align="absmiddle" >	
			
			
				
	    </form>
	</div>
</div>

<!-- 페이징 처리를 위한 form -->
<form name="frmPage" method="post"
	action="<c:url value='/admin/post/request.do'/>">
	<input type="hidden" name="currentPage" >
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
</form>
<br><br>
<div class="divList" style="width:1300px; margin:0 auto;">
<form name="frmList" method="post">
<table class="box2">
	<colgroup>
		<col style="width:4%;" />
		<col style="width:5%;" />
		<col style="width:10%;" />
		<col style="width:29%;" />
		<col style="width:20%;" />
		<col style="width:15%;" />
		<col style="width:*;" />		
	</colgroup>
	<thead >
	  <tr>
		<th scope="col"><input type="checkbox" name="chkAll"/></th>
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
		  	<c:set var="idx" value="0"/>
		  	<c:forEach var="vo" items="${list}">
	  			<tr >
	  				<td><input type="checkbox" name="pdItems[${idx}].RQNo"
				value="${vo.RQNo}" ></td>
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
						
						
						<a href="#" onclick="detailView('${vo.RQNo}')">
								
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
				           <input type ="image" src="<c:url value='../../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>

					
					<c:choose>
				      <c:when test="${vo.pickCount>='2'}">
				           <input type ="image" src="<c:url value='../../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
								
					<c:choose>
				      <c:when test="${vo.pickCount>='3'}">
				           <input type ="image" src="<c:url value='../../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
					
					<c:choose>
				       <c:when test="${vo.pickCount>='4'}">
				           <input type ="image" src="<c:url value='../../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
					
					<c:choose>
				       <c:when test="${vo.pickCount>='5'}">
				           <input type ="image" src="<c:url value='../../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>		
					
					</td>	
				</tr>
				<c:set var="idx" value="${idx+1 }"/>
			</c:forEach>
		  	<!--반복처리 끝  -->
	  	</c:if>
	  </tbody>
</table>
<br>
</form>	   
</div>
</div>
<div class="divPage" style="text-align:center; height:30px;font-size:16px;">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<c:if test="${pageVo.firstPage>1 }">
		<a href="#" onclick="pageFunc(${pageVo.firstPage-1})">
			<img alt="이전 블럭으로 이동" src="../../images/first.JPG">
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
			<img alt="다음 블럭으로 이동" src="../../images/last.JPG">
		</a>	
	</c:if>
	<!--  페이지 번호 끝 -->
</div>
<div style="float:right;">
<input type="button" value="글 삭제하기" id="delMulti"></div>

</div>
</body>
</html>