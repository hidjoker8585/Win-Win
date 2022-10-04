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
<div class="container">
	<div class="row">    
    
    	<div class="col-12 mt-5 mb-4">
			<p class="font-weight-bold h3">비밀번호 변경</p>
			<hr style="border: solid #376092;">
		</div>
		
		<div class="col-12 mt-5">
			<p class="d-flex justify-content-end">
			<i class="fas fa-check" style="color: red;"></i> 
			<strong>표시 항목은 필수 입력 항목입니다.</strong></p>
		</div>
		
		<div class="col-12 mt-1 mb-4">
			<form action="/user/pwchange" method="post">
				<table class="table table-sm border border-right-0 border-left-0">
					<tbody>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="cols2 align-middle">
								<strong>이메일 주소</strong>
							</td>
							<td>
								<input type="text" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="userid" name="userid" placeholder="이메일을 입력하시오.">
							</td>
						</tr>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="cols2 align-middle">
								<strong>임시비밀번호</strong>
							</td>
							<td>
								<input type="password" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="temppwd" name="temppwd" placeholder="임시 비밀번호를 입력하시오.">
							</td>
						</tr>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="cols2 align-middle">
								<strong>변경할 비밀번호</strong>
							</td>
							<td><input type="password" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="chpwd" name="chpwd" placeholder="변경할 비밀번호를 입력하시오.">
							</td>
						</tr>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="cols2 align-middle">
								<strong>변경할 비밀번호(확인)</strong><i class="fas fa-exclamation-circle ml-2" style="color: red;"></i>
							</td>
							<td class="align-middle form-inline">
								<input type="password" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="pwConfirm" name="pwConfirm" placeholder="변경할 비밀번호 확인">
								<span id="pwdFail" style="color:red;"><strong>비밀번호가 일치하지 않습니다.</strong></span>
								<span id="pwdSuccess" style="color:blue;"><strong>비밀번호 일치</strong></span>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="col-12 mt-5 text-center">
					<button type="button" id="changOk" class="btn btn-primary btn-sm mr-3" 
						style="width: 90px;">변경하기</button>
					<button type="button" id="btnLogin" class="btn btn-primary btn-sm ml-2"
						style="width: 90px;">로그인 이동</button>
				</div>
				
			</form>
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
		location.href="/user/login";
	});
	
});

//이메일 형식 체크
function validateEmail(userid) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(userid)) {
	return true;
} else {
	return false;
	}
}

//비밀번호 형식 체크
function validatePwd(chpwd) {
	var filter = /(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*]).{8,16}$/;
	if (filter.test(chpwd)) {
	return true;
} else {
	return false;
	}
}

$(function() {

	$("#changOk").click(
		function() {
		
			var userid = $("#userid").val();
			var temppwd = $("#temppwd").val();
			var chpwd = $("#chpwd").val();
			var pwConfirm = $("#pwConfirm").val();

			if (userid == "") {
				alert("이메일 주소를 입력하시오.");
				$("#userid").focus();
			} else if(validateEmail(userid)==false){
				alert("잘못된 이메일 형식입니다.");
				$("#userid").focus();
			} else if(temppwd == ""){
				alert("임시비밀번호를 입력하시오.");
				$("#temppwd").focus();
			} else if(chpwd == ""){
				alert("변경할 비밀번호를 입력하시오.");
				$("#chpwd").focus();
			} else if(validatePwd(chpwd)==false){
				alert("잘못된 비밀번호 형식입니다.");
				$("#chpwd").focus();
			} else if(pwConfirm == ""){
				alert("변경할 비밀번호 확인에 입력하시오");
				$("#pwConfirm").focus();
			} else {

			$.ajax({
				type : 'POST',
				url : "/user/pwchange",
				dataType : "json",
				data : {
					userid : userid,
					temppwd : temppwd,
					chpwd : chpwd
				},

				success : function(data) {
					console.log(data.success);
				if (data.success > 0) {
					
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

					$('#idChecking').html("비밀번호 변경 성공");

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

							$('#idChecking').html("비밀번호 변경 실패");

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
		}
			
	});

});

$(function() {
	$("#pwdSuccess").hide();
	$("#pwdFail").hide();
	$("#pwConfirm").keyup(function() {
		var pwd1 = $("#chpwd").val();
		var pwd2 = $("#pwConfirm").val();
		if (pwd2 == "") {
			$("#pwdSuccess").hide();
			$("#pwdFail").hide();
		} else if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#pwdSuccess").show();
				$("#pwdFail").hide();
				$("#pwConfirm").removeClass("is-invalid")
				$("#changOk").removeAttr("disabled");
			} else {
				$("#pwdSuccess").hide();
				$("#pwdFail").show();
				$("#pwConfirm").addClass("is-invalid")
				$("#changOk").attr("disabled", "disabled");
			}
		}
	});
});

</script>

<%@ include file="../include/footer.jsp"%>