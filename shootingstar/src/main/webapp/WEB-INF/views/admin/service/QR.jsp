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
	        url:"<c:url value='/serviceA/QRwrite.do'/>",
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
		            location.href = "<c:url value='/admin/login/login.do'/>";
	            }else if(request.status==400){
	            	alert("관리자 외에 접근할 수 없습니다.");
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
			url:"<c:url value='/serviceA/QRlist.do'/>",
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
		                    html += "<span class='qrReply_" + data[i].qrNo + "'>";
		                    html += "<a class='ajxBtn1' onclick=\"qrReply(" + data[i].qrNo + ", " + data[i].qNo + ")\">답글</a></span>&nbsp;&nbsp;";
		                    html += "<a class='ajxBtn2' onclick=\"qrUpdate(" + data[i].qrNo + ", " + data[i].qNo + ", \'" + data[i].content + "\')\">수정</a>&nbsp;&nbsp;";
		                    html += "<a class='ajxBtn3' onclick=\"qrDelete(" + data[i].qrNo + ", " + data[i].qNo + ")\">삭제</a>&nbsp;&nbsp;";
		                    html += "</span></b></h6>";
		                    html += "<div class='qrContent" + data[i].qrNo + data[i].qNo + "'>" + data[i].content + "</div>";
		                    html += "<tr><td></td></tr>";
		                    html += "<tr><td class='chiltd_" + data[i].qrNo + "'></td></tr>";
		                    html += "</table></div>";
		                    html += "</div>";
		                    html += "<input type='hidden' class='hidden' id='id_" + data[i].qrNo + "' value='" + data[i].qrNo + "'>";
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
		        url : "<c:url value='/serviceA/QRUpdate.do'/>",
		        type : 'post',
		        data : {'qrNo' : qrNo, 'qNo' : qNo, 'content' : updateContent},
		        success : function(data){
		            if(data == 1) getCommentList(); //댓글 수정 후 목록 출력
		        },
		        error:function(request,status,error){
		            if(request.status==500){
			            alert('로그인이 필요한 서비스입니다.');
			            location.href = "<c:url value='/admin/login/login.do'/>";
		            }else if(request.status==400){
		            	alert("관리자 외에 접근할 수 없습니다.");
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
		    	url : "<c:url value='/serviceA/QRDelete.do?qrNo=" + qrNo + "'/>",
		        type : 'get',
		        success : function(data){
		            if(data == 1) getCommentList(); //댓글 삭제 후 목록 출력 
		        },
		        error:function(request,status,error){
		            if(request.status==500){
			            alert('로그인이 필요한 서비스입니다.');
			            location.href = "<c:url value='/admin/login/login.do'/>";
		            }else if(request.status==400){
		            	alert("관리자 외에 접근할 수 없습니다.");
		            }else{
		            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            }
		       }
		    });			
		}//if
	}//function
	
	//대댓글 등록
 	function qrReply(qrNo, qNo){		
		var a = "";
		
		a += "<table class='reGroup'><tr><td>";
		a += "<img id='subline' src='<c:url value='/images/subline.png'/>'>";
	    a += "<textarea class='reText' name='content_" + qrNo + "' placeholder='댓글을 입력하세요.'></textarea>";
	    a += "<button class='btn_sub2' type='button' onclick=\"qrReplySub(" + qrNo + ", " + qNo + ")\">등록</button></td>";
	    a += "</tr></table>";
	    
	    $(".chiltd_" + qrNo).html(a);
	    
	    var html = "<a class='reCancel' onclick=\"reCancel(" + qrNo + ", " + qNo + ")\">답글취소</a>";
	    
	    $(".qrReply_" + qrNo).html(html);
	    	    
	}
	
 	//대댓글 등록 처리
	function qrReplySub(qrNo, qNo){
 		var reContent = $('[name=content_' + qrNo + ']').val();
	    
	    $.ajax({
	        url : "<c:url value='/serviceA/QRreply.do'/>",
	        type : 'post',
	        data : {'qrNo' : qrNo, 'qNo' : qNo, 'content' : reContent, 'id' : $('input[name=id]').val()},
	        success : function(data){
	            if(data == "success") {
	            	$("#tb_" + qrNo + " tr:last").find("td").html("");
	            	getCommentList(); //대댓글 등록 후 목록 출력
				}
			},
			error:function(request,status,error){
	            if(request.status==500){
		            alert('로그인이 필요한 서비스입니다.');
		            location.href = "<c:url value='/admin/login/login.do'/>";
	            }else if(request.status==400){
	            	alert("관리자 외에 접근할 수 없습니다.");
	            }else{
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	       }
		});
	}
 	
 	//대댓글 취소
 	function reCancel(qrNo, qNo){
 		var html = "<a class='ajxBtn1' onclick=\"qrReply(" + qrNo + ", " + qNo + ")\">답글</a></span>";
	    
	    $(".qrReply_" + qrNo).html(html);
	    $(".chiltd_" + qrNo).html("");
 	}
  	
 	//대댓글 목록
 	function qrReplyList(){ 		
 		$.ajax({
	        url : "<c:url value='/serviceA/QRreplyList.do'/>",
	        type : 'get',
	        success : function(data){
	        	
	            if(data.length > 0){
 	                for(i=0; i<data.length; i++){
	        			var reply = "";
                		reply += "<img id='subline2' src='<c:url value='/images/subline.png'/>'>";
 	               		reply += "<div class='ajxDiv3'>";
 	               		reply += "<div><table id='tbr_" + data[i].qrNo + "'><h6><b>" + data[i].id;
 	               		reply += "&nbsp;&nbsp;<span class='ajxSpn'>" + data[i].regdate + "&nbsp;&nbsp;";
 	               		reply += "<a class='ajxBtn2' onclick=\"qrUpdate(" + data[i].qrNo + ", " + data[i].qNo + ", \'" + data[i].content + "\')\">수정</a>&nbsp;&nbsp;";
 	               		reply += "<a class='ajxBtn3' onclick=\"qrDelete(" + data[i].qrNo + ", " + data[i].qNo + ")\">삭제</a>&nbsp;&nbsp;";
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
    	<input type="hidden" id="id" name="id" value="${sessionScope.adminId}">
    	<input type="hidden" id="code" name="code" value="${sessionScope.adminCode}">
    </form>
</div>