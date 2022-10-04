<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/CSSLoader.jsp"%>

<style>
/* The Modal (background) */
.modalCheck {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	/*             overflow: auto; /* Enable scroll if needed */ */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-contentCheck {
	background-color: #fefefe;
	margin: 5% auto; /* 15% from the top and centered */
	padding-left: 10px;
	padding-right: 10px;
	border: 1px solid #888;
	width: 80%; /* 모달 폭 지정 */
	height: 100%;
	max-height: 600px;
	overflow-y: auto;
}

.modal-footerCheck {
	border-top: none;
}
/* The Close Button */
.closeCheck {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.closeCheck:hover, .closeCheck:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

<!-- The portModal -->
<div id="portModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">

		<div class="row">
			<div class="col-6">
				<span class="font-weight-bold h2 d-flex justify-content-start mt-3">WIN-WIN</span>
			</div>
			<div class="col-6">
				<span class="d-flex justify-content-end mt-1"><span
					class="close">&times;</span></span>
			</div>
		</div>
		<div class="mb-3" style="height: 4px; background-color: #376092"></div>

		<!-- 모달 내용 입력하는 부분 -->
		<div>
			<div class="mt-4">
				<p class="font-weight-bold text-center" id="modalcontent"></p>
				<!--         <select id="license" class="js-example-basic-single" > -->
				<!-- 		</select> -->
			</div>

			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
					<button type="button" id="btnOk"
						class="font-weight-bold btn btn-primary mr-2 "
						style="background-color: #376092">확인</button>
					<button type="button" id="btnClose"
						class="font-weight-bold btn btn-secondary">닫기</button>
					<!-- 				<button type="button" id="btnPass" class="font-weight-bold btn btn-primary mr-2 " style="background-color: #376092">합격</button> -->
					<!-- 				<button type="button" id="btnCancle" class="font-weight-bold btn btn-secondary">취소</button> -->

				</div>
			</div>
		</div>

	</div>
</div>

<%@ include file="../include/adminHeader.jsp"%>
<div class="container">
	<div class="container">
		<div class="row">
			<div class="col-12 mt-5">
				<p class="font-weight-bold h3">지원 결과 확인</p>
				<hr style="border: solid #376092;">
			</div>
		</div>
		<div class="row">
			<div class="col-12 mt-5">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="pass"
						value="합격" style="width: 20px; height: 20px;"> <label
						class="form-check-label font-weight-bold" for="pass"
						style="font-size: 15px">합격</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox"
						id="fail" value="불합격"
						style="width: 20px; height: 20px;"> <label
						class="form-check-label font-weight-bold" for="fail"
						style="font-size: 15px">불합격</label>
				</div>
				<div class="mt-3">
					<select class="custom-select" style="width: 457px; height: 40px;"
						id="title" name="title">
						<option value="0" style="width: 457px;">공고명을 선택해 주십시오!</option>
						<c:forEach items="${title }" var="job">
							<option value="${job.title }">${job.title }</option>
						</c:forEach>
					</select>
					<button class="btn float-right btn-primary" id="emailsend"
						style="margin-right: 15px; margin-top: 3px;">이메일 보내기</button>
				</div>


			</div>
		</div>


		<div class="row">
			<div class="col-12 mt-5">
				<table class="table table-hover" id=resultTable>
					<thead style="background-color: #eee;">
						<tr>
							<th class="text-center align-middle"><input type="checkbox"
								name="checkAll" aria-label="Checkbox for following text input"
								style="width: 18px; height: 18px;" class="align-middle"></th>
							<th class="text-center">번호</th>
							<th class="text-center">공 고 명</th>
							<th class="text-center">직무</th>
							<th class="text-center">지원 일자</th>
							<th class="text-center">지원자</th>
							<th class="text-center">처리 상태</th>
							<th class="text-center">이메일 발송</th>
							<th hidden></th>
							<th hidden></th>

						</tr>
					</thead>
					<tbody>
						<!-- 						<tr> -->
						<!-- 							<td scope="row" class="text-center align-middle"><input -->
						<!-- 								type="checkbox" aria-label="Checkbox for following text input" -->
						<!-- 								style="width: 18px; height: 18px;" class="align-middle"></td> -->
						<!-- 							<th scope="row" class="text-center align-middle">20</th> -->
						<!-- 							<td class="text-center align-middle">경력 사원 입사지원서</td> -->
						<!-- 							<td class="text-center align-middle">직무</td> -->
						<!-- 							<td class="text-center align-middle">18.08.23</td> -->
						<!-- 							<td class="text-center align-middle">문재환</td> -->
						<!-- 							<td class="text-center"><button type="button" -->
						<!-- 									class="btn btn-secondary btn-sm">합격</button></td> -->
						<!-- 							<td class="text-center"><button type="button" -->
						<!-- 									class="btn btn-secondary btn-sm">발송</button></td> -->
						<!-- 						</tr> -->
					</tbody>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<ul class="pagination" id="resultPagination">
				</ul>
			</div>
		</div>
<%-- 		<%@ include file="../util/supportpaging.jsp"%> --%>

	</div>
</div>



<%@ include file="../include/scriptLoader.jsp"%>

<script>



	var page = 1; //현재 페이지
	var limit = 20; //목록 갯수
	var pageCount = 5; //페이지 수

	$(function() {
		resultList(page);
		
		$('#pass').val();
		$('#fail').val();
		$("#title").val("0").prop("selected", true);
		
		$('#pass').on('click').click(function (pass) {
			resultList(1);
		});
		
		$('#fail').on('click').click(function (fail) {
			resultList(1);
		});
		$('#title').unbind('click').click(function (title) {
			resultList(1);
	});
});
	
	
	
function resultList(page) {
	if (!page) {
		page = 1;
	}
		
	var param = {
			pass				: $('#pass:checked').val(),
			fail				: $('#fail:checked').val(),
			title				: $('#title').val(),
			page 				: page,
			limit 				: limit,
			pageCount 			: pageCount,
	};
	
	
	//ajax 호출
	$.getJSON('/result/search', param, function (result) {
		
		if (result) {
			//목록 초기화
			$('#resultTable tbody').empty();
			//목록 생성
			console.log(result.list);
			$.each(result.list, function (i, item) {
				var html  = '<tr>';
					html += '<td scope="row" class="text-center align-middle"><input type="checkbox" name="checkOne" aria-label="Checkbox for following text input"style="width: 18px; height: 18px;" class="align-middle"></td>';
					html += '	<th scope="row" class="text-center align-middle">' + (i+1) + '</th>';
					html += '	<td class="text-center align-middle title">' + item.title + '</td>';
					html += '	<td class="text-center align-middle">' + item.task + '</td>';
					html += '	<td class="text-center align-middle">' + item.supportDate + '</td>';
					html += '	<td class="text-center align-middle username">' + item.username + '</td>';
					if(item.pass=="합격"){
					html += '	<td class="text-center pass"><span class="badge badge-success" style="height:32px; padding-top:0.8em; font-size: 0.8203125rem;">' + item.pass + '</span></td>';
					} else if(item.pass=="불합격"){
					html += '	<td class="text-center pass"><span class="badge badge-danger" style="height:32px; padding-top:0.8em; font-size: 0.8203125rem;">' + item.pass + '</span></td>';
					} else {
					html += '	<td class="text-center pass"><span class="badge badge-secondary" style="height:32px; padding-top:0.8em; font-size: 0.8203125rem;">' + item.pass + '</span></td>';
					}
					if(item.emailSend=="발송"){
					html += '	<td class="text-center emailsend"><span class="badge badge-info" style="height:32px; padding-top:0.8em; font-size: 0.8203125rem;">' + item.emailSend + '</span></td>';
					} else if(item.emailSend=="미발송"){
					html += '	<td class="text-center emailsend"><span class="badge badge-warning" style="height:32px; padding-top:0.8em; font-size: 0.8203125rem;">' + item.emailSend + '</span></td>';
					} else {
					html += '	<td class="text-center emailsend"><span class="badge badge-secondary" style="height:32px; padding-top:0.8em; font-size: 0.8203125rem;">' + item.emailSend + '</span></td>';
					}
					html += '	<td hidden class="userId">' + item.userId + '</td>';
					html += '	<td hidden class="passNo">' + item.passNo + '</td>';
					html += '</tr>';
				$('#resultTable tbody').append(html);
			});
			
			if (result.list.length == 0) {
				$('#resultTable tbody').append('<tr><td colspan="7" class="text-center">정보가 없습니다.</td></tr>');
			}
		}
		
		//paging
		paging(page, limit, result.totalCount, pageCount, resultList);
			
		});
	}
//ajax 페이징 처리 함수
function paging (page, limit, totalCount, pageCount, callback) {
	var firstPage 	= 1;
	var lastPage 	= Math.ceil(totalCount / limit);
	var endPage 	= Math.ceil(Number(page / pageCount)) * pageCount;
		endPage 	= endPage > lastPage ? lastPage : endPage;
	var startPage 	= (endPage - pageCount) + 1;
		startPage	= startPage < firstPage ? firstPage : startPage;
	
	$('#resultPagination').empty();
	
	var html = '';
	//Prev 있을 때
	if (firstPage < startPage) {
		html += '<li id="prevBtn">';
		html += '	<button class="page-link" data-curPage="" aria-label="Next">';
		html += '		<span aria-hidden="true">&laquo;</span>';
		html += '	</button>';
		html += '</li>';	
	}
	
	for (var i = startPage; i <= endPage; i++) {
		//현재 페이지
		if (i == page) {
			html += '<li class="page-item active page_btn">';
			html += '	<button class="page-link" data-curPage="' + page + '">' + page + '</button>';
			html += '</li>';
		} else {
			html += '<li class="page-item page_btn">';
			html += '	<button class="page-link" data-curPage="' + i + '">' + i + '</button>';
			html += '</li>';
		}
	}
	
	//Next 있을 때
	if (endPage < lastPage) {
		html += '<li id="nextBtn">';
		html += '	<button class="page-link" data-curPage="" aria-label="Next">';
		html += '		<span aria-hidden="true">&raquo;</span>';
		html += '	</button>';
		html += '</li>';		
	}
	
	$('#resultPagination').append(html);
	
	$('.page_btn').unbind('click').click(function () {
		page = $(this).find('button').attr('data-curPage');
		callback(page);
	});
	
	//Prev Event
	$('#prevBtn').unbind('click').click(function () {
		page = startPage == 1 ? 1 : startPage - 1;
		callback(page);
	});
	
	//Next Event
	$('#nextBtn').unbind('click').click(function () {
		page = endPage + 1;
		callback(page);
	});
}

//체크박스 전체 선택하기, 해제하기
$("#resultTable").on("click", "[name=checkAll]", function(){
	$("[name=checkOne]").prop("checked", $(this).prop("checked") );
});

// 개별 체크박스 선택 시
$("#resultTable").on("click", "[name=checkOne]", function() {
	
	if( $(this).prop("checked") ) {
		checkBoxLength = $("[name=checkOne]").length;
		checkedLength = $("[name=checkOne]:checked").length;
	
		if( checkBoxLength == checkedLength ) {
			$("[name=checkAll]").prop("checked", true);
		} else {
			$("[name=checkAll]").prop("checked", false);
		}
	} else {
		// 하나라도 해제가 되면 전체 버튼은 해제
		$("[name=checkAll]").prop("checked", false);	
	}
});


portModal();

function portModal() {
	// Get the modal
	var modal = document.getElementById("portModal");
	// Get the button that opens the modal
	var btn = document.getElementById("emailsend");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	var btnClose = document.getElementById("btnClose");

	var btnOk = document.getElementById("btnOk");

	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
		
		var emailsend = [];
		var pass = [];
		
		
		var $emailsend = $("input[name=checkOne]:checked").parents().children(".emailsend");
		
		var $pass = $("input[name=checkOne]:checked").parents().children(".pass");
		
		$emailsend.each(function(i){
			 emailsend.push($(this).text()); 
		});
		
		$pass.each(function(){
			pass.push($(this).text());
		});
		
		for(var i=0; i<emailsend.length; i++){
			if(emailsend[i]=='발송'){
				var modald = document.getElementById("portModal");
			 	modald.style.display = "block";
				var spand = document.getElementsByClassName("close")[0];

				spand.onclick = function() {
					modald.style.display = "none";
				}
				
				$("#btnOk").remove();
				
				$('#modalcontent').html("이미 발송 완료된 지원결과가 존재합니다.");
				$('#btnClose').click(function(){
					modald.style.display = "none";
					location.href="/result/list";
				});
			}
			console.log(pass[i]);
			if(pass[i]=='처리 전'){
				var modald = document.getElementById("portModal");
			 	modald.style.display = "block";
				var spand = document.getElementsByClassName("close")[0];

				spand.onclick = function() {
					modald.style.display = "none";
				}
				
				$("#btnOk").remove();
				
				$('#modalcontent').html("합격 여부가 정해지지 않은 처리결과가 존재합니다.");
				$('#btnClose').click(function(){
					modald.style.display = "none";
					location.href="/result/list";
				});
			}
			
			
		}
		
		if(emailsend.length==0){
			var modald = document.getElementById("portModal");
		 	modald.style.display = "block";
			var spand = document.getElementsByClassName("close")[0];

			spand.onclick = function() {
				modald.style.display = "none";
			}
			
			$("#btnOk").remove();
			
			$('#modalcontent').html("선택한 지원결과가 없습니다.");
			$('#btnClose').click(function(){
				modald.style.display = "none";
				location.href="/result/list";
			});
		}
		
		modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

	btnClose.onclick = function() {
		modal.style.display = "none";
	}
	
		$('#modalcontent').html("이메일을 전송하시겠습니까?");
	
		btnOk.onclick = function() {
		var title = [];
		var userId = [];
		var username = [];
		var pass = [];
		var passNo = [];
		
		 var $title = $("input[name=checkOne]:checked").parents().children(".title");
		 var $userId = $("input[name=checkOne]:checked").parents().children(".userId");
		 var $username = $("input[name=checkOne]:checked").parents().children(".username");
		 var $pass = $("input[name=checkOne]:checked").parents().children(".pass");
		 var $passNo = $("input[name=checkOne]:checked").parents().children(".passNo");
		 
		 
		 $title.each(function(i){
			 title.push($(this).text());
		 });
		 
		 $userId.each(function(i){
			 userId.push($(this).text()); 
		 });
		 
		 $username.each(function(i){
			 username.push($(this).text()); 
		 });
		 
		 $pass.each(function(i){
			 pass.push($(this).text()); 
		 });
		 
		 $passNo.each(function(i){
			 passNo.push($(this).text()); 
		 });
		 
		 	var modal = document.getElementById("portModal");
		 	modal.style.display = "block";
			var span = document.getElementsByClassName("close")[0];

			span.onclick = function() {
				modal.style.display = "none";
			}
			
			$('#modalcontent').html("잠시만 기다려 주십시오. . . . ");
			$('#btnClose').attr("disabled", "disabled");
		
			
		 $.ajax({
	         type:"post",
	         url:"/result/emailsend",
	         data:{"userId":userId, "title":title, "username":username, "pass":pass, "passNo" : passNo},
	         dataType:"text",
	         success:function(data){  
	        		var modal = document.getElementById("portModal");
					modal.style.display = "block";
	        		var span = document.getElementsByClassName("close")[0];
	        		var btnClose = document.getElementById("btnClose");

	        		span.onclick = function() {
	        			modal.style.display = "none";
	        		}

	        		btnClose.onclick = function() {
	        			modal.style.display = "none";
	        			location.href="/result/list";
	        		}
	        		
	        			$('#modalcontent').html("이메일 전송을 성공하였습니다.");
	        			$("#btnClose").removeAttr("disabled");
	        			$("#btnOk").remove();
	        			
	         }
	      });

	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
}
	
</script>

<%@ include file="../include/footer.jsp"%>