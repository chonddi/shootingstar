<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("form[name=frm1]").submit(function() {
			var bool = true;

			$(".valid1").each(function() {
				if ($.trim($(this).val()).length < 1) {
					alert($(this).prev().text() + "을 입력해주세요 !");
					$(this).prev().focus();

					bool = false; //서브밋 이벤트 진행 막기
					return false; //each 탈출
				}
			
			$(".valid").each(function() {
				if ($.trim($(this).val()).length < 1) {
					alert($(this).prev().text() + "를 선택해주세요 !");
					$(this).prev().focus();

					bool = false; //서브밋 이벤트 진행 막기
					return false; //each 탈출
				}
			});

	});

			return bool;
		});
	});
</script>

<head>

</head>
<div class="divForm">
	<form name="frm1" method="post"
		action="<c:url value='/portfolio/portfolioWrite.do'/>"
		enctype="multipart/form-data">
		<fieldset>
			<legend>포트폴리오 등록하기</legend>
			<div>
				<label for="portfolioTitle">포트폴리오 타이틀</label> <input type="text"
					name="pfTitle" class="valid1">

				<div>
					<label for="categoryNo">카테고리</label> <select name="category"
						id="categoryNo" title="카테고리" class="valid">
						<option value="">카테고리를 선택해 주세요 !</option>
						<!-- 반복문 시작 -->
						<%-- <c:forEach var="vo" items="${list }"> --%>
						<option value="1">일번</option>
						<%-- 		</c:forEach> --%>
						<!-- 반복문 끝 -->
					</select>
				</div>
				<div>
					<label for="imageUpload">포트폴리오에 등록할 이미지</label> <input type="file"
						multiple="multiple" name="files" id="imageUpload" class="valid">
				</div>
				<div>
					<input type="text" name="smemberId"
						value="전문가의 아이디를 저장하는 hidden 입니다 ~" size="50">
				</div>
				<input type="submit" value="등록"> <input type="reset"
					value="취소">
		</fieldset>
	</form>
</div>

<%@ include file="../inc/bottom.jsp"%>