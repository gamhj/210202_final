<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>


<div class="container">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원 상세정보</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group">
					<label>회원번호</label> <input class="form-control" name='m_num'
						value='<c:out value="${member.m_num}" />' readonly="readonly">
				</div>
				<div class="form-group">
						<label>가입일</label> <input class="form-control" name='m_regdate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${member.m_regdate }" />'
							readonly="readonly">
					</div>
				<div class="form-group">
					<label>이메일ID</label> <input class="form-control" name='m_email'
						value='<c:out value="${member.m_email }" />' readonly="readonly">
				</div>


				<div class="form-group">
					<label>닉네임</label> <input class="form-control" name='m_ncnm'
						value='<c:out value="${member.m_ncnm }" />' readonly="readonly">
				</div>

				<div class="form-group">
					<label>연락처</label> <input class="form-control" name='m_contact'
						value='<c:out value="${member.m_contact }" />' readonly="readonly">
				</div>

				<div class="form-group">
					<label>가입유형</label> <input class="form-control" name='m_type'
						value='<c:out value="${member.m_type }" />' readonly="readonly">
				</div>

				<div class="form-group">
					<label>그린포인트</label> <input class="form-control" name='m_point'
						value='<c:out value="${member.m_point }" />' readonly="readonly">
				</div>
				
				<button data-oper='modifyAdmin' class="btn btn-default">Modify</button>
				<button data-oper='listAdmin' class="btn btn-info">List</button>

				<form id='operForm' action="/member/admin/modify" method="get">
					<input type='hidden' id='m_num' name='m_num'
						value='<c:out value="${member.m_num }"/>'>
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

			operForm.attr("action", "/member/admin/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#m_num").remove();
			operForm.attr("action", "/member/admin/list")
			operForm.submit();
		});
	});
</script>

<%@include file="../../includes/footer.jsp"%>

