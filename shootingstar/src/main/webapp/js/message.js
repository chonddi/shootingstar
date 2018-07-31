
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