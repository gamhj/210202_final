<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<body>
	<div class="container">
		<h2>로그인페이지</h2>
		<h1>아직 구현 못함</h1>
		<br>
		<hr>
		<h2><center>회원전용</center></h2>
		<div class="col-12" style="text-align: center">
			<button type="button" class="btn btn-outline-secondary" disabled>
				<a href="/member/get?m_num=U100021">회원전용 내정보 조회(회원번호 U100021조회)</a>
			</button>
			<button type="button" class="btn btn-outline-secondary" disabled>
				<a href="/member/modify?m_num=U100021">회원전용 내정보 수정(회원번호 U100021수정)</a>
			</button>
		</div>
		
		
		<hr>
		<h2><center>관리자전용</center></h2>
		<div class="col-12" style="text-align: center">
			<button type="button" class="btn btn-outline-secondary">
				<a href="/member/admin/list">전체 회원 조회</a>
			</button>
			
			<button type="button" class="btn btn-outline-secondary" disabled>
				<a href="/member/admin/get?m_num=U100021">정보 조회(회원번호 U100021조회)</a>
			</button>
			
			<button type="button" class="btn btn-outline-secondary" disabled>
				<a href="/member/admin/modify?m_num=U100021">회원정보 수정(회원번호 U100021수정)</a>
			</button>
		</div>
	</div>

<%@include file="../includes/footer.jsp"%>