<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript">
/* $(document).ready(function(){
	$("#bt1").click(function(){
		//[{"no":1,"name":"홍길동","content":"안녕"},{"no":2,"name":"김길동","content":"안녕하세요"},{"no":3,"name":"이길동","content":"안녕!!!"}]
		$.ajax({
			url:"<c:url value='/SERVICE/QRlist.do'/>",
			type:"GET",
			dataType:"json",
			success:function(res){
				if(res.length>0){
					var result = "";
					$.each(res, function(idx,item){
						result+="번호:"+ item.qrNo;
						result+=" 이름:"+ item.qrName + "<br>";
						result+="내용:"+ item.qrContent;							
					});
					$('#div1').append(result);
				}
			},
			error:function(xhr,status,error){
				alert("error:"+error);
			}
		});
	});  //click
}); */


$(document).ready(function(){
	/* $('#btn_sub').click(function(){
		if ($.trim($("#rememo").val()) == "") {
	        alert("글 내용을 입력해주세요.");
	        $("#rememo").focus();
	        return false;
	    }
	    
		$("#form1").submit();
	    
	}); */
	    
/* 	    $.ajax({
        url: "<c:url value='/SERVICE/QRlist.do'/>",
        type:"post", 
        data: $("#commentForm").serialize(),
        success: function(list){
            if (list !== "") {
                var div = $("<div>");
                div.attr("id", "replyItem" + list);
                div.appendTo($("#replyList"));
                div.css({border: "1px solid gray", width: "600px", "padding": "5px", "margin-top": "5px", "margin-left": "0px", display:"inline-block"});
                //div.text($("#rewriter1").val() + " 방금" );
                
                $("<a>",{
                    text: "삭제",
                    href: "#",
                    click: function (){fn_replyDelete(result)}
                }).appendTo(div);
                
                $("<a>").attr("href", "#").text("수정").click(function (){fn_replyUpdate(result)}).appendTo(div);
                
                var href = $("<a>");
                href.attr("href", "#");
                href.text("댓글");
                href.click(function (){fn_replyReply(result)});
                href.appendTo(div);
                var reply=$("<div>").appendTo(div);
                reply.attr("id", "reply" + result);
                reply.html($("#rememo1").val());
                $("#rewriter1").val("");
                $("#rememo1").val("");
                alert("저장되었습니다.");
            } else{
                alert("서버에 오류가 있어서 저장되지 않았습니다.");
            }
        }
    });     

}); */
	
	
 	$("#btn_sub").click(function(){
 		$.ajax({
			type:"get",
			url:"<c:url value='/SERVICE/QRlist.do'/>",
			dataType:"json",
			success:function(res){
				var result="<p>(이미지)</p>" + res.id + "" + res.regdate + "" + "<span>댓글</span>";	
				result+=res.qrContent;
				
				$('#replyList').html(result);
			},
			error:function(xhr, status, error){
				alert("error:"+error);
			}
		});
 		
	});//click
});
	
/* 	$('#bt3').click(function(){			
		$.getJSON("<c:url value='/jsonTest/memoinfo.json'/>",
			function(res){
				if(res.length>0){
					var result="";
					$.each(res, function(idx, item){
						result+="no : "+ item.no+"<br>";
						result+="name : "+ item.name+"<br>";
						result+="content : "+ item.content+"<br><br>";
					});
					$('#div2').html(result);
				}
		});
	});
	
	$('#bt4').click(function(){
		$('#div2').load("<c:url value='/ajaxTest/search.do'/>");
	}); */

</script>





	
	
	
	
	
	
	
	
	
<%-- 

			/* 답변 */
			$('.spanButton input[type=button]').click(function(){
				<c:if test="${empty sessionScope.userid}">
					alert('로그인 먼저 해주세요');
					return false;
				</c:if>
				$(this).parent().parent().parent().next().toggle();
			});	
					
		});
		
		/* 답변 등록 */
		function recomment(thisForm){
			if(thisForm.reComment.value==''){
				alert('내용을 입력하세요');
				return false;
			}
			
			thisForm.submit();
		}
		/* 댓글 등록시 로그인, 내용입력 */
		function loginChk(){
			<c:if test="${empty sessionScope.userid}">
				alert('로그인 먼저 해주세요');
				return false;
			</c:if>
			if(commentFrm.comContent.value==''){
				alert('내용을 입력하세요');
				return false;
			}
		}
		
		function confirmDelete() {
			if(!confirm("삭제하시겠습니까?"))
				return false;
		}
		
		function del(){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}else{
				location.href="<c:url value='/sBoard/deleteBoard.do?sNo=${vo.sNo}&&fileName=${vo.fileName}'/>"
			}
		}
		 --%>

<%-- 		<!-- 댓글 목록-->
		<c:if test="${!empty commentList}">
			<table border="1" class="detailTable">
				<c:forEach var="commentVo" items="${commentList}">
					<tr>
						<td style="width: 150px; text-align: center">
							${commentVo.comUserid}<br>
							<div style="font-size: 0.6em; margin-top: 3px;"><fmt:formatDate value="${commentVo.comRegdate}" pattern="yyyy.MM.dd hh:mm"/></div>
						</td>
						<td style="width:530px;padding-left: 5px;">
							<c:if test="${commentVo.comLevel==1 }">
								-->
							</c:if>
							${commentVo.comContent }
						</td>
						<td style="width:100px; text-align: center">
							<span class="spanButton">
								<c:if test="${sessionScope.userid==commentVo.comUserid }">
									<a href="<c:url value='/SERVICE/QRdelete.do?qrNo=${commentVo.qrNo }&qNo=${vo.qNo}'/>"
										onclick="return confirmDelete()">삭제</a><br>
								</c:if>
								<c:if test="${commentVo.comLevel==0 }">
									<input type="button" name="reply" value="답변">
								</c:if>
							</span>
						</td>
					</tr>
					<tr class="reComment" style="display: none">
						<td colspan="3">
							<form name="reCommentfrm" method="post" action="<c:url value='/sBoard/sReComment.do'/>" onsubmit="return recomment(this)"
								style="margin-top: 2px">
								<input type="hidden" name="comParent" value="${commentVo.comNo }">
								<input type="hidden" name="comUserid" value="${sessionScope.userid }">
								<input type="hidden" name="sBoardNo" value="${vo.sNo }">
								<textarea name="reComment" style="width: 98%; height: 50px"></textarea>
								<br><input style="float:right" type="submit" value="등록">
							</form>
	                    </td>
                    </tr>
				</c:forEach>
			</table>
		</c:if><br>
		<form name="commentFrm" method="post" action="<c:url value='/sBoard/sInsertComment.do'/>"
				onsubmit="return loginChk()">
			<input type="hidden" name="comUserid" value="${sessionScope.userid }">
			<input type="hidden" name="sBoardNo" value="${vo.sNo }">
			<textarea name="comContent" style="width: 99%; height: 100px"></textarea>
			<br><input style="float:right" type="submit" value="등록">
		</form> --%>
		
<form name="commentForm" id="commentForm">
	<input type="text" id="rememo" placeholder="댓글을 입력하세요."/><input type="button" id="btn_sub" value="등록">
	<div id="replyList" style="border:1px solid black; width:1000px;height:50px;"></div>
</form>

		
<%@ include file="../inc/bottom.jsp" %>