/**
 * js/member.js
 */
$(document).ready(function(){
	//우편번호찾기
	$('#btnZipcode').click(function(){
		x = (screen.availWidth - 500) / 2;
		y = (screen.availHeight - 600) / 2;
		window.open('/star/zipcode/zipcode.do', 'zip',"left=" + x + ", top=" + y + ", width=500, height=600, location=yes, resizable=yes");
	});
});

function validate_phoneno(tel){
	var pattern=new RegExp(/^[0-9]*$/g);
	return pattern.test(tel); //정규식과 일치하면 true
	/*  정규식  /^[0-9]*$/g
			0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
			닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복
	 */
}


