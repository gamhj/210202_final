<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<style>
#mail_check_input_box_false {
	background-color: #ebebe4;
}

#mail_check_input_box_true {
	background-color: white;
}

.correct{
color : green;
}

.incorrect{
color : red;
}

/* 중복아이디 존재하지 않는경우 */ 
.id_input_re_1{
 color : green; 
 display : none; 
 } 
 
 /* 중복아이디 존재하는 경우 */ 
 .id_input_re_2{ 
 color : red; 
 display : none; 
 }
 
 
 .final_mail_ck{
 
 display : none;
 
 }


 .final_pw_ck{
 
 display : none;
 
 }
 
 
 .final_pwck_ck{
 
 display : none;
 
 }
 
 
 .final_name_ck{
 
 display : none;
 
 }
 
 
 
 .final_ncnm_ck{
 
 display : none;
 
 }
 
 .final_contact_check{
 
 display : none;
 
 }
 
 
 
 

</style>


<body>
	<div class="container">
		<h3>회원가입-일반가입</h3>
		<hr>
		<div class="col-12" style="text-align: center">
			<form role="form" action="/member/signUp" method="post">
				<div class="mb-3">
					<label class="form-label">이메일주소</label> <input class="form-control" id="email_input" name='m_email'> <span
						class="id_input_re_1">사용 가능한 이메일입니다.</span> <span
						class="id_input_re_2">이메일이 이미 존재합니다.</span>
					<button class="mail_check_button">인증번호 전송</button>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<span class="mail_input_box_warn"></span>
				</div>

				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<label class="form-label">인증번호입력</label> <input
							class="mail_check_input" disabled="disabled">
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
					
				</div>
				<div class="mb-3">
					<label class="form-label">비밀번호</label> <input type="password" id="pwd1" class="form-control"
						name='m_password'>
						<span class="final_pw_ck">비밀전호를 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label class="form-label">비밀번호확인</label> <input type="password" id="pwd2" class="form-control"
						name='re_m_password'>
						<span class="final_pwck_ck">비밀번호를 확인해주세요.</span>
				</div>
				<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
				<div class="mb-3">
					<label class="form-label">이름</label> <input class="form-control"
						name='m_name' id="name_input">
						<span class="final_name_ck">이름을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label class="form-label">닉네임</label> <input class="form-control"
						name='m_ncnm' id="ncnm_input">
						<span class="final_ncnm_ck">닉네임을 입력해주세요.</span>
				</div>
				<div class="mb-3">
				<label class="form-label">연락처</label>
					<input type="tel" class="form-control m-input" name='m_contact'
						id="telInput" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
						maxlength="13" placeholder="예) 010-1234-5678" />
						<span class="final_contact_check">연락처를 입력해주세요.</span>
				</div>
				<button type="submit" data-oper='afterSignUp'
					class="btn btn-primary">가입하기</button>

			</form>
		</div>
	</div>
	
	


	<script type="text/javascript">
		$(document).ready(function() {
			
			var code = "";
			
			/* 유효성 검사 */
			var mailCheck = false;		//메일
			var mailckCheck = false;	//메일 중복 검사
			var mailnumChek = false;	// 메일 인증번호 확인
			var pwCheck = false;		//비밀번호 
			var pwckCheck = false;		//비밀번호 확인
			var psckcorCheck = false;	//비밀번호 일치 확인 
			var nameCheck = false;		//이름 
			var ncnmCheck = false;		//닉네임
			var contactCheck = false;	//연락처
			

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

			$('#telInput').keyup(function(event) {
				event = event || window.event;
				var _val = this.value.trim();
				this.value = autoHypenTel(_val);
			});

			
			
			
			/* 비밀번호 일치 검사 */
			$(function(){ 
				$("#alert-success").hide(); 
				$("#alert-danger").hide(); 
				$("input").keyup(function(){
					var pwd1=$("#pwd1").val(); 
					var pwd2=$("#pwd2").val(); 
					$('.final_pwck_ck').css('display', 'none');
					
					if(pwd1 != "" || pwd2 != ""){
						if(pwd1 == pwd2){
							$("#alert-success").show(); 
							$("#alert-danger").hide(); 
							$("button[data-oper='afterSignUp']").removeAttr("disabled");
							pwckcorCheck = true;
					}else{
						$("#alert-success").hide(); 
						$("#alert-danger").show(); 
						$("button[data-oper='afterSignUp']").attr("disabled", "disabled");
						pwckcorCheck = false;
					} 
				} 
			});
			});

			/* 입력 이메일 형식 유효성 검사 */
			function mailFormCheck(email){
					
				var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			    return form.test(email);

				}
				

			
			
			/* 인증번호 이메일 전송 */
			$(".mail_check_button").click(function(){
				
				 var email = $("#email_input").val();		//입력한 이메일    
				 var checkBox = $(".mail_check_input");			//인증번호 입력란
				 var boxWrap = $(".mail_check_input_box");		//인증번호 입력한 박스
				 var warnMsg = $(".mail_input_box_warn");		//이메일 입력 경고글
				 
				 /* 이메일 형식 유효성 검사 */
				    if(mailFormCheck(email)){
				    	warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
				    	warnMsg.css("display", "inline-block");
				    } else {
				        warnMsg.html("올바르지 못한 이메일 형식입니다.");
				        warnMsg.css("display", "inline-block");
				        return false;
				    }    
				 
				 $.ajax({
				        
			        type:"GET",
			        url:"mailCheck?email=" + email,
			        		success:function(data){
			        			
			        			//console.log("data : " + data);
			        			checkBox.attr("disabled", false); //succes 코드 안에 이메일 인증 입력란[$(".mail_check_input")]이 입력이 가능하도록 속성을 변경
			        			boxWrap.attr("id", "mail_check_input_box_true");
								code = data;
			        		}
			                
			    });

			});
			 
			 
			/* 인증번호 비교 */
			$(".mail_check_input").blur(function(){
				
				var inputCode = $(".mail_check_input").val();        // 입력코드    
				var checkResult = $("#mail_check_input_box_warn");    // 비교 결과 

			if(inputCode == code){								//일치할 경우
				checkResult.html("인증번호가 일치합니다.");
			    checkResult.attr("class", "correct");     
			    mailnumCheck = true;
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		        mailnumCheck = false;
		    }    
		    
				
			});
			
			/* 이메일아이디 중복검사 */
			$('#email_input').on("propertychange change keyup paste input", function(){
				//console.log("keyup 테스트"); 
				var m_email = $('#email_input').val(); // email_input에 입력되는 값 
				var data = {m_email : m_email} // '컨트롤에 넘길 데이터 이름' : '데이터(email_input에 입력되는 값)' 
				
				$.ajax({
					type : "post", 
					url : "/member/memberIdChk", 
					data : data,
					success : function(result){
						//console.log("성공 여부" + result);
						if(result != 'fail'){
							$('.id_input_re_1').css("display","inline-block"); 
							$('.id_input_re_2').css("display", "none"); 
							emailckCheck = true;
						} else { 
							$('.id_input_re_2').css("display","inline-block"); 
							$('.id_input_re_1').css("display", "none");
							emailckCheck = false;
						}

					}
					
				}); // ajax 종료

			});// function 종료 
			
			var operForm = $("#operForm");

			$("button[data-oper='afterSignUp']").on("click", function(e) {
				
				/* 입력값 변수 */
				var email = $("#email_input").val();
				var pw = $("#pwd1").val();
				var pwck = $("#pwd2").val();
				var name = $("#name_input").val();
				var ncnm = $("#ncnm_input").val();
				var contact = $("#telInput").val();
				
				/* 이메일 유효성검사 */
		        if(email == ""){
		            $('.final_mail_ck').css('display','block');
		            emailCheck = false;
		        }else{
		            $('.final_mail_ck').css('display', 'none');
		            emailCheck = true;
		        }
				 
				/* 비밀번호 유효성 검사 */
				if(pw == ""){
					$('.final_pw_ck').css('display', 'block');
					pwCheck = false;
				}else{
					$('.final_pw_ck').css('display', 'none');
					pwCheck = true;
				}
				
				/* 비밀번호 확인 유효성 검사 */
		        if(pwck == ""){
		            $('.final_pwck_ck').css('display','block');
		            pwckCheck = false;
		        }else{
		            $('.final_pwck_ck').css('display', 'none');
		            pwckCheck = true;
		        }
				
		        /* 이름 유효성 검사 */
		        if(name == ""){
		            $('.final_name_ck').css('display','block');
		            nameCheck = false;
		        }else{
		            $('.final_name_ck').css('display', 'none');
		            nameCheck = true;
		        }
		        
		        /* 닉네임 유효성 검사 */
		        if(ncnm == ""){
		            $('.final_ncnm_ck').css('display','block');
		            ncnmCheck = false;
		        }else{
		            $('.final_ncnm_ck').css('display', 'none');
		            ncnmCheck = true;
		        }
		        
		        
		        /* 연락처 유효성 검사 */
		        if(contact == ""){
		            $('.final_contact_ck').css('display','block');
		            contactCheck = false;
		        }else{
		            $('.final_contact_ck').css('display', 'none');
		            contactCheck = true;
		        }
				
		        if (mailCheck && mailckCheck && mailnumChek && pwCheck && pwckCheck && psckcorCheck && nameCheck && nameCheck && ncnmCheck && contactCheck){
		        	
					operForm.attr("action", "/member/afterSignUp").submit();
		        	
		        }
		        
		        return false;

			});
		});
	</script>



	<%@include file="../includes/footer.jsp"%>