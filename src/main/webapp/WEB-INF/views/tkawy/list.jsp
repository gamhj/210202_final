<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<body>
	<div class="container">
		<h2>플라스틱 방앗간 수거 예약 내역(회원 페이지)-자기꺼만 보여줘야댐</h2>
		<br>
		<div class="position-relative row">
			<div class="col-lg-10">
				<table class="table table-striped table-hover">
					<thead class="table-dark">
						<tr>
							<th>예약번호</th>
							<th>예약일자</th>
							<th>연락처</th>
							<th>플라스틱</th>
							<th>플라스틱뚜껑</th>
							<th>수거예정업체</th>
							<th>수거예정일</th>
							<th>진행상태</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="tkawy">
						<tr>
							<td><c:out value="${tkawy.t_bno}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${tkawy.t_regdate}" /></td>
							<td><c:out value="${tkawy.t_contact}" /></td>
							<td><c:out value="${tkawy.t_plastic} 개" /></td>
							<td><c:out value="${tkawy.t_plastic_cap} 개" /></td>
							<td><c:out value="${tkawy.t_vstng_cmpny}" /></td>
							<td><input type="hidden">
							<fmt:parseDate var="t_date_vist" value="${tkawy.t_date_vist}"
									pattern="yyyy-MM-dd" /></input> <fmt:formatDate pattern="yyyy-MM-dd"
									value="${t_date_vist}" /></td>
							<td><c:out value="${tkawy.t_progress}" /></td>

						</tr>
					</c:forEach>

				</table>


				<div class='pull-right'>
					<ul class="list-group">

						<c:if test="#{pageMaker.prev}">
							<li class="list-group-item"><a href="#">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage} ">
							<li class="list-group-item"><a href="#">${num}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="list-group-item"><a href="#">Next</a></li>
						</c:if>
					</ul>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			var result = '<c:out value="${result}"/>';
		});
	</script>

	<%@include file="../includes/footer.jsp"%>