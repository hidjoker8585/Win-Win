<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>


<style>
.cols {
	width: 5%;
	text-align: center;
}

.cols2 {
	width: 15%;
}
</style>

<%@ include file="../include/header.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-12 mt-5">
			<p class="font-weight-bold h3">로그인</p>
			<hr style="border: solid #376092;">
		</div>
		<div class="col-12 mt-4">
			<p class="font-weight-bold h4" style="line-height: 200%;">로그인 정보가 필요합니다.</p>
			<p class="font-weight-light h6" style="line-height: 200%;">회원 가입시 이메일 주소와 비밀번호를 입력해 주시기 바랍니다.</p>
			<p class="font-weight-light h6" style="line-height: 200%;">회원정보가 없으신 분들은 [회원가입]을 눌러 회원가입을 먼저 해주시기 바랍니다.</p>
		</div>
		<div class="col-12 mt-4 text-right">
			<i class="fas fa-check" style="color: red;"></i> 
			<strong>표시 항목은 필수 입력 항목입니다.</strong>
		</div>
		<div class="col-12 mt-2">
			<form action="/user/login" method="post" id="loginForm">
				<table class="table table-sm col-md-12">
					<tbody>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="cols2 align-middle">
								<strong>이메일 주소</strong>
							</td>
							<td>
								<input type="email" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="userid" name="userid" placeholder="이메일을 입력하시오." onkeyup="Lower(this);" required>
								<script>
									function Lower(r){
										r.value = r.value.toLowerCase();
									}
								</script>
								
							</td>
						</tr>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="cols2 align-middle">
								<strong>비밀번호</strong>
							</td>
							<td>
								<input type="password" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="pwd" name="pwd" placeholder="패스워드" required>
							</td>
						</tr>
						<tr>
							<th scope="row" class="text-right">
								<input class="form-check-input" type="checkbox" id="rememberid">
							</th>
							<td colspan="2">
								<strong>아이디저장하기</strong>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="col-12 mt-2 text-center">
					<button type="submit" id="login_button" class="btn btn-primary btn-sm mr-3"
						style="width: 70px;">로그인</button>
					<button type="button" id="btnJoin" class="btn btn-primary btn-sm ml-2"
						style="width: 70px;">회원가입</button>
				</div>
			</form>
		</div>
		
		<!-- 실제 서버로 전송되는 form -->
	<form action="/user/login" method="post" id="hiddenForm">
	        <input type="hidden" name="userid" />
	        <input type="hidden" name="pwd" />
	</form>

		<div class="col-12 mt-4 mb-5 text-center">
			<button type="button" id="LoginHelper" class="btn btn-secondary btn-sm mx-4"
				style="width: 170px;">이메일 / 비밀번호 찾기</button>
		</div>

		<div class="col-12 mt-5 text-center">
			<table class="table border">
				<tbody>
					<tr>
						<th class="table-light">
							<i class="fas fa-question-circle fa-3x"></i>
						</th>
						<td class="table-light align-middle">
							<strong>이메일 주소 혹은 비밀번호에 문제가 있으신 분은 [로그인 도우미] 버튼을 눌러서 해결해 주시기 바랍니다.</strong>
						</td>
						<td class="table-light align-middle">
							<button type="button" id="LoginHelper2" class="btn btn-secondary btn-sm ml-5"
							style="width: 170px;">로그인 도우미</button>
						</td>
					</tr>
				</tbody>
			</table>
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

<!-- javascropt lib load -->
<script src="/resources/jsbn.js"></script>
<script src="/resources/rsa.js"></script>
<script src="/resources/prng4.js"></script>
<script src="/resources/rng.js"></script>	
<script src="/resources/login.js"></script>


<script>

$(document).ready(function() {
	
	$("#btnJoin").click(function() {
		location.href="/user/join";
	});
	
	$("#LoginHelper").click(function() {
		location.href="/user/loginHelper";
	});
	
	$("#LoginHelper2").click(function() {
		location.href="/user/loginHelper";
	});
	
});

var $userid = $("#hiddenForm input[name='userid']");
var $pwd = $("#hiddenForm input[name='pwd']");

// Server로부터 받은 공개키 입력
var rsa = new RSAKey();
rsa.setPublic("${modulus}", "${exponent}");


$("#loginForm").submit(function(e) {
    // 실제 유저 입력 form은 event 취소
    // javascript가 작동되지 않는 환경에서는 유저 입력 form이 submit 됨
    // -> Server 측에서 검증되므로 로그인 불가
    e.preventDefault();

    // 아이디/비밀번호 암호화 후 hidden form으로 submit
    var userid = $(this).find("#userid").val();
    var pwd = $(this).find("#pwd").val();
    $userid.val(userid);
//     $userid.val(rsa.encrypt(userid)); // 아이디 암호화
    $pwd.val(rsa.encrypt(pwd)); // 비밀번호 암호화
    
    $.ajax({
		type : 'POST',
		url : "/user/login",
		dataType : "json",
		data :
			$("#hiddenForm").serialize(),
		success : function(data) {
		if (data.success > 0) {
			location.href="/main/usermain";
				} else {
					var modal = document.getElementById('myModal');
					modal.style.display = "block";
					var span = document.getElementsByClassName("close")[0];

					var btnClose = document.getElementById("btnClose");
								
					span.onclick = function() {
						modal.style.display = "none";
					}

					btnClose.onclick = function() {
						location.href="/user/login";
					}

					$('#idChecking').html("등록된 회원이 아니거나<br>이메일 또는 비밀번호가 틀렸습니다.");

				}
			},
		error : function(error) {
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

			$('#idChecking').html("Q&A게시판으로 이동하여 관리자에게 문의하십시오.");
		}
	});
});	


	$(function() {

		var userid = $.cookie('userid');
		if (userid != undefined) {
			$("#userid").val(userid);
			$("#rememberid").prop("checked", true);
		}

		//로그인 버튼 클릭시
		$("#login_button").click(function() {
			
			//아이디저장 체크되어있으면 쿠키저장	
			if ($("#rememberid").prop("checked")) {
				$.cookie('userid', $("#userid").val());
				//아이디저장 미체크면 쿠키에 정보가 있던간에 삭제
			} else {
				$.removeCookie("userid");
			}
			
		})

		$.cookie('쿠키명', '쿠키값', {
			//쿠키보관일
			expires : 5,
			domain : 'http://hellogk.tistory.com',//https/http 결정
			secure : false
		});

	});
	

</script>

<%@ include file="../include/footer.jsp"%>