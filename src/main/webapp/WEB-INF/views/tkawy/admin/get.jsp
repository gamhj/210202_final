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
								value='<c:out value="${tkawy.t_contact}" />' readonly="readonly">
						</div>
						<div class="form-group">
							<label>일반플라스틱(병뚜껑 제외)</label> <input class="form-control"
								name='t_regdate' value='<c:out value="${tkawy.t_plastic}" /> '
								readonly="readonly"> 개
						</div>
						<div class="form-group">
							<label>플라스틱뚜껑</label> <input class="form-control"
								name='t_plastic_cap'
								value='<c:out value="${tkawy.t_plastic_cap}" />'
								readonly="readonly"> 개
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
							<label>진행상태</label> <input class="form-control" name='t_progress'
								value='<c:out value="${tkawy.t_progress}" />'
								readonly="readonly">
						</div>

						<button data-oper='modifyAdmin' class="btn btn-default">Modify</button>
						<button data-oper='listAdmin' class="btn btn-info">List</button>

						<form id='operForm' action="/tkawy/admin/modify" method="get">
							<input type='hidden' id='t_bno' name='t_bno'
								value='<c:out value="${tkawy.t_bno }"/>'> <input
								type='hidden' name='pageNum'
								value='<c:out value="${cri.pageNum}"/>'> <input
								type='hidden' name='amount'
								value='<c:out value="${cri.amount}"/>'>

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

		var operForm = $("#operForm");

		$("button[data-oper='modifyAdmin']").on("click", function(e) {

			operForm.attr("action", "/tkawy/admin/modify").submit();

		});

		$("button[data-oper='listAdmin']").on("click", function(e) {

			operForm.find("#t_bno").remove();
			operForm.attr("action", "/tkawy/admin/list")
			operForm.submit();
		});
	});
</script>

	<%@include file="../../includes/footer.jsp"%>