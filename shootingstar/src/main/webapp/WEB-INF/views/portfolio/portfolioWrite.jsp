<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
	var sel_files = [];
	$(document).ready(function() {
		$("form[name=frm1]").submit(function() {
			var bool = true;

			$(".valid1").each(function() {
				if ($.trim($(this).val()).length < 1) {
					alert($(this).prev().text());
					$(this).prev().focus();

					bool = false; //서브밋 이벤트 진행 막기
					return false; //each 탈출
				}

				$(".valid").each(function() {
					if ($.trim($(this).val()).length < 1) {
						alert($(this).prev().prev().text());
						$(this).prev().prev().focus();

						bool = false; //서브밋 이벤트 진행 막기
						return false; //each 탈출
					}
				});

			});

			return bool;
		});
	
		$('#imageUpload').on("change", handleImgsFilesSelect);
	});
	
	function handleImgsFilesSelect(e){
		sel_files = [];
		$(".imgs_wrap").empty();
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\""+e.target.result+"\" width='150px'/>";
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
		})
	}
	
	function deleteImageAction(index){
		console.log("index:"+index);
		sel_files.splice(index,1);
		
		var img_id = "#img_id_"+index;
		$(img_id).remove();
		console.log(sel_files);
	}

/* 	function chng() {
		var typ = document.getElementById("imageUpload").value;
		var res = typ.match(".jp");

		if (res) {
		} else {
			alert("이미지 파일만 가능합니다.");
			document.getElementById("imageUpload").value = "";
		}
	} */
</script>
<style type="text/css">
#divForm {
	width: 1000px;
	margin: 0 auto;
	border: 1px solid #376092;
	padding: 20px;
	border-radius: 15px;
	line-height: 30px;
}

#divForm label {
	font-size: 1.5em;
	font-weight: bold;
	color: #376092;
	margin-top: 10px;
}
.imgs_wrap>img{
	margin: 10px;
}

</style>
<head>

</head>
<div id="divForm">
	<div>
		<img alt="portfolioWrite" src="<c:url value='/images/portfolioWritee.png'/>">
	</div>
	<form name="frm1" method="post"
		action="<c:url value='/portfolio/portfolioWrite.do'/>" enctype="multipart/form-data">
		<div class="form-group">
			<label for="portfolioTitle">포트폴리오 타이틀을 입력해주세요 !</label> <input
				type="text" class="form-control valid1" name="pfTitle"
				placeholder="포트폴리오 타이틀을 입력하세요">
		</div>
		<label for="categoryNo">카테고리를 선택해주세요 !</label><br> <select
			name="category" id="categoryNo" title="카테고리"
			class="form-control valid">
			<option value="">카테고리를 선택해 주세요 !</option>
			<!-- 반복문 시작 -->
			<%-- <c:forEach var="vo" items="${list }"> --%> 
			<option value="1">일번</option>
			<%-- 		</c:forEach> --%>
			<!-- 반복문 끝 -->
		</select> <br>
		<div class="form-group">
			<label for="exampleInputFile">업로드할 이미지를 선택해주세요!</label><input
				type="file" multiple="multiple" name="files" id="imageUpload"
				class="valid1" accept='image/*'> 
			<p class="help-block">이미지만 선택하실 수 있습니다.</p>
		</div>
		<label for="eimgs_wrap"> 이미지 미리보기 </label>
		<div>
			<div class="imgs_wrap"></div>
		</div>
		<button type="submit" class="btn btn-default">등록</button>
		<input type="reset" class="btn btn-default" value="취소">
	</form>
</div>

<%@ include file="../inc/bottom.jsp"%>