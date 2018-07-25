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
        success: function(result){
            if (result !== "") {
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
	
	/* 댓글 */
	getCommentList();
	
	//댓글 등록
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
 	
});//ready
 	
 	//댓글 리스트
 	function getCommentList(){
		$.ajax({
			type:"post",
			url:"<c:url value='/SERVICE/QRlist.do'/>",
			dataType:"json",
			data: $("#commentForm").serialize(),
			success:function(data){
				var html = "";
	            var cCnt = data.length;
	            var code = $("input[name=code]").val();
	            
	            //$("<a>").attr("href", "#").text("수정").click(function (){fn_replyUpdate(result)}).appendTo(div);
	            
	            if(data.length > 0){
	                for(i=0; i<data.length; i++){	                	
	                    html += "<div class='ajxDiv2'>";
	                    html += "<div><table id='tb_" + data[i].qrNo + "'><h6><b>" + data[i].id;
	                    html += "&nbsp;&nbsp;<span class='ajxSpn'>" + data[i].regdate + "&nbsp;&nbsp;";
	                    html += "<a class='ajxBtn1' onclick=\"qrReply(" + data[i].qrNo + ", " + data[i].qNo + ")\">답글</a>&nbsp;&nbsp;";
	                    html += "<a class='ajxBtn2' onclick=\"qrUpdate(" + data[i].qrNo + ", " + data[i].qNo + ", \'" + data[i].content + "\')\">수정</a>&nbsp;&nbsp;";
	                    html += "<a class='ajxBtn3' onclick=\"qrDelete(" + data[i].qrNo + ", " + data[i].qNo + ")\">삭제</a>&nbsp;&nbsp;";
	                    html += "</span></b></h6>";
	                    html += "<div class='qrContent" + data[i].qrNo + data[i].qNo + "'>" + data[i].content + "</div>";
	                    html += "<tr><td></td></tr>";
	                    html += "</table></div>";
	                    html += "</div>";
	                }
	            } else {	                
	                html += "<div class='ajxDiv2'>";
	                html += "<div style='color:gray;'><table><h6>등록된 댓글이 없습니다.</h6>";
	                html += "</table></div>";
	                html += "</div>";
	            }
	            
	            $("#cCnt").html(cCnt);	
	            //$("#reTable").prepend(html);
	            $("#replyList").html(html);
	            
	            if(code == 1){
	            	$(".ajxBtn1").hide();
	            }
	            
	            
				
				
				
				
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
	}//댓글 리스트
	
	//댓글 수정 
 	function qrUpdate(qrNo, qNo, content){
		
		$(".ajxBtn2").click(function(){
	    	getCommentList();
	    });
		
		var a = "";
		
		a += "<div class='upGroup'>";
	    a += "<input type='text' class='upText' name='content_" + qrNo + qNo + "' value='" + content + "'/>";
	    a += "<span class='upSpan'><button class='upBtn' type='button' onclick=\"qrUpdateSub(" + qrNo + ", " + qNo + ")\">확인</button></span>";
	    a += '</div>';
	    
	    $('.qrContent'+qrNo+qNo).html(a);
	    $('#'+qrNo+qNo).html(a);
	    
	}
	
 	//댓글 수정 처리
	function qrUpdateSub(qrNo, qNo){
 		if(confirm("수정하시겠습니까?")){
	 		var updateContent = $('[name=content_' + qrNo + qNo + ']').val();
		    
		    $.ajax({
		        url : "<c:url value='/SERVICE/QRUpdate.do'/>",
		        type : 'post',
		        data : {'qrNo' : qrNo, 'qNo' : qNo, 'content' : updateContent},
		        success : function(data){
		            if(data == 1) getCommentList(); //댓글 수정 후 목록 출력
		        }
		    });
		    
 		}//if
	}//function
	
	//댓글 삭제 
	function qrDelete(qrNo){
		if(confirm("삭제하시겠습니까?")){
		    $.ajax({
		    	url : "<c:url value='/SERVICE/QRDelete.do?qrNo=" + qrNo + "'/>",
		        type : 'get',
		        success : function(data){
		            if(data == 1) getCommentList(); //댓글 삭제 후 목록 출력 
		        }
		    });			
		}//if
	}//function
	
	//대댓글 등록
 	function qrReply(qrNo, qNo){
		
 		$(".ajxBtn1").click(function(){
	    	getCommentList();
	    });
		
 		var a = "";
 		var html = "";
		
		a += "<table class='reGroup'><tr><td>";
		a += "<img id='subline' src='<c:url value='/images/subline.png'/>'>";
	    a += "<textarea class='reText' name='content_" + qrNo + "' placeholder='댓글을 입력하세요.'></textarea>";
	    a += "<button class='btn_sub2' type='button' onclick=\"qrReplySub(" + qrNo + ", " + qNo + ")\">등록</button></td>";
	    a += "</tr></div>";
	    
	    $("#tb_" + qrNo).find("td").html(a);
	    	    
	}
	
 	//대댓글 등록 처리
	function qrReplySub(qrNo, qNo){
 		var reContent = $('[name=content_' + qrNo + ']').val();
	    
	    $.ajax({
	        url : "<c:url value='/SERVICE/QRreply.do'/>",
	        type : 'post',
	        data : {'qrNo' : qrNo, 'qNo' : qNo, 'content' : reContent, 'id' : $('input[name=id]').val()},
	        success : function(data){
	            if(data == "success") {
	            	$("#tb_" + qrNo).find("td").html("");
	            	getCommentList(); //대댓글 등록 후 목록 출력
	            	qrReplyList(qrNo);
				}
			}
		});
	}
 	
 	//대댓글 목록
 	function qrReplyList(qrNo){ 		
 		$.ajax({
	        url : "<c:url value='/SERVICE/QRreplyList.do'/>",
	        type : 'post',
	        data : {'qrNo' : qrNo},
	        success : function(data){
	        	var html = "";
	        	
	            if(data.length > 0){
 	                for(i=0; i<data.length; i++){
 	                	html += "<img id='subline2' src='<c:url value='/images/subline.png'/>'>";
 	                	html += "<div class='ajxDiv3'>";
 	                    html += "<div><table id='tb_" + data[i].qrNo + "'><h6><b>" + data[i].id;
 	                    html += "&nbsp;&nbsp;<span class='ajxSpn'>" + data[i].regdate + "&nbsp;&nbsp;";
 	                    html += "<a class='ajxBtn2' onclick=\"qrUpdate(" + data[i].qrNo + ", " + data[i].qNo + ", \'" + data[i].content + "\')\">수정</a>&nbsp;&nbsp;";
 	                    html += "<a class='ajxBtn3' onclick=\"qrDelete(" + data[i].qrNo + ", " + data[i].qNo + ")\">삭제</a>&nbsp;&nbsp;";
 	                    html += "</span></b></h6>";
 	                    html += "<div class='qrContent" + data[i].qrNo + data[i].qNo + "'>" + data[i].content + "</div>";
 	                    html += "<tr><td></td></tr>";
 	                    html += "</table></div>";
 	                    html += "</div>";
 	                }    
 	            }
	            
	            $("#tb_" + qrNo).find("tr").after(html);
				
			}
		});
 	}

 	
 /* 	
 	//대댓글 등록
 	function qrReply(result){
		
 		$("#'" + result + "'").remove();
	    
	    //입력받는 창 등록
	     var replyEditor = 
	        '<tr id="reply_add" class="reply_reply">'+
	        '   <td width="870px">'+
	        '       <textarea name="reply_reply_content" rows="3" cols="50"></textarea>'+
	        '   </td>'+
	        '   <td>'+
	        '       <button name="reply_reply_save" id="'+result+'">등록</button>'+
	        '       <button name="reply_reply_cancel">취소</button>'+
	        '   </td>'+
	        '</tr>';
	        
		$("#'" + result + "'").html(replyEditor);
		
 	}
	 */

<%-- 	<%@ page language="java" contentType="text/html; charset=UTF-8"
 	    pageEncoding="UTF-8"%>
 	 
 	<script>
 	var bno = '${detail.bno}'; //게시글 번호
 	 
 	$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
 	    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
 	    commentInsert(insertData); //Insert 함수호출(아래)
 	});
 	 
--%> 	 
 	 
</script>

<div class="container">
	<form name="commentForm" id="commentForm" method="post">
	<br><br>
		<div class="ajxDiv">
			<div>
				<span style="font-size:1.1em;"><b>Comments</b></span>&nbsp;<span id="cCnt"></span>
			</div>
			<div>
	            <table class="table">
	                <tr>
	                    <td>
	                        <textarea rows="3" cols="30" id="rememo" name="content" placeholder="댓글을 입력하세요"></textarea>
	                        <br>
	                        <div style="text-align:right;">
	                        	<input type="button" class="btn_sub" id="btn_sub" value="등록">
	                        </div>
	                    </td>
	                </tr>
	            </table>
	        </div>
	        <div id="replyList"></div>
	    </div>
	    <%-- <input type="hidden" name="id" value="${sessionScope.id}"> --%>
	    <%-- <input type="hidden" name="code" value="${sessionScope.code}"> --%>
	    <input type="hidden" name="id" value="댓글용아이디"> <!-- 고객 임시 아이디 -->
	    <input type="hidden" name="code" value="3"> <!-- 임시 멤버 코드값 -->
	    <input type="hidden" name="qNo" value="${param.qNo}">
    </form>
</div>


