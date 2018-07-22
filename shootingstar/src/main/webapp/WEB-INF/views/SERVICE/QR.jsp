<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
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
	
	/* 답변 */
	getCommentList();
	
 	$("#btn_sub").click(function(){
 		/* <c:if test="${empty sessionScope.userid}">
			alert('로그인이 필요한 서비스입니다.');
			if(confirm("로그인 화면으로 이동하시겠습니까?")){
				location.href="<c:url value='/login/login.do'/>";
			}
			return false;
		</c:if>
 		if($("#rememo").val() == ''){
			alert('댓글을 입력하세요');
			$("#rememo").focus();
			return false;
	}*/
		
		$.ajax({
	        type:'POST',
	        url:"<c:url value='/SERVICE/QRwrite.do'/>",
	        data:$("#commentForm").serialize(),
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	                $("#rememo").val("");
	            }
	        },
	        error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
		
 	});//click
		
	function getCommentList(){
		$.ajax({
			type:"get",
			url:"<c:url value='/SERVICE/QRlist.do'/>",
			dataType:"json",
			data: $("#commentForm").serialize(),
			success:function(data){
				var html = "";
	            var cCnt = data.length;
	            
	            if(data.length > 0){	                
	                for(i=0; i<data.length; i++){
	                    html += "<div class='ajxDiv2'>";
	                    html += "<div><table><h6><strong>" + data[i].id;
	                    html += "&nbsp;&nbsp;<span class='ajxSpn'>" + data[i].regdate;
	                    html += "&nbsp;&nbsp;<a href=#>답글</a>" + "</span></strong></h6>";
	                    html += data[i].content + "<tr><td></td></tr>";
	                    html += "</table></div>";
	                    html += "</div>";
	                }
	            } else {	                
	                html += "<div class='ajxDiv2'>";
	                html += "<div><table><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
	                html += "</table></div>";
	                html += "</div>";	                
	            }
	            
	            $("#cCnt").html(cCnt);	
	            $("#replyList").html(html);
				
				
				
				
					/* var div = $("<div>");
					div.attr("id", "replyItem" + res);
	                div.css({border: "1px solid gray", width: "600px", "padding": "5px", "margin-top": "5px", "margin-left": "0px", display:"inline-block"});
	                div.appendTo($("#replyList"));
					div.text($("#rememo").val() + "(이미지)" );
				
				if(res.length>0){
					var result="";
					$.each(res, function(idx, item){
						result+="<span>(이미지)</span>" + item.id + " " + item.regdate + "<br>";
						result+=item.content;
					});
					
					$("#replyList").append("<div>" + result + "</div>");
				} */
				
				/* var div = $("<div>");
				div.attr("id", "replyItem" + res);
                div.appendTo($("#replyList"));
                div.css({border: "1px solid gray", width: "600px", "padding": "5px", "margin-top": "5px", "margin-left": "0px", display:"inline-block"});
				//div.text($("#rewriter1").val() + " 방금" ); */
				
			},
			error:function(xhr, status, error){
				alert("error:"+error);
			}
		});
	}
});
	
</script>

<div class="container">
	<form name="commentForm" id="commentForm" method="post">
	<br><br>
		<div class="ajxDiv">
			<div>
				<span style="font-size:1.1em;"><strong>Comments</strong></span> <span id="cCnt"></span>
			</div>
			<div>
	            <table class="table">
	                <tr>
	                    <td>
	                        <textarea rows="3" cols="30" id="rememo" name="content" placeholder="댓글을 입력하세요"></textarea>
	                        <br>
	                        <div>
	                        	<input type="button" id="btn_sub" value="등록">
	                        </div>
	                    </td>
	                </tr>
	            </table>
	        </div>
	        <div id="replyList"></div>
	    </div>
	    <%-- <input type="hidden" name="id" value="${sessionScope.id}"> --%>
	    <input type="hidden" name="id" value="댓글용아이디"> <!-- 임시 아이디 -->
	    <input type="hidden" name="qNo" value="${vo.qNo}">
    </form>
</div>