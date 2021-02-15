<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<body>
	<div class="container">
		<h1>신청페이지</h1>
		<hr>
		<h2>수거품목 이름 정하기</h2>
		<h2>두개다 0개일때 등록 안되게 하기</h2>
		<h2>입력창 입력안하면 경고창</h2>
		<h2>상점검색 셀렉트 팝업창</h2>
		<h2>달력폼</h2>
		<hr>
		<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/tkawy/register" method="post">
					<div class="form-group">
						<label>회원번호(일단 만들어둠 값 넘어오면 빼셈)</label> <input class="form-control" name='m_num'>
					</div>
					<div class="form-group">
					<label>연락처</label>
					<input type="tel" class="form-control m-input" name='t_contact'
						id="telInput" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
						maxlength="13" placeholder="예) 010-1234-5678" />
				</div>
					<div class="form-group">
						<label>일반 플라스틱(병뚜껑 제외)</label> <input class="form-control" name='t_plastic' type='number'>개
					</div>
					
					<div class="form-group">
						<label>플라스틱 병뚜껑 제외</label> <input class="form-control" name='t_plastic_cap' type='number'>개
					</div>
					<div class="form-group">
						<label>방문예정업체(모달창 검색예정)</label> <input class="form-control" name='t_vstng_cmpny'>
					</div>
					<div class="form-group">
					<label>방문예정날짜</label> <input type='date'
						class="form-control" name='t_date_vist'>
					</div>
					<hr>
					<button type="submit" class="btn btn-default">Submit
						Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.row -->

	<script type="text/javascript">
		$(document).ready(function() {
			
			function autoHypenTel(str) {
				  str = str.replace(/[^0-9]/g, '');
				  var tmp = '';

				  if (str.substring(0, 2) == 02) {
				    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
				    if (str.length < 3) {
				      return str;
				    } else if (str.length < 6) {
				      tmp += str.substr(0, 2);
				      tmp += '-';
				      tmp += str.substr(2);
				      return tmp;
				    } else if (str.length < 10) {
				      tmp += str.substr(0, 2);
				      tmp += '-';
				      tmp += str.substr(2, 3);
				      tmp += '-';
				      tmp += str.substr(5);
				      return tmp;
				    } else {
				      tmp += str.substr(0, 2);
				      tmp += '-';
				      tmp += str.substr(2, 4);
				      tmp += '-';
				      tmp += str.substr(6, 4);
				      return tmp;
				    }
				  } else {
				    // 핸드폰 및 다른 지역 전화번호 일 경우
				    if (str.length < 4) {
				      return str;
				    } else if (str.length < 7) {
				      tmp += str.substr(0, 3);
				      tmp += '-';
				      tmp += str.substr(3);
				      return tmp;
				    } else if (str.length < 11) {
				      tmp += str.substr(0, 3);
				      tmp += '-';
				      tmp += str.substr(3, 3);
				      tmp += '-';
				      tmp += str.substr(6);
				      return tmp;
				    } else {
				      tmp += str.substr(0, 3);
				      tmp += '-';
				      tmp += str.substr(3, 4);
				      tmp += '-';
				      tmp += str.substr(7);
				      return tmp;
				    }
				  }

				  return str;
				}
			
			$('#telInput').keyup(function (event) {
				  event = event || window.event;
				  var _val = this.value.trim();
				  this.value = autoHypenTel(_val);
				});

		});
	</script>

<%@include file="../includes/footer.jsp"%>