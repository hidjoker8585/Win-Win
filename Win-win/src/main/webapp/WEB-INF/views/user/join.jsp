<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>

<style>


.cols {
	width: 5%;
	text-align: center;
}

.cols2 {
	width: 18%;
}
</style>

<%@ include file="../include/header.jsp"%>

<div class="container">
<div class="container">
	<div class="row">

		<div class="col-12 mt-5">
			<p class="font-weight-bold h3">회원가입</p>
			<hr style="border: solid #376092;">
		</div>
		
		<div class="col-12 mt-4">
			<p class="font-weight-bold h4" style="line-height: 200%;">신규회원가입</p>
			<p class="font-weight-light h6" style="line-height: 200%;">본 사이트는 개인정보보호법 계정에 따라 회원가입에 
				필요한 다음의 최소 항목만 수집합니다.</p>
			<p class="font-weight-light h6" style="line-height: 200%;">이메일 주소는 본인의 회원 ID로 등록되며, 전화번호는 아이디를 분실하셨을 
				경우에 꼭 필요하니, 반드시 입력하시기 바랍니다.(필수항목)</p>
				<hr style="background-color:#333">
		</div>
		
		<div class="col-12 mt-1 mb-5 text-right">
			<i class="fas fa-check" style="color: red;"></i> 
			<strong>표시 항목은 필수 입력 항목입니다.</strong>
		</div>
		
		
		<div class="col-12 mt-3">
		<p class="font-weight-bold h5" style="line-height: 200%;">회원 가입 정보</p>
			<form action="/user/join" name="frm" id="frm" method="post">
				<table class="table table-sm">
					<tbody>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="cols2 align-middle">
								<strong>한글 성명</strong>
							</td>
							<td>
								<input type="text" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="username" name="username" placeholder="한글 성명을 입력하시오." onkeyup="han(this)" required>
							</td>
						</tr>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="cols2 align-middle">
								<strong>이메일 주소(로그인 아이디)</strong>
							</td>
							<td class=form-inline>
								<input type="email" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="userid" name="userid" placeholder="이메일을 입력하시오." onkeyup="Lower(this);" required>
								
								<script>
								function Lower(r){
									r.value = r.value.toLowerCase();
								}
								</script>
								
								<button type="button" id="idConfirm" class="btn btn-primary btn-sm mr-3"
									style="width: 70px;">중복확인</button>
								<span style="color:#008CBA;">로그인 시 사용되는 이메일 주소입니다.</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="align-middle">
								<strong>전화번호</strong>
							</td>
							<td class="align-middle">
								<input type="text" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="phone" name="phone" placeholder="전화번호를입력하시오." required>
							</td>
						</tr>
						<tr>
							<th scope="row" class="cols">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td>
								<strong>비밀번호</strong>
							</td>
							<td class="align-middle">
								<input type="password" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="pwd" name="pwd" placeholder="패스워드" required>
								<ul>
								<li class="mt-3" style="color:#008CBA; line-height: 200%;">비밀번호는 8~16자의 영문 대/소문자, 숫자,
									 특수문자(!@#$%^&*)를 혼합해서 사용하셔야합니다.</li>
								<li style="color:#008CBA; line-height: 200%;">쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같을 경우,
									 도용되기 쉬우므로 주기적으로 변경하셔서 사용하는것이 좋습니다.</li>
								<li style="color:#008CBA; line-height: 200%;">아이디와 생일, 전화번호 등 개인정보와 관련된 숫자, 
									연속된 숫자, 반복된 문자 등 다른 사람이 쉽게 알아 낼 수 있는 비밀번호는 개인정보의 유출의 위험이 높으므로 사용을 자제해 주기시 바랍니다. </li>
									</ul>
							</td>
						</tr>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="align-middle">
								<strong>비밀번호(확인)</strong><i class="fas fa-exclamation-circle ml-2" style="color: red;"></i>
							</td>
							<td class="align-middle form-inline">
								<input type="password" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="pwConfirm" name="pwConfirm" placeholder="패스워드 확인" required>
								<span id="pwdFail" style="color:red;"><strong>비밀번호가 일치하지 않습니다.</strong></span>
								<span id="pwdSuccess" style="color:blue;"><strong>비밀번호 일치</strong></span>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="col-12 mt-5 mb-5 text-center">
					<button type="button" id="joinOk" class="btn btn-primary btn-sm mr-3"
						style="width: 90px;">회원가입</button>
					<button type="button" id="btnLogin" class="btn btn-primary btn-sm ml-2"
						style="width: 90px;">로그인 이동</button>
				</div>
			</form>
		</div>
		
		<div class="col-12 mt-5">
			<table class="table border">
				<tbody>
					<tr>
						<th class="text-center table-light align-middle">
							<i class="fas fa-exclamation-triangle fa-3x"></i>
						</th>
						<td class="table-light align-middle"> 
						<ul>
							<li style="line-height: 150%;"><strong>상기 내용은 향후 전형을 진행하는데 있어 필수적인 항목이므로 잘 확인하시기 바랍니다.</strong></li>
							<li style="line-height: 150%;"><strong>특히 이메일 주소 및 비밀번호는 로그인 및 결과확인을 위하여 꼭 필요한므로 정확히 입력하신 후 메모 또는 인쇄하여 잘 보관해 주시기 바랍니다.</strong></li>
							<li><strong>일부 메일에서 당사 발신 메일이 스팸처리 되는 경우가 발생하오니 메일 미회신 시 스팸편지함을 확인하시거나 다른 메일 계정으로 가입하시기 바랍니다.</strong></li>
						</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
</div>
</div>


 <div id="myModal" class="modal">
	      <!-- Modal content -->
	      <div class="modal-content">
	      	
	      	<div class="row">
				<div class="col-6">
				<span class="font-weight-bold h2 d-flex justify-content-start mt-3">WIN-WIN</span>
				</div>
				<div class="col-6">
				<span class="d-flex justify-content-end mt-1"><span class="close">&times;</span></span>
				</div>
			</div>
	     	<div class="mb-3" style="height:4px; background-color: #376092" ></div>
	     	
	     	<!-- 모달 내용 입력하는 부분 -->
	     	<div>
		     	<div class="mt-4">
			        <p class="font-weight-bold text-center" id="idChecking"></p>
				</div>
			
			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
				<button type="button"  id="btnClose" class="font-weight-bold btn btn-primary" style="background-color: #376092">확인</button>
				</div>
			</div>
	      </div>
	 
	    </div>
    </div>
  
<%@ include file="../include/scriptLoader.jsp"%>

<script>

	$(document).ready(function() {

		$("#btnLogin").click(function() {
			location.href = "/user/login";
		});

		$("#btnOk").click(function() {
			location.href = "/user/login";
		});
		
	});
	
	// 이메일 형식 체크
	function validateEmail(userid) {
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (filter.test(userid)) {
		return true;
	} else {
		return false;
		}
	}
	
	// 전화번호 형식 체크
	function validatePhone(phone) {
		var filter = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		if (filter.test(phone)) {
		return true;
	} else {
		return false;
		}
	}
	
	// 비밀번호 형식 체크
	function validatePwd(pwd) {
		var filter = /(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*]).{8,16}$/;
		if (filter.test(pwd)) {
		return true;
	} else {
		return false;
		}
	}
	
	
	
	$(function() {
		//idck 버튼을 클릭했을 때 
		var idck = 0;

		$("#idConfirm").click(
			function() {
			
				//userid 를 param.
				var userid = $("#userid").val();
	
				
				console.log(userid);
				
				if (userid == "") {
					alert("이메일 주소를 입력하시오.");
					$("#userid").addClass("is-invalid");
					$("#joinOk").attr("disabled", "disabled");
				} else if(validateEmail(userid)==false){
					alert("잘못된 이메일 형식입니다.");
					$("#userid").addClass("is-invalid");
					$("#joinOk").attr("disabled", "disabled");
				} else {

				$.ajax({
					type : 'POST',
					url : "/user/idcheck",
					dataType : "json",
					data : {
					userid : userid
					},

					success : function(data) {
					if (data.success > 0) {

						var modal = document.getElementById('myModal');
						modal.style.display = "block";
						var span = document.getElementsByClassName("close")[0];
						var btnClose = document.getElementById("btnClose");
											
						span.onclick = function() {
							modal.style.display = "none";
						}

						btnClose.onclick = function() {
							modal.style.display = "none";
						}
							$('#idChecking').html("중복된아이디입니다.");
							$("#userid").addClass("is-invalid");
							$("#joinOk").attr("disabled", "disabled");
							$("#userid").focus();

							} else {
								var modal = document.getElementById('myModal');
								modal.style.display = "block";
								var span = document.getElementsByClassName("close")[0];

								var btnClose = document.getElementById("btnClose");
											
								span.onclick = function() {
									modal.style.display = "none";
								}

								btnClose.onclick = function() {
									modal.style.display = "none";
								}

								$('#idChecking').html("사용가능한 아이디입니다.");
								$("#userid").removeClass("is-invalid");
								$("#joinOk").removeAttr("disabled");
								$("#phone").focus();
								//아이디가 중복하지 않으면  idck = 1 
								idck = 1;

							}
						},
					error : function(error) {
					alert("error : " + error);
					}
				});
			}
				
		});

				
		$("#joinOk").click(function() {
			
			var phone = $("#phone").val();
			var username = $("#username").val();
			var pwd = $("#pwd").val();
			var pwConfirm = $("#pwConfirm").val();
			
			if (username == "") {
				alert("한글이름을 입력하시오.");
				$("#username").focus();
			} else if (phone == "") {
				alert("전화번호를 입력하시오.");
				$("#phone").focus();
			} else if(validatePhone(phone)==false){
				alert("잘못된 전화번호 형식 입니다.");
				$("#phone").focus();
			} else if(pwd == "") {
				alert("비밀번호를 입력하시오.");
				$("#pwd").focus();
			} else if(validatePwd(pwd)==false) {
				alert("잘못된 비밀번호 형식 입니다.");
				$("#pwd").focus();
			} else if(pwConfirm == "") {
				alert("비밀번호 확인을 입력하시오.");
				$("#pwConfirm").focus();
			} else {
			if (idck == 0) {
				var modal = document.getElementById('myModal');
				modal.style.display = "block";
				var span = document.getElementsByClassName("close")[0];

				var btnClose = document.getElementById("btnClose");
				
				span.onclick = function() {
					modal.style.display = "none";
				}

				btnClose.onclick = function() {
					modal.style.display = "none";
				}

				$('#idChecking').html("이메일 중복 확인하여 주십시오.");
				$("#userid").addClass("is-invalid");
				return false;
				
			} else {
		
				var modal = document.getElementById('myModal');
				modal.style.display = "block";
				var span = document.getElementsByClassName("close")[0];

				var btnClose = document.getElementById("btnClose");
				
				span.onclick = function() {
					modal.style.display = "none";
				}

				btnClose.onclick = function() {
					modal.style.display = "none";
					$("#frm").submit();	
				}

				$('#idChecking').html("회원가입을 축하드립니다.");
						    
				}
			}
		});
	
	});
	
	
	$(function() {
		$("#pwdSuccess").hide();
		$("#pwdFail").hide();
		$("#pwConfirm").keyup(function() {
			var pwd1 = $("#pwd").val();
			var pwd2 = $("#pwConfirm").val();
			if (pwd2 == "") {
				$("#pwdSuccess").hide();
				$("#pwdFail").hide();
			} else if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#pwdSuccess").show();
					$("#pwdFail").hide();
					$("#pwConfirm").removeClass("is-invalid")
					$("#joinOk").removeAttr("disabled");
				} else {
					$("#pwdSuccess").hide();
					$("#pwdFail").show();
					$("#pwConfirm").addClass("is-invalid")
					$("#joinOk").attr("disabled", "disabled");
				}
			}
		});
	});
	
	$(function() {
		$("#pwdSuccess").hide();
		$("#pwdFail").hide();
		$("#pwd").keyup(function() {
			var pwd1 = $("#pwd").val();
			var pwd2 = $("#pwConfirm").val();
			if (pwd2 == "") {
				$("#pwdSuccess").hide();
				$("#pwdFail").hide();
			} else if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#pwdSuccess").show();
					$("#pwdFail").hide();
					$("#pwConfirm").removeClass("is-invalid")
					$("#joinOk").removeAttr("disabled");
				} else {
					$("#pwdSuccess").hide();
					$("#pwdFail").show();
					$("#pwConfirm").addClass("is-invalid")
					$("#joinOk").attr("disabled", "disabled");
				}
			}
		});
	});


	function han(obj) {
		var pattern = /[^(ㄱ-힣)]/; //한글만 허용 할때
		if (pattern.test(obj.value)) {
			var modal = document.getElementById('myModal');
			modal.style.display = "block";
			var span = document.getElementsByClassName("close")[0];

			var btnClose = document.getElementById("btnClose");
			
			span.onclick = function() {
				modal.style.display = "none";
			}

			btnClose.onclick = function() {
				modal.style.display = "none";
			}

			$('#idChecking').html("한글성명은 한글만 허용합니다.");
			obj.value = '';
			obj.focus();
			return false;
		}
	}
</script>


<%@ include file="../include/footer.jsp"%>