<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Auction Now</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style-for-earth.css"
	type="text/css">
	
	
<!-- 충성 -->
 <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/img/title_logo.png">
<title>얼쑤[EARTH]좋다</title>
<nav>
	<div class="row" style="height: 0.5rem;">
		<div class="col"></div>
	</div>
	<div class="row" style="font-size: 0.9rem; height: 1rem;">
		<div class="col-2"></div>
		<div class="col-8" style="text-align: right;">
			<ul style="list-style: none;">
				<li style="display: inline-block"><a
					href="/member/beforeSignUp">Join</a></li>
				<li style="display: inline-block"><a href="/member/logIn">Log
						In</a></li>
				<li style="display: inline-block">MyPage</li>
			</ul>
		</div>
		<div class="col-2"></div>
	</div>
	<div class="row">
		<div class="col-12" style="text-align: center;">
			<a href="/main"><img src="/resources/img/logo.png"></a>
		</div>
	</div>
	<div class="row">
		<div class="col-4"></div>
		<div class="col"
			style="display: flex; text-align: center; border-top: 1px solid #e7e9e6;">
			<div class="dropdown">
				<button class="btn btn-right dropdown-toggle" type="button"
					id="dropdownMenuButton2" data-bs-toggle="dropdown"
					aria-expanded="false" style="font-color: #000000">ABOUT</button>
				<ul class="dropdown-menu dropdown-menu-right"
					aria-labelledby="dropdownMenuButton2">
					<li><a class="dropdown-item active" href="#">제로웨이스트란</a></li>
					<li><a class="dropdown-item" href="#">제로웨이스트 실천법</a></li>
					<li><a class="dropdown-item" href="#">얼쑤좋다 소개</a></li>
					<li><a class="dropdown-item" href="#">오프라인 매장 지도</a></li>
					<li><a class="dropdown-item" href="#">제휴 문의</a></li>
				</ul>
			</div>
			<div class="dropdown">
				<button class="btn btn-right dropdown-toggle" type="button"
					id="dropdownMenuButton2" data-bs-toggle="dropdown"
					aria-expanded="false" style="font-color: #000000">RECYCLE</button>
				<ul class="dropdown-menu dropdown-menu-right"
					aria-labelledby="dropdownMenuButton2">
					<li><a class="dropdown-item active" href="#">재활용 매뉴얼</a></li>
					<li><a class="dropdown-item" href="#">헷갈리기 쉬운 품목들</a></li>
				</ul>
			</div>
			<div class="dropdown">
				<button class="btn btn-right dropdown-toggle" type="button"
					id="dropdownMenuButton2" data-bs-toggle="dropdown"
					aria-expanded="false" style="font-color: #000000">PLASTIC
					PROJECT</button>
				<ul class="dropdown-menu dropdown-menu-right"
					aria-labelledby="dropdownMenuButton2">
					<li><a class="dropdown-item active" href="/tkawy/main">플라스틱방앗간</a></li>
				</ul>
			</div>
			<div class="dropdown">
				<button class="btn btn-right dropdown-toggle" type="button"
					id="dropdownMenuButton2" data-bs-toggle="dropdown"
					aria-expanded="false" style="font-color: #000000">AUCTION</button>
				<ul class="dropdown-menu dropdown-menu-right"
					aria-labelledby="dropdownMenuButton2">
					<li><a class="dropdown-item active" href="/auc/now">IMPERFECT
							FOOD</a></li>
				</ul>
			</div>
			<div class="dropdown">
				<button class="btn btn-right dropdown-toggle" type="button"
					id="dropdownMenuButton2" data-bs-toggle="dropdown"
					aria-expanded="false" style="font-color: #000000">BOARD</button>
				<ul class="dropdown-menu dropdown-menu-right"
					aria-labelledby="dropdownMenuButton2">
					<li><a class="dropdown-item active" href="#">공지사항</a></li>
					<li><a class="dropdown-item" href="/board/list">님들끼리 묻고답하기</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>

</head>