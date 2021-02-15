<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>

<body>
	<div class="container">
		<h2>회원 관리(관리자페이지)</h2>
		<br>
		<div class="position-relative row">
			<div class="col-lg-10">
				<table class="table table-striped table-hover">
					<thead class="table-dark">
						<tr>
							<th>회원번호</th>
							<th>가입일</th>
							<th>이메일ID</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>연락처</th>
							<th>가입유형</th>
							<th>그린포인트</th>
						</tr>
					</thead>




					<c:forEach items="${listAdmin}" var="member">
						<tr>
							<td><a href='/member/admin/get?m_num=<c:out value="${member.m_num}" />'><c:out value="${member.m_num}" /></a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${member.m_regdate}" /></td>
							<td><c:out value="${member.m_email}" /></td>
							<td><c:out value="${member.m_name}" /></td>
							<td><c:out value="${member.m_ncnm}" /></td>
							<td><c:out value="${member.m_contact}" /></td>
							<td><c:out value="${member.m_type}" /></td>
							<td><c:out value="${member.m_point}" /></td>
						</tr>
					</c:forEach>

				</table>



				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->


			</div>
		</div>
	</div>


	<script type="text/javascript">
               $(document).ready(function() {
                  var result = '<c:out value="${result}"/>';
                  
                  checkModal(result);
                  
                  history.replaceState({}, null, null);
                  
                  function checkModal(result) {
                     if(result === '' || history.state) {
                        return;
                     }
                     if (parseInt(result) > 0) {
                        $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
                     }
                     
                     $("#myModal").modal("show");
                  }
                  
               });
            </script>

<%@include file="../../includes/footer.jsp"%>