//쪽지보내기
$('#sendMsg').click(function(){
	x = (screen.availWidth - 460) / 2;
	y = (screen.availHeight - 550) / 2;
	window.open("<c:url value='/mypage/message/messageWrite.do'/>","쪽지보내기","left=" + x + ", top=" + y + ", width=460, height=550, location=yes, resizable=no");
});

//멀티삭제
$('form[name=frmDel]').submit(function(){
	var count=0;
	$('input[name=chk]').each(function(idx, item){
		if($(this).is(':checked')){
			count++;
		}
	});	
	
	if(count==0){
		alert('삭제할 글을 체크하세요');
		return false;
	}
});

//페이징처리
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	frmPage.submit();
}
//삭제 체크박스
function allChecked(bool){
	$('input[name=chk]').prop('checked', bool);
}