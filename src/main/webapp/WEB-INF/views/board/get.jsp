<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
 
 		  <div class="form-group">
	          <label>번호</label>
	          <input class="form-control" name='q_bno'
	                 value='<c:out value="${board.q_bno }"/>' readonly="readonly">
          </div>

          <div class="form-group">
            <label>제목</label> 
            <input class="form-control" name='q_title'
                   value='<c:out value="${board.q_title }"/>' readonly="readonly">
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="3" name='q_content'
            		  readonly="readonly"><c:out value="${board.q_content}" /> </textarea>
          </div>

          <div class="form-group">
            <label>닉네임</label>
            <input class="form-control" name='q_ncnm'
					value='<c:out value="${board.q_ncnm }"/>' readonly="readonly">
          </div>
          
	      <button data-oper='modify' class="btn btn-default">Modify</button>
		  <button data-oper='list' class="btn btn-info">List</button>
		  
		  <form id='operForm' action="/board/modify" method="get">
		    <input type='hidden' id='q_bno' name='q_bno' value='<c:out value="${board.q_bno}"/>'>
		    <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
            <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
		  </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<!-- 572p 첨부파일  -->
<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>

<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>


<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Files</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        
        <div class='uploadResult'> 
          <ul>
          </ul>
        </div>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<!-- 573p 첨부파일 end -->


<!-- reply 시작                    -->
<div class='row'>

  <div class="col-lg-12">
  
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
      </div>      
    
      
      <!-- /.panel-heading -->
      <div class="panel-body">        
      
        <ul class="chat">
        	<!-- Start reply -->
        	<li class="left clearfix" data-ron='12'>
        		<div>
        			<div class="header">
        				<strong class="primary-font">user00</strong>
        				<small class="pull-right text-muted">2018-01-01 13:13</small>
        			</div>
        			<p>Good job!</p>
        		</div>
        	</li>
        	<!-- End reply -->

        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->

		<div class="panel-footer"></div>


		</div>
  </div>
  <!-- ./ end row -->
<!-- reply 끝                    -->

<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='qr_reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='qr_replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='qr_replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>
	<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-q_content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>

$(document).ready(function () {
  
  var q_bnoValue = '<c:out value="${board.q_bno}"/>';
  var qr_replyUL = $(".chat");
  
    showList(1);
    
	function showList(page){
	
	  console.log("show list " + page);
        
    replyService.getList({q_bno:q_bnoValue, page: page|| 1 }, function(q_replyCnt, list) {
    console.log("replyCnt: "+ q_replyCnt );
    console.log("list: " + list);
    console.log(list);
    
    if(page == -1){
      pageNum = Math.ceil(q_replyCnt/10.0);
      showList(pageNum);
      return;
    } 
      
     var str="";
     
     if(list == null || list.length == 0){
    	 qr_replyUL.html("");
       return;
     }
     
   
     
     for (var i = 0, len = list.length || 0; i < len; i++) {
         str +="<li class='left clearfix' data-qr_rno='"+list[i].qr_rno+"'>";
         str +="  <div><div class='header'><strong class='primary-font'>["
      	   +list[i].qr_rno+"] "+list[i].qr_replyer+"</strong>"; 
         str +="    <small class='pull-right text-muted'>"
             +replyService.displayTime(list[i].replyDate)+"</small></div>";
         str +="    <p>"+list[i].qr_reply+"</p></div></li>";
       } 
     
     qr_replyUL.html(str);
     
     showqReplyPage(q_replyCnt);

 
   });//end function
     
 }//end showList
 
//paging --------------------------
var pageNum = 1;
   var replyPageFooter = $(".panel-footer");
   
   function showReplyPage(q_replyCnt){
     
     var endNum = Math.ceil(pageNum / 10.0) * 10;  
     var startNum = endNum - 9; 
     
     var prev = startNum != 1;
     var next = false;
     
     if(endNum * 10 >= q_replyCnt){
       endNum = Math.ceil(q_replyCnt/10.0);
     }
     
     if(endNum * 10 < q_replyCnt){
       next = true;
     }
     
     var str = "<ul class='pagination pull-right'>";
     
     if(prev){
       str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
     }
     
     for(var i = startNum ; i <= endNum; i++){
       
       var active = pageNum == i? "active":"";
       
       str+= "<li class='page-item "+ active +" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
     }
     
     if(next){
       str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
     }
     
     str += "</ul></div>";
     
     console.log(str);
     
     replyPageFooter.html(str);
    }
  //paging - end-------------------------
  
  //페이지 번호 클릭 이벤트
  replyPageFooter.on("click","li a", function(e){
       e.preventDefault();
       console.log("page click");
       
       var targetPageNum = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPageNum);
       
       pageNum = targetPageNum;
       
       showList(pageNum);
     }); 
  
 
// modal window --------------------------------
var modal = $(".modal");
   var modalInputqr_Reply = modal.find("input[name='qr_reply']"); 
   var modalInputqr_Replyer = modal.find("input[name='qr_replyer']");
   var modalInputReplyDate = modal.find("input[name='replyDate']");
   
   var modalModBtn = $("#modalModBtn");
   var modalRemoveBtn = $("#modalRemoveBtn");
   var modalRegisterBtn = $("#modalRegisterBtn");
   
   
   $("#addReplyBtn").on("click", function(e){
     
     modal.find("input").val("");
     modalInputReplyDate.closest("div").hide();
     modal.find("button[id !='modalCloseBtn']").hide();
     
     modalRegisterBtn.show();
     
     $(".modal").modal("show");
     
   });
   
   modalRegisterBtn.on("click",function(e){
       
       var qr_reply = {
             qr_reply : modalInputqr_Reply.val(),
             qr_replyer : modalInputqr_Replyer.val(),
             q_bno:q_bnoValue
           };
       replyService.add(qr_reply, function(result){
         
         alert(result);
         
         modal.find("input").val("");
         modal.modal("hide");
         
         showList(-1);
         
       }); 
       
     });
   
 
	$(".chat").on("click", "li", function(e){
        
	    var qr_rno = $(this).data("qr_rno");
	    
	    replyService.get(qr_rno, function(qr_reply){
	    
	      modalInputqr_Reply.val(qr_reply.qr_reply);
	      modalInputqr_Replyer.val(qr_reply.qr_replyer);
	      modalInputReplyDate.val(replyService.displayTime( qr_reply.replyDate))
	      .attr("readonly","readonly");
	      modal.data("qr_rno", qr_reply.qr_rno);
	      
	      modal.find("button[id !='modalCloseBtn']").hide();
	      modalModBtn.show();
	      modalRemoveBtn.show();
	      
	      $(".modal").modal("show");
	          
	    });
	  });
   
	modalModBtn.on("click", function(e){
        
        var qr_reply = {qr_rno:modal.data("qr_rno"), qr_reply: modalInputqr_Reply.val()};
        
        replyService.update(qr_reply, function(result){
              
          alert(result);
          modal.modal("hide");
          showList(pageNum);
          
        });
        
      });
    
    
    modalRemoveBtn.on("click", function (e){
  	  
    	  var qr_rno = modal.data("qr_rno");
    	  
    	  replyService.remove(qr_rno, function(result){
    	        
    	      alert(result);
    	      modal.modal("hide");
    	      showList(pageNum);
    	      
    	  });
    	  
    	});
   
 
});
 </script>

<!-- testing-------------------------------  -->
<script type="text/javascript">
/* $(document).ready(function(){
	
	console.log(replyService);
	
}); */

/* console.log("====================");
console.log("JS TEst");

var bnoValue = '<c:out value="${board.q_bno}"/>'; */

/* replyService.add(
		{reply:"JS TEST", replyer:"tester", q_bno:bnoValue},
		function(result){
			alert("RESULT:  " + result);
		}
); */

/* replyService.getList({q_bno:bnoValue, page:1}, function(list){
	
	for(var i=0, len = list.length || 0; i < len; i++){
		console.log(list[i]);	
	}	
}); */

/* replyService.remove(11, function(count){
	console.log(count);
	if (count === "success") {
		alert("REMOVED");
	}
}, function(err){
	alert('ERROR...');
}); */

/* replyService.update({rno:15, q_bno:bnoValue, reply:"Modified Reply....."},
		function(result){alert("수정 완료...");
}); */

/* replyService.get(15, function(data){
	console.log(data);
}); */

</script>


<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#q_bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script>

<!-- 570p 첨부파일 -->
<script>

$(document).ready(function(){
  
  (function(){
  
    var q_bno = '<c:out value="${board.q_bno}"/>';
    
    $.getJSON("/board/getAttachList", {q_bno: q_bno}, function(arr){
    
      console.log(arr);
      
      //574p
      var str = "";
       
       $(arr).each(function(i, attach){
       
         //image type
         if(attach.fileType){
           var fileCallPath =  encodeURIComponent( attach.qa_upload_path+ "/s_"+attach.qa_uuid +"_"+attach.qa_file_name);
           
           str += "<li data-path='"+attach.qa_upload_path+"' data-uuid='"+attach.qa_uuid+"' data-filename='"+attach.qa_file_name+"' data-type='"+attach.qa_file_type+"' ><div>";
           str += "<img src='/display?fileName="+fileCallPath+"'>";
           str += "</div>";
           str +"</li>";
         }else{
             
           str += "<li data-path='"+attach.qa_upload_path+"' data-uuid='"+attach.qa_uuid+"' data-filename='"+attach.qa_file_name+"' data-type='"+attach.qa_file_type+"' ><div>";
           str += "<span> "+ attach.qa_file_name+"</span><br/>";
           str += "<img src='/resources/img/attach.png'></a>";
           str += "</div>";
           str +"</li>";
         }
       });
       
       $(".uploadResult ul").html(str);     
      //574p end
      
    }); //end getjson
    
  })();//end function
  
  //575p 첨부파일 클릭 이벤트 처리
  $(".uploadResult").on("click","li", function(e){
      
    console.log("view image");
    
    var liObj = $(this);
    
    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("qa_uuid")+"_" + liObj.data("qa_file_name"));
    
    if(liObj.data("type")){
      showImage(path.replace(new RegExp(/\\/g),"/"));
    }else {
      //download 
      self.location ="/download?fileName="+path
    }   
    
  });  
  
  function showImage(fileCallPath){
	    
	    //alert(fileCallPath);
    
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture")
	    .html("<img src='/display?qa_file_name="+fileCallPath+"' >")
	    .animate({width:'100%', height: '100%'}, 1000);	    
	  }
  // 578p end
  
  //577p 원본 이미지 창 닫기  
  $(".bigPictureWrapper").on("click", function(e){
	    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	    setTimeout(function(){
	      $('.bigPictureWrapper').hide();
	    }, 1000);
	  });
  //577p end
  
}); // $(document).ready(function()
</script>

<%@include file="../includes/footer.jsp"%>
