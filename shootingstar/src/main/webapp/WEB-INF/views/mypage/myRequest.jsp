<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypageTop.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypageTop.css'/>" /> 
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
<style type="text/css">
#myRequest{
	font-weight:700;
	border-bottom:3px solid #e46c0a;
}
</style>   
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<script type="text/javascript">
	$(function(){
		$('.ctgSelect').change(function(){
			var cgNo = $('.ctgSelect').val();
			$('input[name=searchCondition]').val(cgNo);
			$('input[name=searchKeyword]').val('');
			$('form[name=frmSearch]').submit();
		});
		
		$('#reqWrite').click(function(){
			location.href="<c:url value='/request/write.do'/>"
		});
		
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
						.prop("action","<c:url value='/request/deleteMulti2.do'/>");
						$("form[name=frmList]").submit();
			        });
			      } else {
			        swal("Cancelled", "취소되었습니다:)", "error");
			      }
			    })
			});  
		});
	
			//페이징 펑션
			function pageFunc(curPage){
				document.frmPage.currentPage.value=curPage;
				frmPage.submit();	
				
	}
	
</script>
		<span class="title">나의 REQUEST</span>
	</div>
	<!-- 페이징 처리를 위한 form -->
	<div class="selectedPage">
		<form name="frmPage" method="post"
			action="<c:url value='/mypage/myRequest.do'/>">
			<input type="hidden" name="currentPage"> 
			<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
			<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		</form>
		
		<div style="height:550px;">
			<div id="portSearch" style="width: 100%;margin: 0 auto;margin-bottom: 15px;">
				<div id="topSearch">
					<c:if test="${!empty param.searchKeyword}">
					검색 결과 : <span>${pageVo.totalRecord}건</span>
					</c:if>
					<c:if test="${empty param.searchKeyword}">
					전체 조회 : <span>${pageVo.totalRecord}건</span>
					</c:if>
				</div>
				<br>
				<div style="clear:both;">
					
					<form name="frmSearch" method="post" action='<c:url value="/mypage/myRequest.do"/>'>
						<select class="ctgSelect">
							<option value="">전체보기</option>
							<c:forEach var="vo" items="${cgList }">
								<option value="${vo.cgNo }" 
									<c:if test="${param.searchCondition==vo.cgNo}">
										selected="selected"
									</c:if>								
								>
									${vo.cgName }
								</option>
							</c:forEach>
						</select>
						<div class="col-lg-6" style="float: right;">
							<div class="input-group">
								<input type="text" class="form-control" name="searchKeyword" placeholder="나의 Request 타이틀로 검색" value="${param.searchKeyword }"> 
								<span class="input-group-btn">
									<button type="submit" class="btn btn-primary">검색</button>
								</span>
							</div>
						</div>
						<input type="hidden" name="searchCondition"
							value="${param.searchCondition}">
					</form>
				</div>
			</div>
		
	<form name="frmList" method="post" style="width:1400px;">	
		<table class="box2">
	<colgroup>
		<col style="width:5%;" />
		<col style="width:5%;" />
		<col style="width:15%;" />
		<col style="width:27%;" />
		<col style="width:12%;" />
		<col style="width:15%;" />
		<col style="width:*;" />		
	</colgroup>
	<thead >
	  <tr>
	
	    <th scope="col" id="ttlt"><input type="checkbox" name="chkAll" style="width:15px;height:15px;"> </th>
	    <th scope="col" id="ttlt">번호</th>
	    <th scope="col" id="ttlt">카테고리</th>
	    <th scope="col" id="ttlt">내용</th>
	    <th scope="col" id="ttlt">작성일</th>
	    <th scope="col" id="ttlt">진행도</th>
	    <th scope="col" id="ttlt">PICK</th>
	  </tr>
	</thead> 
	
	<tbody>  
	
		<c:if test="${empty list }">
			<tr>
				<td colspan="6" class="non">
					데이터가 존재하지 않습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
		<c:set var="idx" value="0"/>
		  	<!--게시판 내용 반복문 시작  -->	
		  	<c:forEach var="map" items="${list}">
		  	<c:set var="plevel" value="${map['PLEVEL']}"/>
		  	<c:set var="delf" value="${map['DELFLAG']}"/>
		  	<c:set var="rqno" value="${map['RQNO']}"/>
	  			<tr>
	  				<td id="ttl">
	  				<c:if test="${plevel==0&&delf!='Y'}">
		  				<input type="checkbox" name="pdItems[${idx}].RQNo" 
		  				value="${map['RQNO']}" style="width:15px;height:15px;"> 
					</c:if>
				</td>
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
					
					
					<td id="ttl" > 
						<fmt:parseNumber value="${map['PLEVEL']}" var="plevel"/> 
						
								
						<!-- 삭제된 원본글인 경우 삭제된 글로 처리 -->
						<c:choose>
							<c:when test="${plevel>=4}">
								<span style="color:#c3c3c3;font-size: 1.0em;font-weight:lighter;">
									거래가 완료된 글입니다.</span>
							</c:when>
							<c:when test="${delf=='Y'}">
								<span style="color:#dedede;font-size: 1.0em;font-weight:lighter;">
									삭제된 글입니다.</span>
							</c:when>
							<c:otherwise>	
							<a href="<c:url value='/request/detail.do?no=${rqno}'/>" style="cursor:pointer;font-weight:bold;">		
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
					
					
					
					
					
					<td id="ttl"><fmt:formatDate value="${map['REGDATE']}"
						pattern="yyyy-MM-dd"/> </td>
						
					
					
					<td id="ttl"> 
						<c:if test="${plevel==0}">
						<span>PICK 채택 전</span>
						</c:if>
						<c:if test="${plevel==1}">
							<span>세부조율단계</span>
						</c:if>
						<c:if test="${plevel==2}">
							<span>최종결제단계</span> 
						</c:if>
						<c:if test="${plevel==3}">
							<span>거래완료</span>
						</c:if></span> <br><br> </td>
					
					
					<!-- pickcount 갯수 표시 -->
					<td class="pick" id="ttl"> 
					<c:set var="pickc" value="${map['PICKCOUNT']}"/>
					<fmt:parseNumber var="pick" type="number" value="${pickc}" />

			

					<c:choose>
				       <c:when test="${pick>=1}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>

					
					<c:choose>
				      <c:when test="${pick>=2}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
								
					<c:choose>
				      <c:when test="${pick>=3}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
					
					<c:choose>
				       <c:when test="${pick>=4}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
					</c:otherwise>
					</c:choose>
					
					<c:choose>
				       <c:when test="${pick>=5}">
				           <input type ="image" src="<c:url value='../images/ckb.png'/>">
				       </c:when>
					<c:otherwise>
					<input type ="image" src="<c:url value='../images/uckb.png'/>">
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
</form>	
			
			
			<div class="divPage">
				<!-- 페이지 번호 추가 -->
				<!-- 이전 블럭으로 이동 -->
				<c:if test="${pageVo.firstPage>1 }">
					<a href="#" onclick="pageFunc(${pageVo.firstPage-1})"> <span
						class="pageNum3"> PREV </span>
					</a>
				</c:if>
		
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pageVo.firstPage }"
					end="${pageVo.lastPage}">
					<c:if test="${i==pageVo.currentPage }">
						<span class="pageNum1"> ${i}</span>
					</c:if>
					<c:if test="${i!=pageVo.currentPage }">
						<a href="#" onclick="pageFunc(${i})"> <span class="pageNum2">
								${i} </span>
						</a>
					</c:if>
				</c:forEach>
		
				<!-- 다음 블럭으로 이동 -->
				<c:if test="${pageVo.lastPage<pageVo.totalPage }">
					<a href="#" onclick="pageFunc(${pageVo.lastPage+1})"> <span
						class="pageNum3"> NEXT </span>
					</a>
				</c:if>
				<!--  페이지 번호 끝 -->
			</div>
			
			<input type="button" value="삭제하기" class="mypageBtn" id="delMulti" style="margin-right:20px;height:35px;">
			<input type="button" id="reqWrite" class="mypageBtn" value="Request 등록하기" style="width:140px; height:35px;float:right;">
			
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>