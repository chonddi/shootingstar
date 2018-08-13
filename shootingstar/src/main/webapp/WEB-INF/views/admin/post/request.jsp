<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../inc/adminTop.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="width:1903px;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <link rel="stylesheet" type="text/css"
	href="<c:url value='/css/aPost.css'/>">
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
				alert("삭제할 글을 먼저 체크하세요");
				return;
			}
			//삭제 confirm창 처리
			  swal({
			      title: "삭제하시겠습니까?",
			      text: "선택한 글들이  삭제처리될 예정입니다. 계속하시겠습니까?",
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
		
		//다중복원
		$("#resMulti").click(function(){
			var count=$("tbody input[type=checkbox]:checked").length;
			if(count==0){
				alert("복원할 글을 먼저 체크하세요");
				return;
			}
			//삭제 confirm창 처리
			  swal({
			      title: "복구하시겠습니까?",
			      text: "선택한 글들이  복구처리될 예정입니다. 계속하시겠습니까?",
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
			          text: '글 복구가 완료되었습니다.',
			          icon: 'success'
			        }).then(function() {
			        	$("form[name=frmList]")
						.prop("action","<c:url value='/admin/post/resMulti.do'/>");
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
		
		//카테고리로 검색하게 하기
		$('.ctgSelect').change(function(){
			var cgNo = $('.ctgSelect').val();
			$('input[name=searchCondition]').val(cgNo);
			$('input[name=searchKeyword]').val('');
			$('form[name=frmSearch]').submit();
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
	x = (screen.availWidth - 700) / 1.2;
	y = (screen.availHeight - 600) / 2;
	window.open("","viewer","left=" + x + ", top=" + y + ", width=700, height=600, location=yes, resizable=no");
	frm.action = "<c:url value='/admin/post/reqDetail.do'/>";
	frm.target = "viewer";
	frm.method = "post";
	frm.submit();
}

</script>	
	
<title>Insert title here</title>
</head>
<body>


<div style="width:1903px;margin:50px auto;padding-left:200px;padding-right:70px;">
<form id="detailFrm" name="detailFrm" style="width:1400px;">
		<input type="hidden" name="detailNo">
</form>


<div style="width:1400px;">
<div class="title" style="width:1400px;">REQUEST 관리 Page</div>

<div style="font-weight:bold;">
<c:if test="${!empty param.searchKeyword}">
	<p>검색어: ${param.searchKeyword}(으)로  ${fn:length(list)}건 검색되었습니다. </p> 
</c:if>
<c:if test="${empty param.searchKeyword}">
	<p>총 ${pageVo.totalRecord}건의 REQUEST가 조회되었습니다. </p> 
</c:if>
</div>
<hr>
<br>
<%-- <c:if test="${!empty param.cgNo }">
	<p>${ctgProductVO.cgName } 상품 : ${pagingInfo.totalRecord } 건 입니다.</p>
</c:if> --%>

<div style="width:1400px;height:70px;float:left;padding-left:20px;">		<!-- 리스트 가운데 정렬 -->
<div class="divA">
	<div class="divLeft" style="float:left">
	<form name="frmSearch" method="post" action='<c:url value="/admin/post/request.do"/>'>
						<select class="ctgSelect">
							<option value="">전체보기</option>
							<c:forEach var="vo" items="${cList }">
								<option value="${vo.cgNo }" 
									<c:if test="${param.searchCondition==vo.cgNo}">
										selected="selected"
									</c:if>>
									${vo.cgName }
								</option>
							</c:forEach>
						</select>
					</form>
	
	</div>

	<div class="divSearch" style="width:270px;float:right;">
	   	<form name="frmSearch" method="post" 
	   		action='<c:url value="/admin/post/request.do"/>'>
	        <div>
	        		<button type="submit" style="float:right;" class="mBtn2">검색</button>
					<input type="text" name="searchKeyword"
						placeholder="글쓴이명 또는 제목으로 검색" style="width:220px; float:left;"> 
						
			</div>
			<input type="hidden" name="searchCondition"
				value="${param.searchCondition}">	
	    </form>
	</div> 
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
<div class="divList" style="width:1400px;">
<form name="frmList" method="post" style="width:1400px;">
<table class="box2" style="width:1400px;margin-left:30px;">
	<colgroup>
		<col style="width:4%;" />
		<col style="width:5%;" />
		<col style="width:10%;" />
		<col style="width:29%;" />
		<col style="width:20%;" />
		<col style="width:15%;" />
		<col style="width:*;" />		
	</colgroup>
	<thead style="text-align:center;">
	  <tr>
		<th scope="col" id="ttlt"><input type="checkbox" name="chkAll"/></th>
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
		  	<c:forEach var="map" items="${list}">
	  			<tr >
	  				<td><input type="checkbox" name="pdItems[${idx}].RQNo"
				value="${map['RQNO']}" ></td>
					<td id="ttl">${map['RQNO']}</td>
					<td id="ttl"> 
					<c:choose>
						 <c:when test="${map['CGNO']==1}">인물/프로필</c:when>
						 <c:when test="${map['CGNO']==2}">푸드</c:when>
						 <c:when test="${map['CGNO']==3}">패션</c:when>
						 <c:when test="${map['CGNO']==4}">웨딩</c:when>
						 <c:when test="${map['CGNO']==5}">행사/컨퍼런스</c:when>
						 <c:when test="${map['CGNO']==6}">건축/인테리어</c:when>
						 <c:when test="${map['CGNO']==7}">공연</c:when>
						 <c:when test="${map['CGNO']==8}">광고</c:when>
						 <c:when test="${map['CGNO']==9}">스냅사진</c:when>
						</c:choose>
					</td>
					
					
					<td id="ttl" style="font-weight:bold;" > 
						 
						
						<fmt:parseNumber value="${map['PLEVEL']}" var="plevel"/> 
						<a href="#" onclick="detailView('${map['RQNO']}')">
						<c:set var="delf" value="${map['DELFLAG']}"/>		
						<!-- 삭제된 원본글인 경우 삭제된 글로 처리 -->
						<c:choose>
							<c:when test="${plevel>=3}">
								<span style="color:gray;font-size: 0.9em;font-weight:lighter;">
									거래가 완료된 글입니다.</span>
							</c:when>
							<c:when test="${delf=='Y'}">
								<span style="color:gray;font-size: 0.9em;font-weight:lighter;">
									삭제된 글입니다.</span>
							</c:when>
							<c:otherwise>				
									<!-- 내용 일부만 보여주기 -->
									<c:set var="title" value="${map['RQDETAIL']}"/>
									
									<c:if test="${fn:length(title)>18}">	
											${fn:substring(title, 0, 18)}...
									</c:if>
									<c:if test="${fn:length(title)<=18}">
											${title}
									</c:if>								
								</a>
					
							</c:otherwise>
						</c:choose>		
					</td>
					
					
					
					
					<td id="ttl"> ${map['MEMBERID']} </td>
					<td id="ttl"><fmt:formatDate value="${map['REGDATE']}"
						pattern="yyyy-MM-dd"/> </td>
					
					<!-- pickcount 갯수 표시 -->
					<td class="pick" id="ttl"> 
					<c:set var="pickc" value="${map['PICKCOUNT']}"/>
					<fmt:parseNumber var="pick" type="number" value="${pickc}" />

			

					<c:choose>
				       <c:when test="${pick>=1}">
				           <input type ="image" src="<c:url value='../../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>

					
					<c:choose>
				      <c:when test="${pick>=2}">
				           <input type ="image" src="<c:url value='../../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
								
					<c:choose>
				      <c:when test="${pick>=3}">
				           <input type ="image" src="<c:url value='../../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
					
					<c:choose>
				       <c:when test="${pick>=4}">
				           <input type ="image" src="<c:url value='../../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
					
					<c:choose>
				       <c:when test="${pick>=5}">
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
<div class="divPage" style="text-align:center; height:60px;font-size:16px;margin-top:10px;
	padding-top:20px;margin-right:150px;">
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
<input type="button" value="복원하기" class="mBtn" id="resMulti" style="margin-right:250px;"></div>
<input type="button" value="삭제하기" class="mBtn" id="delMulti" style="margin-right:20px;float:right;"></div>


</div>
</body>
</html>
