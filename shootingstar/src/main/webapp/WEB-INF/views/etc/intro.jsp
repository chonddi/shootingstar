<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='../css/write.css'/>">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IA4cSQ_imngW0f0TUP9c&submodules=geocoder"></script>
<title>Insert title here</title>
</head>
<body>

<div style="width:1230px; height:550px;margin-bottom:50px;">
	<div style="width:1230px; height:100px;float:left;margin-bottom:35px;">
		<div id="itlt" style="margin-bottom:25px;">회사소개</div>
		<div style="font-family:'Nanum Gothic', sans-serif;font-weight:800;font-size:22px;margin-bottom:20px;">
		(주)슈팅스타를 소개합니다.</div>
	</div>

	<div style="width:1230px;text-align:center;padding-left:320px;">
		<div style="width:400px;">
		<img src='../images/mainTopLogo.png' style="width:350px; height:150px; margin-left:160px; margin-bottom:30px;"/>
		</div>
	
		<div id="icnt" style="line-height:50px;font-size:14px;margin-bottom:60px;">
		슈팅스타는 ‘사진을 원하는 모두의 니즈를 충족시킴’이라는 미션으로 시작되었습니다. <br>
		
		현재 2018년 8월부터 시작된 사진촬영서비스 시장에서 구매자와 판매자 양측의 니즈를 이어주는 
		매칭 플랫폼 <br>'슈팅스타'를 서비스 중 입니다.
		</div>
	</div>

</div>




<div id="itlt">핵심가치</div><br>
<div style="width:1230px; height:700px;float:left;">

	<div id="icnt1" style="text-align:center;">
	<img src='../images/acs.png' style="width:80px; height:80px;vertical-align:middle;"> 
		<div style="margin-left:9px;margin-top:10px;">
		<span style="font-size:27px;font-weight:800">접근성</span> - 서비스를 요하는 고객이 쉽게 이용할 수 있어야 한다</div>
	</div>
	
	<div id="icnt1" style="text-align:center;">
	<img src='../images/qual.png' style="width:60px; height:60px;vertical-align:middle;margin-left:10px;">
		<div style="margin-left:17px;margin-top:10px;">
		<span style="font-size:27px;font-weight:800">품질</span> - 누구나 믿을 수 있는 서비스를 제공하여야 한다 </div>
	</div>
	
	<div id="icnt1" style="text-align:center;">
	<img src='../images/tu.png' style="width:60px; height:60px;vertical-align:middle;margin-left:10px;">
		<div style="margin-left:10px;margin-top:10px;">
		<span style="font-size:27px;font-weight:800">정확도</span> - 보다 니즈에 정확히 부합하는 서비스를 제공한다</div>
	</div>


</div>



<div id="itlt">오시는 길</div><br>

 <div style="width:1230px;height:350px;padding-left:415px;text-align:center;">
 <div id="map" style="width:400px;height:300px;"></div>
    <script>
      var map = new naver.maps.Map('map',{
    	  logoControl:false,
    	  mapDataControl: false	  
      });
      var myaddress = '서울특별시 강남구 봉은사로2길 5';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          
          var contentString = [
              '서울특별시 강남구 봉은사로2길 5'
          ].join('');
          
          var infowindow = new naver.maps.InfoWindow({
        	    content: contentString
        	});
          
      });
      </script> 

 </div>

<div style="width:1230px;text-align:center;font-family:'Nanum Gothic', sans-serif;margin-bottom:100px;">
본사: 서울특별시 강남구 봉은사로2길 5(역삼동) SS타워 3층 101호<br>
 지하철 - 9호선 신논현역 4번출구에서 도보 2분
 </div>



</body>
</html>



<%@ include file="../inc/bottom.jsp"%>