<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<body>
	<div class="container" style="text-align:center;">
		<h3>가입이 완료되었습니다.</h3>
		<hr>
		
		<h1>이메일(ID) : <c:out value="${result }"/></h1>

		
		<div class="col-12" style="text-align: center">
			<button type="button" class="btn btn-outline-secondary">
				<a href="/member/logIn">로그인하기</a>
			</button>
			<button type="button" class="btn btn-outline-secondary">
				<a href="/main">메인 페이지로 이동</a>
			</button>
		</div>
	</div>
	
	<script type ="text/javascript">
	

	
	$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>'; 
	
	

	});
	
	</script>

<%@include file="../includes/footer.jsp"%>