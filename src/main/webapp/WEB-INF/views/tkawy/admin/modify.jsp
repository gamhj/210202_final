<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>

<body>
	<div class="container">

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">

					<div class="panel-heading">관리자전용 상세페이지</div>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<form role="form" action="/tkawy/admin/modifydone" method="post">
						
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
						<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
						<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
						<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
						
						
							<div class="form-group">
								<label>예약번호</label> <input class="form-control" name='t_bno'
									value='<c:out value="${tkawy.t_bno}" />' readonly="readonly">
							</div>
							<div class="form-group">
								<label>회원번호</label> <input class="form-control" name='m_num'
									value='<c:out value="${tkawy.m_num}" />' readonly="readonly">
							</div>
							<div class="form-group">
								<label>예약일자</label> <input class="form-control" name='t_regdate'
									value='<fmt:formatDate pattern="yyyy-MM-dd"
									value="${tkawy.t_regdate}" />'
									readonly="readonly">
							</div>
							<div class="form-group">
								<label>연락처</label> <input class="form-control" name='t_contact'
									value='<c:out value="${tkawy.t_contact}" />'
									readonly="readonly">
							</div>
							<div class="form-group">
								<label>일반플라스틱(병뚜껑 제외)</label> <input class="form-control"
									name='t_regdate' value='<c:out value="${tkawy.t_plastic}" /> ' readonly="readonly"> 개
							</div>
							<div class="form-group">
								<label>플라스틱뚜껑</label> <input class="form-control"
									name='t_plastic_cap'
									value='<c:out value="${tkawy.t_plastic_cap}" />' readonly="readonly"> 개
							</div>
							
							
							
							<div class="form-group">
								<label>수거예정업체</label> <input class="form-control"
									name='t_vstng_cmpny'
									value='<c:out value="${tkawy.t_vstng_cmpny}" />'
									readonly="readonly">
							</div>
							<div class="form-group">
								<label>수거예정일</label><input type="hidden">
								<fmt:parseDate var="t_date_vist" value="${tkawy.t_date_vist}"
									pattern="yyyy-MM-dd" />
								<input class="form-control" name='t_date_vist'
									value='<fmt:formatDate pattern="yyyy-MM-dd"
									value="${t_date_vist}" />'
									readonly="readonly">
							</div>

							<div class="form-group">
								<label>진행상태</label> <input class="form-control"
									name='t_progress' value='<c:out value="${tkawy.t_progress}" />'  readonly="readonly">
							</div>

							<button type="submit" data-oper='modifyDone' class="btn btn-default">수거완료</button>
							<button type="submit" data-oper='modifyCanceled' class="btn btn-default">수거취소</button>
							<button type="submit" data-oper='removeAdmin' class="btn btn-danger">Remove</button>
							<button type="submit" data-oper='listAdmin' class="btn btn-info">List</button>


						</form>


					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.row -->
	</div>

	<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");
 
		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			 if (operation === 'modifyCanceled') {
				formObj.attr("action", "/tkawy/admin/modifycanceled");
			} else if (operation === 'removeAdmin') {
				formObj.attr("action", "/tkawy/admin/remove");
			} else if (operation === 'listAdmin') {
				//move to list
				formObj.attr("action", "/tkawy/admin/list").attr("method","get");
 				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone(); 
				var keywordTag = $("input[name='keyword']").clone(); 
				var typeTag = $("input[name='type']").clone(); 
				
				formObj.empty();
				
 				formObj.append(pageNumTag);
				formObj.append(amountTag); 
				formObj.append(keywordTag); 
				formObj.append(typeTag); 
			}
			formObj.submit();

		});
	});
	</script>

	<%@include file="../../includes/footer.jsp"%>