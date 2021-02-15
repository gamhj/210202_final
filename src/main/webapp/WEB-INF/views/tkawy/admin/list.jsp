<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>

<body>
	<div class="container">
		<h2>플라스틱 방앗간 수거 예약 관리(관리자페이지)-페이징, 검색기능 필요</h2>
		<br>
		
		<div class="position-relative row">
			<div class="col-lg-10">
				<table class="table table-striped table-hover">
					<thead class="table-dark">
						<tr>
							<th>예약번호</th>
							<th>회원번호</th>
							<th>예약일자</th>
							<th>연락처</th>
							<th>플라스틱</th>
							<th>플라스틱뚜껑</th>
							<th>수거예정업체</th>
							<th>수거예정일</th>
							<th>진행상태</th>
						</tr>
					</thead>

					<c:forEach items="${listAdmin}" var="tkawy">
						<tr>
							<td><a class='move' href='<c:out value="${tkawy.t_bno}"/>'><c:out
										value="${tkawy.t_bno}" /></a></td>
							<td><c:out value="${tkawy.m_num}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${tkawy.t_regdate}" /></td>
							<td><c:out value="${tkawy.t_contact}" /></td>
							<td><c:out value="${tkawy.t_plastic} 개" /></td>
							<td><c:out value="${tkawy.t_plastic_cap} 개" /></td>
							<td><c:out value="${tkawy.t_vstng_cmpny}" /></td>
							<td><input type="hidden"> <fmt:parseDate
									var="t_date_vist" value="${tkawy.t_date_vist}"
									pattern="yyyy-MM-dd" /> <fmt:formatDate pattern="yyyy-MM-dd"
									value="${t_date_vist}" /></td>
							<td><c:out value="${tkawy.t_progress}" /></td>

						</tr>
					</c:forEach>

				</table>

				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/tkawy/admin/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>수거예약번호</option>
								<option value="M"
									<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>회원번호</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>수거예정업체</option>
								<option value="P"
									<c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>진행상태</option>

							</select> <input type='text' name='keyword' /> <input type='hidden'
								name='pageNum' value='${pageMaker.cri.pageNum }'> <input
								type='hidden' name='amount' value='${pageMaker.cri.amount }'>
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>

				<div class='pull-right'>
					<nav aria-label="Page navigation example">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="page-item  ${pageMaker.cri.pageNum == num ? "active":""} ">
									<a class="page-link" href="${num}">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>

				<form id='actionForm' action="/tkawy/admin/list" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum}'> <input type='hidden'
						name='amount' value='${pageMaker.cri.amount}'> <input
						type='hidden' name='type'
						value='<c:out value="${ pageMaker.cri.type }"/>'> <input
						type='hidden' name='keyword'
						value='<c:out value="${ pageMaker.cri.keyword }"/>'>

				</form>


			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(
				function() {

					history.replaceState({}, null, null);

					var actionForm = $("#actionForm");

					$(".page-item a").on("click", function(e) {

						e.preventDefault();

						console.log('click');

						actionForm.find("input[name='pageNum']").val(
								$(this).attr("href"));
						actionForm.submit();
					});
					
					$(".move").on("click", function(e){
						
						e.preventDefault();
						actionForm.append("<input type='hidden' name='t_bno' value='"+$(this).attr("href")+"'>");
						actionForm.attr("action","/tkawy/admin/modifydone");
						actionForm.submit();
					});
					
					var searchForm = $("#searchForm");

					$("#searchForm button").on("click", function(e) {

						if (!searchForm.find("option:selected")
								.val()) {
							alert("검색종류를 선택하세요");
							return false;
						}

						if (!searchForm.find(
								"input[name='keyword']").val()) {
							alert("키워드를 입력하세요");
							return false;
						}

						searchForm.find("input[name='pageNum']")
								.val("1");
						e.preventDefault();

						searchForm.submit();
					});

				});
	</script>

	<%@include file="../../includes/footer.jsp"%>