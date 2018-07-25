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
	            
	            //$("<a>").attr("href", "#").text("수정").click(function (){fn_replyUpdate(result)}).appendTo(div);
	            
	            if(data.length > 0){	                
	                for(i=0; i<data.length; i++){	                	
	                    html += "<div class='ajxDiv2'>";
	                    html += "<div><table id='" + data[i].qrNo + "'><h6><b>" + data[i].id;
	                    html += "&nbsp;&nbsp;<span class='ajxSpn'>" + data[i].regdate + "&nbsp;&nbsp;";
	                    html += "<a onclick=\"qrReply(" + data[i].qrNo + ", " + data[i].qNo + ")\">답글</a>&nbsp;&nbsp;";
	                    html += "<a onclick=\"qrUpdate(" + data[i].qrNo + ", " + data[i].qNo + ", \'" + data[i].content + "\')\">수정</a>&nbsp;&nbsp;";
	                    html += "<a onclick=\"qrDelete(" + data[i].qrNo + ", " + data[i].qNo + ")\">삭제</a>&nbsp;&nbsp;";
	                    html += "</span></b></h6>";
	                    html += "<tr><td></td></tr>";
	                    html += "<div class='qrContent" + data[i].qrNo + data[i].qNo + "'>" + data[i].content + "</div>";
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
		
		var a = "";
	    
	    a += "<div class='upGroup'>";
	    a += "<input type='text' class='upText' name='content_" + qrNo + qNo + "' value='" + content + "'/>";
	    a += "<button class='upBtn' type='button' onclick=\"qrUpdateSub(" + qrNo + ", " + qNo + ")\">수정</button>";
	    a += '</div>';
	    
	    $('.qrContent'+qrNo+qNo).html(a);
	    
	}
	
 	//댓글 수정
	function qrUpdateSub(qrNo, qNo){
 		if(confirm("수정하시겠습니까?")){
	 		var updateContent = $('[name=content_' + qrNo + qNo + ']').val();
		    
		    $.ajax({
		        url : "<c:url value='/SERVICE/QRUpdate.do'/>",
		        type : 'post',
		        data : {'qrNo' : qrNo, 'qNo' : qNo, 'content' : updateContent},
		        success : function(data){
		            if(data == 1) getCommentList(); //댓글 수정후 목록 출력
		        }
		    });
		    
 		}//if
	}//function
	
 	

/* 	 
	//댓글 삭제 
	function commentDelete(cno){
	    $.ajax({
	        url : '/comment/delete/'+cno,
	        type : 'post',
	        success : function(data){
	            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
	        }
	    });
	}

 	 */
 	
 	
/*  	
 	//대댓글 등록
 	function fn_replyReply(result){
		
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
/*  		
 		$.ajax({
	        type:'POST',
	        url:"<c:url value='/SERVICE/QRreply.do'/>",
	        data:$("#commentForm2").serialize(),
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
 	 
 	 
 	 
 	//댓글 목록 
 	function commentList(){
 	    $.ajax({
 	        url : '/comment/list',
 	        type : 'get',
 	        data : {'bno':bno},
 	        success : function(data){
 	            var a =''; 
 	            $.each(data, function(key, value){ 
 	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
 	                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
 	                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
 	                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
 	                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
 	                a += '</div></div>';
 	            });
 	            
 	            $(".commentList").html(a);
 	        }
 	    });
 	}
 	 
 	//댓글 등록
 	function commentInsert(insertData){
 	    $.ajax({
 	        url : '/comment/insert',
 	        type : 'post',
 	        data : insertData,
 	        success : function(data){
 	            if(data == 1) {
 	                commentList(); //댓글 작성 후 댓글 목록 reload
 	                $('[name=content]').val('');
 	            }
 	        }
 	    });
 	}
 	 
 	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
 	function commentUpdate(cno, content){
 	    var a ='';
 	    
 	    a += '<div class="input-group">';
 	    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
 	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
 	    a += '</div>';
 	    
 	    $('.commentContent'+cno).html(a);
 	    
 	}
 	 
 	//댓글 수정
 	function commentUpdateProc(cno){
 	    var updateContent = $('[name=content_'+cno+']').val();
 	    
 	    $.ajax({
 	        url : '/comment/update',
 	        type : 'post',
 	        data : {'content' : updateContent, 'cno' : cno},
 	        success : function(data){
 	            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
 	        }
 	    });
 	}
 	 
 	//댓글 삭제 
 	function commentDelete(cno){
 	    $.ajax({
 	        url : '/comment/delete/'+cno,
 	        type : 'post',
 	        success : function(data){
 	            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
 	        }
 	    });
 	}
 	 
 	 
 	 
 	 
 	$(document).ready(function(){
 	    commentList(); //페이지 로딩시 댓글 목록 출력 
 	});
 	 
 	 
 	 
 	</script> sadl;kjfasdfjkasdlfjl--%>
	
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
	    <input type="hidden" name="qNo" value="${param.qNo}">
    </form>
</div>


