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


<div class="container">
<div class="container">
	<div class="row">

		<div class="col-12 mt-5">
			<p class="font-weight-bold h3">임직원 로그인</p>
			<hr style="border: solid #376092;">
		</div>
		
		<div class="col-12 mt-2">
			<form action="/admin/adminLogin" method="post" id="adminForm">
				<table class="table table-sm col-md-12 border border-right-0 border-left-0">
					<tbody>
						<tr>
							<th scope="row" class="cols align-middle">
								<i class="fas fa-check" style="color: red;"></i>
							</th>
							<td class="cols2 align-middle">
								<strong>아이디(사번)</strong>
							</td>
							<td>
								<input type="text" style="width: 300px;" class="form-control form-control-sm mr-sm-2"
								id="adminCode" name="adminCode" placeholder="사번을 입력하시오." required>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="col-12 mt-2 text-center">
					<button type="button" id="adminLogin" class="btn btn-primary btn-sm">로그인</button>
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

function validateAdminCode(adminCode) {
	var filter = /[^0-9]/g;
	if (filter.test(adminCode)) {
	return true;
} else {
	return false;
	}
}

$(function() {
	$("#adminLogin").click(
		function() {
		
			var adminCode = $("#adminCode").val();

			if (adminCode == "") {
				alert("사번코드를 입력하시오.");
				
			} else if(validateAdminCode(adminCode)==true){
				alert("숫자로만 입력 가능합니다.");
				$("#adminCode").focus();
			} else {

			$.ajax({
				type : 'POST',
				url : "/admin/adminLogin",
				dataType : "json",
				data : $("#adminForm").serialize(),	

				success : function(data) {
				if (data.success > 0) {
					location.href="/main/adminmain";

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

							$('#idChecking').html("없는 사번코드입니다.");
							$("#adminCode").focus();

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
	
	$('#adminCode').keypress(function(event){
	     if ( event.which == 13 ) {
	         $('#adminLogin').click();
	         return false;
	     }
	});

});

</script>

<%@ include file="../include/footer.jsp"%>