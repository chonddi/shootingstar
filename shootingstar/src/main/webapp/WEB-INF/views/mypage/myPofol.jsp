<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypageTop.jsp"%>
<link href="<c:url value='/css/portfolioList.css'/>" rel="stylesheet">
<style type="text/css">
#portSearch:after{
	clear:both;
	content:'';
	display: block;
}
#myPofol {
    color: #1f1f1f;
    font-weight: 700;
    border-bottom: 3px solid #e46c0a;
}
.pofolSelect{
	width: 111px;
    height: 25px;
    margin-left: 10px;
    font-size: 13px;
    font-weight: bold;
}
</style>
<script type="text/javascript">
	$(function(){
		$('.pofolSelect').change(function(){
			var cgNo = $('.pofolSelect').val();
			$('input[name=searchCondition]').val(cgNo);
			$('input[name=searchKeyword]').val('');
			$('form[name=frmSearch]').submit();
		});
	});
</script>
		나의 포트폴리오
	</div>
	<!-- 페이징 처리를 위한 form -->
	<div class="selectedPage">
		<form name="frmPage" method="post"
			action="<c:url value='/mypage/myPofol.do'/>">
			<input type="hidden" name="currentPage" value=""> 
			<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
			<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		</form>
		
		<div>
			<div id="portSearch" style="width: 100%;margin: 0 auto;margin-bottom: 15px;">
				<div id="topSearch">
					<c:if test="${!empty param.searchKeyword}">
					검색 결과 : <span>${pageVo.totalRecord}건</span>
					</c:if>
					<c:if test="${empty param.searchKeyword}">
					전체 조회 : <span>${pageVo.totalRecord}건</span>
					</c:if>
				</div>
				
				<div style="clear:both;">
					
					<form name="frmSearch" method="post" action='<c:url value="/mypage/myPofol.do"/>'>
						<select class="pofolSelect">
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
								<input type="text" class="form-control" name="searchKeyword" placeholder="나의 포트폴리오 타이틀로 검색"> 
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
		
		
			<c:forEach var="map" items="${pofolList}">
				<a href="<c:url value='/portfolio/portfolioDetail.do?pfNo=${map["PFNO"]}'/>">
					<div id="portList" style="float: none;margin: 0 auto;">
						<img alt="" src="<c:url value='/portfolio_images/${map["FILENAME"]}'/>">
						<div id="listInfo">
							<div id="portName">
								<c:if test='${fn:length(map["PFTITLE"])>22}'>	
												${fn:substring(map["PFTITLE"], 0, 22)}...
											</c:if>
								<c:if test='${fn:length(map["PFTITLE"])<=22}'>
												${map["PFTITLE"]}
											</c:if>
							</div>
							<div id="photoInfo">
								<span class="phothgrahper">${map["CGNAME"]}</span>
								<span><fmt:formatDate value="${map['REGDATE'] }" pattern="yyyy-MM-dd" /></span>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
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
		
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>