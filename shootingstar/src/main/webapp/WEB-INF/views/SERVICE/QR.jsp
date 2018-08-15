<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* 댓글 리스트 */
	getCommentList();
	
	//댓글 등록
 	$("#btn_sub").click(function(){
 		if($("#rememo").val() == ''){
			alert('댓글을 입력하세요');
			$("#rememo").focus();
			return false;
	}
		
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
	            if(request.status==500){
		            alert('로그인이 필요한 서비스입니다.');
		            location.href = "<c:url value='/login/login.do'/>";
	            }else if(request.status==400){
	            	alert("고객 회원만 이용가능한 서비스입니다.");
	            }else{
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
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
				var reply = "";
	            var cCnt = data.length;
	            var code = $("input[name=code]").val();
	            
	            if(data.length > 0){
	                for(i=0; i<data.length; i++){
	                	if(data[i].levels == 0){
		                    html += "<div class='ajxDiv2'>";
		                    html += "<div><table id='tb_" + data[i].qrNo + "'><h6><b>" + data[i].id;
		                    html += "&nbsp;&nbsp;<span class='ajxSpn'>" + data[i].regdate + "&nbsp;&nbsp;";
		                    html += "<a class='ajxBtn1' onclick=\"qrReply(" + data[i].qrNo + ", " + data[i].qNo + ")\">답글</a>&nbsp;&nbsp;";
		                    if(data[i].id == $("#id").val()){
		                    html += "<a class='ajxBtn2' onclick=\"qrUpdate(" + data[i].qrNo + ", " + data[i].qNo + ", \'" + data[i].content + "\')\">수정</a>&nbsp;&nbsp;";
		                    html += "<a class='ajxBtn3' onclick=\"qrDelete(" + data[i].qrNo + ", " + data[i].qNo + ")\">삭제</a>&nbsp;&nbsp;";
		                    }
		                    html += "</span></b></h6>";
		                    html += "<div class='qrContent" + data[i].qrNo + data[i].qNo + "'>" + data[i].content + "</div>";
		                    html += "<tr><td></td></tr>";
		                    html += "<tr><td></td></tr>";
		                    html += "</table></div>";
		                    html += "</div>";
	                	}
	                }
	                
	            } else {	                
	                html += "<div class='ajxDiv2'>";
	                html += "<div style='color:gray;'><table><h6>등록된 댓글이 없습니다.</h6>";
	                html += "</table></div>";
	                html += "</div>";
	            }
	            
	            $("#cCnt").html(cCnt);	
	            $("#replyList").html(html);
	            qrReplyList();	//대댓글 리스트 호출
	            	            
	            if(code != 0){
	            	$(".ajxBtn1").hide();
	            }
			
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
	    a += "<span class='upSpan'><button class='upBtn' type='button' onclick=\"qrUpdateSub(" + qrNo + ", " + qNo + ")\">확인</button></span>";
	    a += "<span class='upSpan'><button class='upBtn' type='button' onclick=\"updateCancel(" + qrNo + ", " + qNo + ", \'" + content + "\')\">취소</button></span>";
	    a += '</div>';
	    
	    $('.qrContent'+qrNo+qNo).html(a);
	    
	}
	
 	//댓글 수정 처리
	function qrUpdateSub(qrNo, qNo){
 		if(confirm("수정하시겠습니까?")){
 			if($("input[name=content_" + qrNo + qNo + "]").val() == ''){
 				alert('댓글을 입력하세요');
 				$("input[name=content_" + qrNo + qNo + "]").focus();
 				return false;
 			}
 			
	 		var updateContent = $('[name=content_' + qrNo + qNo + ']').val();
		    
		    $.ajax({
		        url : "<c:url value='/SERVICE/QRUpdate.do'/>",
		        type : 'post',
		        data : {'qrNo' : qrNo, 'qNo' : qNo, 'content' : updateContent},
		        success : function(data){
		            if(data == 1) getCommentList(); //댓글 수정 후 목록 출력
		        },
		        error:function(request,status,error){
		            if(request.status==500){
			            alert('로그인이 필요한 서비스입니다.');
			            location.href = "<c:url value='/login/login.do'/>";
		            }else if(request.status==400){
		            	alert("고객 회원만 이용가능한 서비스입니다.");
		            }else{
		            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            }
		       }
		    });
		    
 		}//if
	}//function
	
	//댓글 수정 취소
	function updateCancel(qrNo, qNo, content){
		var a = "<div class='qrContent" + qrNo + qNo + "'>" + content + "</div>";
	    
	    $('.qrContent'+qrNo+qNo).html(a);
	}
	
	//댓글 삭제 
	function qrDelete(qrNo){
		if(confirm("삭제하시겠습니까?")){
		    $.ajax({
		    	url : "<c:url value='/SERVICE/QRDelete.do?qrNo=" + qrNo + "'/>",
		        type : 'get',
		        success : function(data){
		            if(data == 1) getCommentList(); //댓글 삭제 후 목록 출력 
		        },
		        error:function(request,status,error){
		            if(request.status==500){
			            alert('로그인이 필요한 서비스입니다.');
			            location.href = "<c:url value='/login/login.do'/>";
		            }else if(request.status==400){
		            	alert("고객 회원만 이용가능한 서비스입니다.");
		            }else{
		            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            }
		       }
		    });			
		}//if
	}//function
	
 	//대댓글 목록
 	function qrReplyList(){ 		
 		$.ajax({
	        url : "<c:url value='/SERVICE/QRreplyList.do'/>",
	        type : 'get',
	        success : function(data){
	        	
	            if(data.length > 0){
 	                for(i=0; i<data.length; i++){
	        			var reply = "";
                		reply += "<img id='subline2' src='<c:url value='/images/subline.png'/>'>";
 	               		reply += "<div class='ajxDiv3'>";
 	               		reply += "<div><table id='tbr_" + data[i].qrNo + "'><h6><b>" + data[i].id;
 	               		reply += "&nbsp;&nbsp;<span class='ajxSpn'>" + data[i].regdate + "&nbsp;&nbsp;";
 	               		reply += "</span></b></h6>";
 	               		reply += "<div class='qrContent" + data[i].qrNo + data[i].qNo + "'>" + data[i].content + "</div>";
 	               		reply += "<tr><td></td></tr>";
 	               		reply += "<tr><td></td></tr>";
 	               		reply += "</table></div>";
 	               		reply += "</div>";
 	               		
          				$("#tb_" + data[i].parent + " tr:first").children("td").append(reply);
 	                }//for
 	            }//if
			}
		});
 	}//대댓글 목록
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
	    <input type="hidden" name="qNo" value="${param.qNo}">
    	<input type="hidden" id="id" name="id" value="${sessionScope.userid}">
    	<input type="hidden" id="code" name="code" value="${sessionScope.userCode}">
    </form>
</div>