<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>	
<html>
<head>
<meta charset="utf-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <script src="https://unpkg.com/sweetalert2@7.17.0/dist/sweetalert2.all.js"></script> -->
<link rel="stylesheet" type="text/css" href="<c:url value='../css/write.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/request.css'/>">



<link href="../css/datepicker.min.css" rel="stylesheet" type="text/css">
     <script src="../js/datepicker.min.js"></script>
      <script src="../js/i18n/datepicker.en.js"></script>

<link rel="stylesheet" href="../css/jquery-ui.min.css">

<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>





<script type="text/javascript">

//지역 다중 선택 selectBox
function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

    if(val == '서울'){
        addOption('종로구', targetE);
        addOption('은평구', targetE);
        addOption('중랑구', targetE);
        addOption('강남구', targetE);
        addOption('서초구', targetE);
        addOption('송파구', targetE);
        addOption('관악구', targetE);
        addOption('금천구', targetE);
        addOption('영등포구', targetE);
        addOption('강서구', targetE);
        addOption('강북구', targetE);
        addOption('노원구', targetE);
        addOption('강동구', targetE);
        addOption('양천구', targetE);
        addOption('관악구', targetE);
        addOption('성동구', targetE);
        addOption('동대문구', targetE);
        addOption('서대문구', targetE);
        addOption('동작구', targetE);
        addOption('구로구', targetE);
        addOption('용산구', targetE);
        addOption('성북구', targetE);
        addOption('도봉구', targetE);
        addOption('마포구', targetE);
    }
    else if(val == '인천'){
        addOption('남동', targetE);
        addOption('중구', targetE);
        addOption('남구', targetE);
        addOption('서구', targetE);
        addOption('동구', targetE);
        addOption('계양구', targetE);
        addOption('연수구', targetE);
        addOption('부평구', targetE);
        addOption('강화군', targetE);
        addOption('옹진군', targetE);
  }
    else if(val == '경기'){
    	 addOption('수원시', targetE);
         addOption('안산시', targetE);
         addOption('시흥시', targetE);
         addOption('광명시', targetE);
         addOption('용인시', targetE);
         addOption('의왕시', targetE);
         addOption('안양시', targetE);
         addOption('군포시', targetE);
         addOption('과천시', targetE);
         addOption('성남시', targetE);
         addOption('하남시', targetE);
         addOption('화성시', targetE);
         addOption('오산시', targetE);
         addOption('파주시', targetE);
         addOption('여주시', targetE);
         addOption('안성시', targetE);
         addOption('평택시', targetE);
         addOption('의정부시', targetE);
         addOption('동두천시', targetE);
         addOption('고양시', targetE);
         addOption('남양주시', targetE);
         addOption('부천시', targetE);
         addOption('구리시', targetE);
         addOption('김포시', targetE);
         addOption('양주시', targetE);
         addOption('포천시', targetE);
         addOption('이천시', targetE);
         addOption('광주시', targetE);
         addOption('양평군', targetE);
         addOption('가평군', targetE);
         addOption('연천군', targetE);
    } else if(val == '강원'){
   	      addOption('춘천시', targetE);
          addOption('원주시', targetE);
          addOption('강릉시', targetE);
          addOption('속초시', targetE);
          addOption('동해시', targetE);
          addOption('태백시', targetE);
          addOption('삼척시', targetE);
          addOption('화천군', targetE);
          addOption('홍천군', targetE);
          addOption('횡성군', targetE);
          addOption('평창군', targetE);
          addOption('영월군', targetE);
          addOption('정선군', targetE);
          addOption('양양군', targetE);
          addOption('고성군', targetE);
          addOption('철원군', targetE);
          addOption('양구군', targetE);
          addOption('인제군', targetE);
    } else if(val == '충남'){
   	     addOption('홍성군', targetE);
         addOption('천안시', targetE);
         addOption('공주시', targetE);
         addOption('보령시', targetE);
         addOption('아산시', targetE);
         addOption('서산시', targetE);
         addOption('논산시', targetE);
         addOption('계룡시', targetE);
         addOption('당진시', targetE);
         addOption('예산군', targetE);
         addOption('부여군', targetE);
         addOption('서천군', targetE);
         addOption('청양군', targetE);
         addOption('금산군', targetE);
         addOption('태안군', targetE);
    } else if(val == '대전'){
    	addOption('서구', targetE);
        addOption('동구', targetE);
        addOption('중구', targetE);
        addOption('유성구', targetE);
        addOption('대덕구', targetE);
    } else if(val == '세종'){
    	addOption('연기군', targetE);
        addOption('공주시', targetE);
        addOption('청원군', targetE);
        addOption('조치원읍', targetE);
        addOption('한솥동', targetE);
        addOption('도담동', targetE);
        addOption('연기면', targetE);
        addOption('금남면', targetE);
        addOption('장군면', targetE);
        addOption('부강면', targetE);
        addOption('연동면', targetE);
        addOption('연서면', targetE);
        addOption('전의면', targetE);
        addOption('전동면', targetE);
        addOption('소정면', targetE);
    } else if(val == '충북'){
    	 addOption('청주시', targetE);
         addOption('충주시', targetE);
         addOption('제천시', targetE);
         addOption('괴산군', targetE);
         addOption('단양군', targetE);
         addOption('음성군', targetE);
         addOption('진천군', targetE);
         addOption('옥천군', targetE);
         addOption('보은군', targetE);
         addOption('영동군', targetE);
         addOption('증평군', targetE);
    } else if(val == '경북'){
    	addOption('안동시', targetE);
        addOption('예천군', targetE);
        addOption('포항시', targetE);
        addOption('구미시', targetE);
        addOption('김천시', targetE);
        addOption('경주시', targetE);
        addOption('상주시', targetE);
        addOption('문경시', targetE);
        addOption('영주시', targetE);
        addOption('영천시', targetE);
        addOption('경산시', targetE);
        addOption('군위군', targetE);
        addOption('의성군', targetE);
        addOption('청도군', targetE);
        addOption('봉화군', targetE);
        addOption('칠곡군', targetE);
        addOption('울진군', targetE);
        addOption('영덕군', targetE);
        addOption('영양군', targetE);
        addOption('청송군', targetE);
        addOption('고령군', targetE);
        addOption('성주군', targetE);
        addOption('울릉군', targetE);
    } else if(val == '대구'){
   	    addOption('중구', targetE);
        addOption('동구', targetE);
        addOption('서구', targetE);
        addOption('남구', targetE);
        addOption('북구', targetE);
        addOption('달서구', targetE);
        addOption('수성구', targetE);
        addOption('달성군', targetE);
    } else if(val == '울산'){
    	addOption('남구', targetE);
        addOption('북구', targetE);
        addOption('동구', targetE);
        addOption('중구', targetE);
        addOption('울주군', targetE);
    } else if(val == '경남'){
    	addOption('창원시', targetE);
        addOption('김해시', targetE);
        addOption('밀양시', targetE);
        addOption('진주시', targetE);
        addOption('양산시', targetE);
        addOption('거제시', targetE);
        addOption('통영시', targetE);
        addOption('사천시', targetE);
        addOption('함안군', targetE);
        addOption('함양군', targetE);
        addOption('의령군', targetE);
        addOption('고성군', targetE);
        addOption('창녕군', targetE);
        addOption('거창군', targetE);
        addOption('합천군', targetE);
        addOption('하동군', targetE);
        addOption('산청군', targetE);
        addOption('남해군', targetE);
    } else if(val == '부산'){
   	     addOption('연제구', targetE);
         addOption('중구', targetE);
         addOption('동구', targetE);
         addOption('서구', targetE);
         addOption('남구', targetE);
         addOption('북구', targetE);
         addOption('영도구', targetE);
         addOption('사상구', targetE);
         addOption('사하구', targetE);
         addOption('동래구', targetE);
         addOption('수영구', targetE);
         addOption('해운대구', targetE);
         addOption('부산진구', targetE);
         addOption('금정구', targetE);
         addOption('강서구', targetE);
         addOption('기장군', targetE);
    } else if(val == '전북'){
    	 addOption('전주시', targetE);
         addOption('익산시', targetE);
         addOption('군산시', targetE);
         addOption('김제시', targetE);
         addOption('정읍시', targetE);
         addOption('남원시', targetE);
         addOption('완주군', targetE);
         addOption('고창군', targetE);
         addOption('부안군', targetE);
         addOption('임실군', targetE);
         addOption('순창군', targetE);
         addOption('무주군', targetE);
         addOption('진안군', targetE);
         addOption('장수군', targetE);
    } else if(val == '광주'){
    	 addOption('서구', targetE);
         addOption('동구', targetE);
         addOption('남구', targetE);
         addOption('북구', targetE);
         addOption('광산구', targetE);
    } else if(val == '전남'){
    	addOption('무안군', targetE);
        addOption('목포시', targetE);
        addOption('여수시', targetE);
        addOption('순천시', targetE);
        addOption('광양시', targetE);
        addOption('나주시', targetE);
        addOption('구례군', targetE);
        addOption('곡성군', targetE);
        addOption('화순군', targetE);
        addOption('담양군', targetE);
        addOption('장성군', targetE);
        addOption('함평군', targetE);
        addOption('해남군', targetE);
        addOption('장흥군', targetE);
        addOption('신안군', targetE);
        addOption('영광군', targetE);
        addOption('고흥군', targetE);
        addOption('보성군', targetE);
        addOption('강진군', targetE);
        addOption('영암군', targetE);
        addOption('완도군', targetE);
        addOption('진도군', targetE);
    } else if(val == '제주'){
        addOption('제주시', targetE);
        addOption('서귀포시', targetE);
    }
}

	function addOption(value, e){
    var o = new Option(value);
    try{
        e.add(o);
    }catch(ee){
        e.add(o, null);
    }
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}



  
$( document ).ready(function() { 
	//파일업로드 갯수 5개로 제한
	$("input[type=file]").change(function(){
		
		var mfile=document.getElementById("oky2");
		if(mfile.files.length>=6){
			alert("업로드 가능한 파일 갯수는 최대 5개 입니다.");
			
			if($.browser.msie){     //익스플로러일 경우 - input type file 초기화
		        $("#oky2").replaceWith( $("#oky2").clone(true) );
				}else{    			//다른 브라우저일 경우- input type file 초기화
		       $("#oky2").val("");
			}
		}
	});
	
	
	
	//sweetalert으로 coonfirm창 띄우기
	document.querySelector('#frm1').addEventListener('submit', function(e) {
		  
		  var form = this;
		  var price = $("#RQPrice").val();
		 
		 

		  e.preventDefault(); 
	
		  swal({
		      title: "입력하신 가격은 "+price+"원입니다.",
		      text: "pick된 글은 수정이 불가합니다. 계속하시겠습니까?",
		      html: true,
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
		          text: 'pick등록이 완료되었습니다.',
		          icon: 'success'
		        }).then(function() {
		          form.submit(); // <--- Click시 sumbit
		        });
		      } else {
		        swal("Cancelled", "취소되었습니다:)", "error");
		      }
		    })
		});
	}); 

</script>
<script>

</script>
<title>Insert title here</title>
</head>

<body><br>



<!-- <div class="pDiv"> -->
		<div class="title1">
		&nbsp;&nbsp;마지막 단계입니다.
		</div>
	<br><br>
	<!-- <div class="main2"> -->
		<form name="frm1" id="frm1" method="post" enctype="multipart/form-data" 
			action="<c:url value='/request/write4.do'/>" >
	 		
	 			<div class="pS">   
					  촬영을 원하시는 지역  <br><br><br>
					   촬영을 원하시는 날짜 <br><br><br>
					   사용 용도 (복수선택가능)<br><br>
			   </div>   
			   
			   <div class="pS1">   
				   	<select name="selOne" id="selOne" onchange="doChange(this, 'selTwo')">
				        <option value="">-지역을 선택하세요-</option>
				        <option value="서울">서울</option>
				        <option value="인천">인천</option>
				        <option value="경기">경기</option>
				        <option value="강원">강원</option>
				        <option value="충남">충남</option>
				        <option value="대전">대전</option>
				        <option value="세종">세종</option>
				        <option value="충북">충북</option>
				        <option value="경북">경북</option>
				        <option value="대구">대구</option>
				        <option value="울산">울산</option>
				        <option value="경남">경남</option>
				        <option value="부산">부산</option>
				        <option value="전북">전북</option>
				        <option value="광주">광주</option>
				        <option value="전남">전남</option>
				        <option value="제주">제주</option>
				       </select>
				   		 
				    <select name="selTwo" id="selTwo">
				        <option value="">-세부지역선택-</option>
				    </select>
						
						<br><br>
					<div class="chkT">
					<img src="../images/cal1.png" style="vertical-align:middle; float:left;"/>
					 <input type="text" id="pS1" name="dtSel" class="datepicker-here" data-language='kr' 
					 	data-position="left top"  style="vertical-align:middle;" autocomplete=off required>
				 
					
					
							<div class="left">	
							<select name="sTime" id="sTime">
								<option value="">시간대</option>
						        <option value="오전">오전</option>
						        <option value="오후">오후</option>
						    </select>
						    </div>
						</div>		
				  		 <div class="chkS">
						   	<input type="checkbox" name="ck1" value="웹용"> 웹용 &nbsp;&nbsp;
							<input type="checkbox" name="ck2" value="인쇄용"> 인쇄용
							<div style="font-size:16px;">(0개 선택 시 "미선택"으로 입력됩니다.)</div>
							<input type="hidden" id= "RQPrice" name="RQPrice" value=${price }>
							<input type="hidden" id="cg1" name="cg1" value=${cg1 }>
						</div>
					</div>
					<br><br>
				   
		   
			 <div class="pS2">
				    <span id="pS3"> 촬영에 대한 세부요청사항을 작성해주세요</span> <br>
				  <textarea name="RQDetail" id="pS2" cols=40 rows=8 autofocus required wrap="soft" 
				  		placeholder="이곳에 요구사항을 작성해주세요.
				  		예):총 몇 명인가요? 몇 가지 컨셉인가요? 어떤 제품인가요? 제품은 총 몇 개 인가요?
				  		 <--내용의 첫 일부분이 제목으로 노출됩니다.-->" style="resize: none;"></textarea>
			 </div>
		  		
		  		
			 <div class="pS3">
					 <span id="pS3"> 참고자료</span><br>
					 참고용 사진을 업로드 해주세요. (최대 5개까지 가능합니다)
					
					        
		        <input type="file" multiple="multiple"  class="oky2" id="oky2" name="file"/>
		        
		       
 
			</div>
			  		 
			 <div id="pS6"> <button class="oky">입력완료</button></div>
		</form>  
     <!-- </div> -->
<!--    </div> -->
    
    
    
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>