<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<body>
	<div class="container">
		<h3>회원가입</h3>
		<hr>
		<h2>개인정보이용 동의 필수내역 체크</h2>
		<hr>
		<h2>카카오 가입</h2>
		<h2>일반 가입</h2>
		<br>
		
		<div class="col-12" style="text-align: center">
			<button type="button" class="btn btn-outline-secondary">
				<a href="/member/signUp">일반가입</a>
			</button>
		</div>
	</div>

<%@include file="../includes/footer.jsp"%>