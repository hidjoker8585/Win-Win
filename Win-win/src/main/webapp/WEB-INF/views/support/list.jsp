<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>

<style>
#test tr td {
	padding: 0px;
}

.box {
	border: 1px solid #5bc0de;
	/* 	background-color: ; */
	line-height: 40px;
	float: left;
	margin-left: 15px;
	margin-top: 10px;
}

.remove-class {
	display: none;
}

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
	top:10px;
}

.closeCheck:hover, .closeCheck:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}



</style>

<script>

	var page = 1; //현재 페이지
	var limit = 20; //목록 갯수
	var pageCount = 5; //페이지 수
	var portId=null;
	var userId=null;

	$(function() {
		supportList(page);

		//이벤트 누적 방지 ( 이전 이벤트를 삭제하고 새 이벤트 주입. unbind)
		$('.searchSelect').unbind('click').click(function() {
			$('#' + $(this).attr('forId')).html($(this).val() + "<i class='fas fa-backspace ml-2' id='careerclose' style='cursor: pointer'></i>").show();
		});

		//선택된 검색 항목 지우기
		$('.remove-class').unbind('click').click(function() {
			$('#' + $(this).attr('forId') + ' option').prop('selected', false);
			$(this).html('');
			$(this).hide();
			//property	속성 값 true / false
			//attribute key, value 
			supportList(1);
		});

		$("#career option:selected").val();

		//초기화 event
		$("#clear").click(function() {

			var clear = $("#clear").val();

			$(".box").hide();

			$("#title").val("0").prop("selected", true);
			//property	속성 값 true / false
			//attribute key, value 
			$('.searchSelect option').prop('selected', false);
			supportList(1);
		});
		
		//검색 event
		$('#search').unbind('click').click(function () {
			supportList(1);
		});
		
		
		// X버튼 위치 고정 
		$(".modal-contentCheck").scroll(function() {
			$("#CloseMenu").css("top", $(".modal-contentCheck").scrollTop());
		});
	});

	function supportList(page) {
		if (!page) {
			page = 1;
		}
		
		//select box가 multiple일 경우는 $('#career option:selected').val() 을 넣어야 함. (배열로 받아짐)
		//select box가 일반일 경우는 $('#career').val()
		var param = {
			career 			: $('#career option:selected').val(), //경력
			employment 		: $('#employment option:selected').val(), //고용형태
			academiccareer 	: $('#academiccareer option:selected').val(), //학력
			credit 			: $('#credit option:selected').val(), //학점
			language 		: $('#language option:selected').val(), //토익
			status 			: $('#status option:selected').val(), //처리상태
			title			: $('#title').val(),
			page 			: page,
			limit 			: limit,
			pageCount 		: pageCount,
		};

		//ajax 호출
		$.getJSON('/support/search', param, function(result) {
			if (result) {
				//목록 초기화
				$('#supportTable tbody').empty();
				
				//목록 생성 
				$.each(result.list, function(i, item) {
					var html = '<tr>';
						html += '	<th scope="row" class="text-center align-middle">'+ (i + 1) + '</th>';
						html += '	<td class="text-center align-middle titleBtn" status="'+item.status+'" userId="' + item.userId + '" jobNo="' + item.jobOpenNo + '" style="cursor:pointer">'+ item.title + '</td>';
						html += '	<td class="text-center align-middle">'+ item.task + '</td>';
						html += '	<td class="text-center align-middle">' + item.supportDate + '</td>';
						html += '	<td class="text-center align-middle">' + item.username + '</td>';
						html += '	<td class="text-center"><button type="button" class="btn btn-primary btn-sm modalBtn">포트폴리오</button></td>';
						html += '	<td class="text-center"><span class="badge badge-secondary" style="height:32px; padding-top:0.8em; font-size: 0.8203125rem;">' + item.status + '</span></td>';
						html += '	<td hidden class="userId">' + item.userId + '</td>';
						
						html += '</tr>';

					$('#supportTable tbody').append(html);
				});
				
				if (result.list.length == 0) {
					$('#supportTable tbody').append('<tr><td colspan="7" class="text-center">정보가 없습니다.</td></tr>');
				}
			}
			
			//paging
			paging(page, limit, result.totalCount, pageCount, supportList);
			
			portModal();
			
			//상세 보기
			$('.titleBtn').unbind('click').click(function () {
				
				var param = {
						userId 	: $(this).attr('userId'),
						jobopenNo 	: $(this).attr('jobNo'),
						status : $(this).attr('status')
				};
				
				$.post('/support/detail', param, function (result) {
					//한글명
					$('#userName').html(result.mem.username);
					$('#eName').html(result.user.eName);
					$('#userId').html(result.user.userId);
					$('#birth').html(result.user.birth);
					$('#address').html(result.user.zipCode +  ', \t' + result.user.address + ', \t' + result.user.addressDetail);
					$('#phoneNum').html(result.user.phoneNum);
					$('#phone').html(result.mem.phone);
					if(result.high!=null){
					$('#hsName').html(result.high.hsName + '\t' + result.high.hsDay);
					$('#hsMajor').html(result.high.hsMajor);
					$('#hsEndDate').html(result.high.hsEndDate + '\t' + result.high.hsGraduate);
					$('#hsRegion').html(result.high.hsRegion);
					}
					if(result.high==null){
						$('#hsName').html("");
						$('#hsMajor').html("");
						$('#hsEndDate').html("");
						$('#hsRegion').html("");
					}
					if(result.col!=null){
					$('#colName').html(result.col.colName + '\t' + result.col.colBranch + '\t' + result.col.colDay);
					$('#colMajor').html(result.col.colMajor + '\t' + result.col.colScore + '\t' + '/' + '\t' + 
						result.col.colTotalScore);
					$('#colStartDate').html(result.col.colStartDate + '\t' + result.col.colTransfer + '\t' 
							+ result.col.colEndDate + '\t' + result.col.colGraduate);
					$('#colRegion').html(result.col.colRegion);
					}
					if(result.col==null){
						$('#colName').html("");
						$('#colMajor').html("");
						$('#colStartDate').html("");
						$('#colRegion').html("");
					}
					if(result.uni!=null){
					$('#univName').html(result.uni.univName + '\t' + result.uni.univBranch + '\t' + result.uni.univDay);
					$('#univMajor').html(result.uni.univMajor + '\t' + result.uni.univMinor + '\t' + result.uni.univScore + '\t' + 
						'/' + '\t' + result.uni.univTotalScore);
					$('#univStartDate').html(result.uni.univStartDate + '\t' + result.uni.univTransfer+ '\t' 
							+ result.uni.univEndDate + '\t' + result.uni.univGraduate);
					$('#univRegion').html(result.uni.univRegion);			
					}
					if(result.uni==null){
						$('#univName').html("");
						$('#univMajor').html("");
						$('#univStartDate').html("");
						$('#univRegion').html("");
					}
					if(result.gs!=null){
					$('#gsName').html(result.gs.gsName + '\t' + result.gs.gsBranch + '\t' + result.gs.gsDay);
					$('#gsMajor').html(result.gs.gsMajor + '\t' + result.gs.gsScore + '\t' + '/' + '\t' + result.gs.gsTotalScore);
					$('#gsEndDate').html(result.gs.gsEndDate + '\t' + result.gs.gsGraduate);
					$('#gsRegion').html(result.gs.gsRegion);
					}
					if(result.gs==null){
						$('#gsName').html("");
						$('#gsMajor').html("");
						$('#gsEndDate').html("");
						$('#gsRegion').html("");
					}
					if(result.mil.mCategory!=null){ 
					$('#discharge').html(result.mil.discharge);
					$('#startDate').html(result.mil.startDate + '\t' + '~' + '\t' + result.mil.endDate);
					$('#mCategory').html(result.mil.mCategory);
					$('#mGrade').html(result.mil.mGrade);
					} if (result.mil.mCategory==null){
						$('#discharge').html(result.mil.discharge);
						$('#startDate').html("");
						$('#mCategory').html("");
						$('#mGrade').html("");
					}
					if(result.lang!=null){
						$('#lName tbody').empty();
					$.each(result.lang, function(i, item) {
						var html = '<tr>';
							html += '	<td class="text-center align-middle">' + item.lName + '</td>';
							html += '	<td class="text-center align-middle">' + item.grade + '</td>';
							html += '	<td class="text-center align-middle">' + item.testName + '</td>';
							html += '	<td class="text-center align-middle">' + item.score + '</td>';
							html += '	<td class="text-center align-middle">' + item.lDate + '</td>';
							html += '	<td class="text-center align-middle">' + item.lOrgan + '</td>';
							html += '</tr>';
					
						$('#lName tbody').append(html);
					});
					} 
					if (result.lang==null){
						$('#lName tbody').empty();
						$.each(result.lang, function(i, item) {
							var html = '<tr>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '</tr>'; 
								
								$('#lName tbody').append(html);
						});
					}
					if(result.lic!=null){
						$('#liName tbody').empty();
					$.each(result.lic, function(i, item) {
						var html = '<tr>';
							html += '	<td class="text-center align-middle">' + item.liName + '</td>';
							html += '	<td class="text-center align-middle">' + item.liDate + '</td>';
							html += '	<td class="text-center align-middle">' + item.liOrgan + '</td>';
							html += '</tr>';
					
						$('#liName tbody').append(html);
					});
					} 
					if (result.lic==null){
						$('#liName tbody').empty();
						$.each(result.lic, function(i, item) {
							var html = '<tr>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '</tr>'; 
								
								$('#liName tbody').append(html);
						});
					}
					if(result.car!=null){
						$('#cStartDate tbody').empty();
					$.each(result.car, function(i, item) {
						var html = '<tr>';
							html += '	<td class="text-center align-middle">' + item.cStartDate + '\t' + '~' + '\t' + item.cEndDate + '</td>';
							html += '	<td class="text-center align-middle">' + item.cName + '</td>';
							html += '	<td class="text-center align-middle">' + item.position + '</td>';
							html += '	<td class="text-center align-middle">' + item.task + '</td>';
							html += '	<td class="text-center align-middle">' + item.salary + '</td>';
							html += '	<td class="text-center align-middle">' + item.cContent + '</td>';
							html += '</tr>';
					
						$('#cStartDate tbody').append(html);
					});
					} 
					if (result.car==null){
						$('#cStartDate tbody').empty();
						$.each(result.car, function(i, item) {
							var html = '<tr>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '</tr>'; 
								
								$('#cStartDate tbody').append(html);
						});
					}
					if(result.act!=null){
						$('#aName tbody').empty();
					$.each(result.act, function(i, item) {
						var html = '<tr>';
							html += '	<td class="text-center align-middle">' + item.aName + '</td>';
							html += '	<td class="text-center align-middle">' + item.aStartDate + '\t' + '~' + '\t' + item.aEndDate + '</td>';
							html += '	<td class="text-center align-middle">' + item.aContent + '</td>';
							html += '</tr>';
					
						$('#aName tbody').append(html);
					});
					} 
					if (result.act==null){
						$('#aName tbody').empty();
						$.each(result.act, function(i, item) {
							var html = '<tr>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '</tr>'; 
								
								$('#aName tbody').append(html);
						});
					}
					if(result.exp!=null){
						$('#eOption tbody').empty();
					$.each(result.exp, function(i, item) {
						var html = '<tr>';
							html += '	<td class="text-center align-middle">' + item.eOption + '</td>';
							html += '	<td class="text-center align-middle">' + item.eOrgan + '</td>';
							html += '	<td class="text-center align-middle">' + item.eStartDate + '\t' + '~' + '\t' + item.eEndDate + '</td>';
							html += '	<td class="text-center align-middle">' + item.eContent + '</td>';
							html += '</tr>';
					
						$('#eOption tbody').append(html);
					});
					} 
					if (result.exp==null){
						$('#eOption tbody').empty();
						$.each(result.exp, function(i, item) {
							var html = '<tr>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '	<td class="text-center align-middle">' + " " + '</td>';
								html += '</tr>'; 
								
								$('eOption tbody').append(html);
						});
					}
					
					$('#content1').html(result.intro.content1);
					$('#content2').html(result.intro.content2);
					$('#content3').html(result.intro.content3);
					$('#content4').html(result.intro.content4);
					$('#content5').html(result.intro.content5);
				
					
				});
				
				$('#checkModal').show();
				titleModal(param);
			});
		});
	}

		function portModal() {
		// Get the modal
		var modal = document.getElementById("portModal");
		// Get the button that opens the modal
		var btn = document.getElementsByClassName("modalBtn");
		
		var $pModal = $('#pModal');
		

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		var btnClose = document.getElementById("btnClose");

		var btnOk = document.getElementById("btnOk");

		// When the user clicks on the button, open the modal 
// 			for (var i = 0; i < btn.length; i++) {
// 				btn[i].onclick = function() {				
// 					modal.style.display = "block";
					
// 			}
// 		}

		
		$('.modalBtn').click(function(){
			portId = $(this).parent().parent().children().eq(1).attr('jobNo');
			userId = $(this).parent().parent().children().eq(7).text();
			
			$.ajax({
				type:'post',
				url:'/support/list',
				data:{
					jobOpenNo : portId,
					userId : userId
				},
				dataType:'json',
				success: function(file){
					console.log(file);
					if(file.file==null){
						$('#portModal').css('display','block');
						$('#fileName').val("포트폴리오 없음.");
						$('#btnDown').prop('disabled', true);
					} else {

						console.log(file.file.originName);
						$('#portModal').css('display','block');
						$('#fileName').val(file.file.originName);
						$('#btnDown').prop('disabled', false);
					}
					
					
					
				}
			});
		});
		

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		btnClose.onclick = function() {
			modal.style.display = "none";
		}

		btnOk.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	}

	function titleModal(param) {
		//Get the modal
		
		
		var modal = document.getElementById('checkModal');
		// Get the button that opens the modal
		var btn = document.getElementsByClassName("titleBtn");
		
// 		var span = document.getElementsByClassName("close")[0]

		// Get the <span> element that closes the modal
		var span = document.getElementById("titleClose");                                          

		var modalPass = document.getElementById("modalPass");
		var modalFail = document.getElementById("modalFail");

		if(param.status=='처리 후'){
			modalPass.disabled = true;
			modalFail.disabled = true;
			$('#afterCheck').html('이미 처리된 지원입니다.');
		} else {
			modalPass.disabled = false;
			modalFail.disabled = false;
			$('#afterCheck').html('');
		}
		
		// When the user clicks on the button, open the modal 
		for (var i = 0; i < btn.length; i++) {
			btn[i].onclick = function() {
				modal.style.display = "block";
			}

			// When the user clicks on <span> (x), close the modal
			// span.onclick = function() {
			//     modal.style.display = "none";
			// }
			span.onclick = function() 	{
			modal.style.display = "none";
			}

			modalPass.onclick = function() {
				passModal(param);

			}

			modalFail.onclick = function() {
				failModal(param);
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}
		}
	}

	function passModal(param) {
		// Get the modal
		var modal = document.getElementById("passModal");

		// Get the button that opens the modal
		var btn = document.getElementById("modalPass");
		var span = document.getElementById("passClose");   

		// Get the <span> element that closes the modal    

		var btnPass = document.getElementById("btnPass");
		var btnCancle = document.getElementById("btnCancle");

		// When the user clicks on the button, open the modal 

		modal.style.display = "block";
		
		span.onclick = function() 	{
			modal.style.display = "none";
			}


		btnCancle.onclick = function() {
			modal.style.display = "none";
		}

		btnPass.onclick = function() {
			console.log("합격 버튼");
			$.ajax({
				type:'post',
				url:'/support/pass',
				data:{
					userId : param.userId,
					jobopenNo : param.jobopenNo,
					status : '합격'
				},
				success:function(res){
					console.log("합격처리 완료");
					alert("합격 처리되었습니다!!");
					modal.style.display = "none";
					document.getElementById('checkModal').style.display='none';
					
					supportList();
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

	function failModal(param) {
		// Get the modal
		var modal = document.getElementById("failModal");

		// Get the button that opens the modal
		var btn = document.getElementById("modalFail");
		var span = document.getElementById("failClose");  

		// Get the <span> element that closes the modal    

		var btnFail = document.getElementById("btnFail");
		var btnCancle2 = document.getElementById("btnCancle2");

		// When the user clicks on the button, open the modal 
		modal.style.display = "block";
		
		span.onclick = function() 	{
			modal.style.display = "none";
			}


		btnCancle2.onclick = function() {
			modal.style.display = "none";
		}

		btnFail.onclick = function() {
			console.log("불합격");
			
			$.ajax({
				type:'post',
				url:'/support/pass',
				data:{
					userId : param.userId,
					jobopenNo : param.jobopenNo,
					status : '불합격'
				},
				success:function(res){
					console.log("불합격 처리 완료");
					alert("불합격 처리되었습니다!!");
					modal.style.display = "none";
					document.getElementById('checkModal').style.display='none';
					supportList();
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
	
//ajax 페이징 처리 함수
function paging (page, limit, totalCount, pageCount, callback) {
	var firstPage 	= 1;
	var lastPage 	= Math.ceil(totalCount / limit);
	var endPage 	= Math.ceil(Number(page / pageCount)) * pageCount;
		endPage 	= endPage > lastPage ? lastPage : endPage;
	var startPage 	= (endPage - pageCount) + 1;
		startPage	= startPage < firstPage ? firstPage : startPage;
	
	$('#supportPagination').empty();
	
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
	
	$('#supportPagination').append(html);
	
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
</script>

<%@ include file="../include/adminHeader.jsp"%>
<div class="container">
	<div class="container">
		<div class="row">
			<div class="col-12 mt-5">
				<p class="font-weight-bold h3">입사지원 현황</p>
				<hr style="border: solid #376092;">
			</div>
		</div>
		<div class="row">
			<div class="col-12 mt-5">

				<table class="table table-bordered">
					<thead style="background-color: #eee;">
						<tr>
							<th class="text-center">경력</th>
							<th class="text-center">고용형태</th>
							<th class="text-center">학력</th>
							<th class="text-center">대학 학점</th>
							<th class="text-center">TOEIC</th>
							<th class="text-center">처리상태</th>

						</tr>
					</thead>

					<tbody id="test">
						<tr>
							<td class="text-center" style="width: 12%"><select multiple
								class="form-control searchSelect" id="career" forId="careerbox"
								form="search" name="career">
									<option value="신입">신입</option>
									<option value="경력">경력</option>
							</select></td>
							<td class="text-center" style="width: 16%"><select multiple
								class="form-control searchSelect" id="employment"
								forId="employmentbox" form="search" name="employment">
									<option value="정규직">정규직</option>
									<option value="계약직">계약직</option>
									<option value="인턴">인턴</option>
									<option value="병역특례">병역특례</option>
							</select></td>
							<td class="text-center" style="width: 25%"><select multiple
								class="form-control searchSelect" id="academiccareer"
								forId="academiccareerbox" form="search" name="academiccareer">
									<option value="대학교졸업(4년)">대학교졸업(4년)</option>
									<option value="대학교졸업(2~3년)">대학교졸업(2~3년)</option>
									<option value="석사 이상">석사 이상</option>
									<option value="고등학교 졸업">고등학교 졸업</option>
									<option value="학력 무관">학력 무관</option>
							</select></td>
							<td class="text-center" style="width: 10%"><select multiple
								class="form-control searchSelect" id="credit" forId="creditbox"
								form="search" name="credit">
									<option value="2.0">2.0 이상</option>
									<option value="2.5">2.5 이상</option>
									<option value="3.0">3.0 이상</option>
									<option value="3.5">3.5 이상</option>
									<option value="4.0">4.0 이상</option>
							</select></td>
							<td class="text-center" style="width: 15%"><select multiple
								class="form-control searchSelect" id="language"
								forId="languagebox" form="search" name="language">
									<option value="500">500이상</option>
									<option value="600">600이상</option>
									<option value="700">700이상</option>
									<option value="800">800이상</option>
									<option value="850">850이상</option>
									<option value="900">900 이상</option>
									<option value="950">950 이상</option>
							</select></td>
							<td class="text-center" style="width: 10%"><select multiple
								class="form-control searchSelect" forId="statusbox" id="status"
								form="search" name="status">
									<option value="처리 전">처리 전</option>
									<option value="처리 후">처리 후</option>
							</select></td>
						</tr>


						<tr>
							<th class="text-center" colspan="1"
								style="background-color: #eee; padding: 0px; line-height: 2.5;">
								공고명</th>
							<td colspan="7"><select class="custom-select"
								style="width: 457px;" id="title" name="title" form="search">
									<option value="0" style="width: 457px">공고명을 선택해 주십시오!</option>
									<c:forEach items="${title }" var="job">
										<option value="${job.title }">${job.title }</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td colspan="8" style="height: 90px">
								<div class="row">
									<div class="col-10">
										<div class="box text-center remove-class" forId="career" id=careerbox
											style="width: 8em;"></div>
										<div class="box text-center remove-class" forId="employment" id=employmentbox
											style="width: 7em;"></div>
										<div class="box text-center remove-class" forId="academiccareer" id=academiccareerbox
											style="width: 14em;"></div>
										<div class="box text-center remove-class" forId="credit" id=creditbox
											style="width: 8em;"></div>
										<div class="box text-center remove-class" forId="language" id=languagebox
											style="width: 10em;"></div>
										<div class="box text-center remove-class" forId="status" id=statusbox
											style="width: 6em;"></div>
									</div>
									<div class="col-2 mt-2">
										<button
											class="btn float-right btn-sm btn-primary fas fa-redo	"
											style="margin-right: 15px" id="clear">&nbsp; 초기화</button>
									</div>
								</div>
								<div class="row">
									<div class="col-12 d-flex justify-content-end mt-1">
										<button class="btn float-right btn-primary" style="margin-right: 15px;" id="search">선택된 조건 검색하기</button>
									</div>
								</div>

							</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>


		<div class="row">
			<div class="col-12 mt-5">
				<table class="table table-hover" id="supportTable">
					<thead style="background-color: #eee;">
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">공 고 명</th>
							<th class="text-center">직무</th>
							<th class="text-center">지원 일자</th>
							<th class="text-center">지원자</th>
							<th class="text-center">포트폴리오</th>
							<th class="text-center">처리 상태</th>
							<th hidden></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<ul class="pagination" id="supportPagination">
				</ul>
			</div>
		</div>
		<%-- <%@ include file="../util/supportpaging.jsp"%> --%>
	</div>
</div>

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
			<div class="mt-4" style="text-align:center;">
				<span class="font-weight-bold" id="pModal">첨부파일 : </span>
				<input type="text" id="fileName" value="${file.originName }" readOnly>
				<button type="button" id="btnDown"class="btn btn-secondary" onclick="downFile();">다운로드</button>
			</div>
			<script>
			
				function downFile(){
					//1. portfolioId, userId 가저옴

					location.href="/support/download?userId="+userId+"&portfolioId="+portId;

				}
			
			</script>

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

<!-- The passModal -->
<div id="passModal" class="modal" style="z-index: 100;">

	<!-- Modal content -->
	<div class="modal-content">

		<div class="row">
			<div class="col-6">
				<span class="font-weight-bold h2 d-flex justify-content-start mt-3">WIN-WIN</span>
			</div>
			<div class="col-6">
				<span class="d-flex justify-content-end mt-1"><span
					id="passClose" class="closeCheck">&times;</span></span>
			</div>
		</div>
		<div class="mb-3" style="height: 4px; background-color: #376092"></div>

		<!-- 모달 내용 입력하는 부분 -->
		<div>
			<div class="mt-4">
				<p class="font-weight-bold text-center">합격 처리하시겠습니까?</p>
				<!--         <select id="license" class="js-example-basic-single" > -->
				<!-- 		</select> -->
			</div>

			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
					<button type="button" id="btnPass"
						class="font-weight-bold btn btn-primary mr-2 "
						style="background-color: #376092">확인</button>
					<button type="button" id="btnCancle"
						class="font-weight-bold btn btn-secondary">닫기</button>

				</div>
			</div>
		</div>

	</div>
</div>

<!-- The failModal -->
<div id="failModal" class="modal" style="z-index: 100;">

	<!-- Modal content -->
	<div class="modal-content">

		<div class="row">
			<div class="col-6">
				<span class="font-weight-bold h2 d-flex justify-content-start mt-3">WIN-WIN</span>
			</div>
			<div class="col-6">
				<span class="d-flex justify-content-end mt-1"><span
					id="failClose" class="closeCheck">&times;</span></span>
			</div>
		</div>
		<div class="mb-3" style="height: 4px; background-color: #376092"></div>

		<!-- 모달 내용 입력하는 부분 -->
		<div>
			<div class="mt-4">
				<p class="font-weight-bold text-center">불합격 처리하시겠습니까?</p>
				<!--         <select id="license" class="js-example-basic-single" > -->
				<!-- 		</select> -->
			</div>

			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
					<button type="button" id="btnFail"
						class="font-weight-bold btn btn-primary mr-2 "
						style="background-color: #376092">확인</button>
					<button type="button" id="btnCancle2"
						class="font-weight-bold btn btn-secondary">닫기</button>

				</div>
			</div>
		</div>

	</div>
</div>

<div class="modalCheck" id="checkModal">
	<div class="modal-contentCheck">

<div class="col-12 row ml-1" style="border-bottom: solid 2px #376092; background-color: white;" id="CloseMenu">
		
				<div class="d-flex justify-content-between mt-1" id="fixedSpan" style="width:100%">
					<h3 class="mt-3 font-weight-bold float">지원서 미리보기</h3>
					<span id="titleClose" class="closeCheck">&times; </span>
				</div>
		<div class="container">
			<div class="col-12 p-0 d-flex justify-content-center">
				<button class="btn btn-primary font-weight-bold mr-4"
					style="width: 80px; background-color: #376092" id="modalPass">합격</button>
				<button class="btn btn-danger font-weight-bold" style="width: 80px;"
					id="modalFail">불합격</button>
			</div>
			<div id="afterCheck" class="text-center mt-1 text-bold">
				
			</div>
		</div>
<!-- 		<hr class="ml-1" style="border: solid 2px #376092;">  -->
</div>
		<br>

		<div class="container mt-5">
			<h4 class="ml-2 font-weight-bold">개인사항</h4>
			<hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">
			<h6 class="ml-4 mt-5 font-weight-bold">기본정보</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
				<tbody>
					<tr>
						<th style="width: 15%;"
							class="text-center text-center align-middle bg-secondary">성명</th>
						<td style="width: 40%">
							<span id="userName"></span>
							&nbsp;/&nbsp; 
							<span id="eName"> </span>
						</td>
						<th class="text-center text-center align-middle bg-secondary">이메일</th>
						<td id="userId"></td>
					</tr>
					<tr>
						<th class="text-center text-center align-middle bg-secondary"
							style="width: 5%">생년월일</th>
						<td colspan="3" id="birth"></td>
					</tr>
					<tr>
						<th class="text-center text-center align-middle bg-secondary">주소</th>
						<td colspan="3" id="address"></td>
					</tr>
					<tr>
						<th class="text-center text-center align-middle bg-secondary">긴급연락처</th>
						<td colspan="3" id="phoneNum"></td>
					</tr>
					<tr>
						<th class="text-center text-center align-middle bg-secondary">휴대전화</th>
						<td colspan="3" id="phone"></td>
					</tr>
				</tbody>
			</table>

		</div>


		<div class="mt-5 container">
			<h4 class="ml-2 font-weight-bold">학력사항</h4>
			<hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">
			<h6 class="ml-4 mt-5 font-weight-bold">고등학교</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
				<tbody>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">학교명</th>
						<th class="text-center text-center align-middle">전공</th>
						<th class="text-center text-center align-middle">졸업년도</th>
						<th class="text-center text-center align-middle">지역</th>
					</tr>
					<tr style="line-height: 1.0em; height: 15px;">
						<td class="text-center align-middle" id = "hsName"></td>
						<td class="text-center align-middle" id = "hsMajor"></td>
						<td class="text-center align-middle" id = "hsEndDate"></td>
						<td class="text-center align-middle" id = "hsRegion"></td>
					</tr>
				</tbody>
			</table>

			<h6 class="ml-4 mt-5 font-weight-bold">전문대학</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
				<tbody>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">학교명</th>
						<th class="text-center text-center align-middle">전공</th>
						<th class="text-center text-center align-middle">재학기간</th>
						<th class="text-center text-center align-middle">지역</th>
					</tr>
					<tr style="line-height: 0.8em; height: 10px;">
						<td class="text-center align-middle" id="colName"></td>
						<td class="text-center align-middle" id="colMajor"></td>
						<td class="text-center align-middle" id="colStartDate"></td>
						<td class="text-center align-middle" id="colRegion"></td>
					</tr>
					<tbody>
					</tbody>
			</table>

			<h6 class="ml-4 mt-5 font-weight-bold">대학교</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
				<tbody>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">학교명</th>
						<th class="text-center text-center align-middle">전공</th>
						<th class="text-center text-center align-middle">졸업년도</th>
						<th class="text-center text-center align-middle">지역</th>
					</tr>
					<tr style="line-height: 0.8em; height: 10px;">
						<td class="text-center align-middle" id="univName"></td>
						<td class="text-center align-middle" id="univMajor"></td>
						<td class="text-center align-middle" id="univStartDate"></td>
						<td class="text-center align-middle" id="univRegion"></td>
					</tr>
				</tbody>
			</table>

			<h6 class="ml-4 mt-5 font-weight-bold">대학원</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
				<tbody>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">학교명</th>
						<th class="text-center text-center align-middle">전공</th>
						<th class="text-center text-center align-middle">졸업년도</th>
						<th class="text-center text-center align-middle">지역</th>
					</tr>
					<tr style="line-height: 0.8em; height: 10px;">
						<td class="text-center align-middle" id="gsName"></td>
						<td class="text-center align-middle" id="gsMajor"></td>
						<td class="text-center align-middle" id="gsEndDate"></td>
						<td class="text-center align-middle" id="gsRegion"></td>
					</tr>
				</tbody>
			</table>

		</div>

		<div class="mt-5 container">
			<h4 class="ml-2 font-weight-bold">병역사항</h4>
			<hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">
			<h6 class="ml-4 mt-5 font-weight-bold">병역정보</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
				<tbody>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">제대구분</th>
						<th class="text-center text-center align-middle">복무기간</th>
						<th class="text-center text-center align-middle">군별</th>
						<th class="text-center text-center align-middle">계급</th>
					</tr>
					<tr style="line-height: 0.8em; height: 10px;">
						<td class="text-center align-middle" id = "discharge"></td>
						<td class="text-center align-middle" id = "startDate"></td>
						<td class="text-center align-middle" id = "mCategory"></td>
						<td class="text-center align-middle" id = "mGrade"></td>
					</tr>
				</tbody>
			</table>

		</div>

		<div class="mt-5 container">
			<h4 class="ml-2 font-weight-bold">경력사항</h4>
			<hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">
			<h6 class="ml-4 mt-5 font-weight-bold">어학정보</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;" id="lName">
			<thead>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">외국어명</th>
						<th class="text-center text-center align-middle">회화수준</th>
						<th class="text-center text-center align-middle">공익시험명</th>
						<th class="text-center text-center align-middle">점수(또는 급)</th>
						<th class="text-center text-center align-middle">취득일</th>
						<th class="text-center text-center align-middle">주관처</th>
					</tr>
			</thead>
				<tbody>
				</tbody>
			</table>
			<h6 class="ml-4 mt-5 font-weight-bold">자격사항</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;" id="liName">
				<thead>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">자격증</th>
						<th class="text-center text-center align-middle">취득일</th>
						<th class="text-center text-center align-middle">주관처</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<h6 class="ml-4 mt-5 font-weight-bold">회사경력</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;" id="cStartDate">
				<thead>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">근무기간</th>
						<th class="text-center text-center align-middle">회사명</th>
						<th class="text-center text-center align-middle">직위</th>
						<th class="text-center text-center align-middle">담당업무</th>
						<th class="text-center text-center align-middle">연봉(만원)</th>
						<th class="text-center text-center align-middle">퇴직사유</th>
					</tr>
				</thead>
					<tbody>
				</tbody>
			</table>
			<h6 class="ml-4 mt-5 font-weight-bold">사회봉사활동</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;" id="aName">
				<thead>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">단체명</th>
						<th class="text-center text-center align-middle">기간</th>
						<th class="text-center text-center align-middle">설명</th>
					</tr>
					</thead>
					<tbody>
				</tbody>
			</table>
			<h6 class="ml-4 mt-5 font-weight-bold">연수경험</h6>
			<br>

			<table class="ml-4 mr-4 table border-secondary" style="width: 95%;" id="eOption">
				<thead>
					<tr style="line-height: 1.0em;">
						<th class="text-center text-center align-middle">구분</th>
						<th class="text-center text-center align-middle">연수기관</th>
						<th class="text-center text-center align-middle">기간</th>
						<th class="text-center text-center align-middle">설명</th>
					</tr>
					</thead>
					<tbody>
				</tbody>
			</table>

		</div>

		<div class="mt-5 container">
			<h4 class="ml-2 font-weight-bold">자기소개서</h4>
			<hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">

			<h6 class="mt-5 font-weight-bold">1. 성장과정 (자신에 대한 소개)</h6>
			<br>
			<textarea maxlength="500"
				style="width: 100%; resize: none; height: 250px;" readonly id="content1"></textarea>
			<h6 class="mt-5 font-weight-bold">2. 지원동기 및 포부</h6>
			<br>
			<textarea maxlength="500"
				style="width: 100%; resize: none; height: 250px;" readonly id="content2"></textarea>
			<h6 class="mt-5 font-weight-bold">3. 성격의 장단점</h6>
			<br>
			<textarea maxlength="500"
				style="width: 100%; resize: none; height: 250px;" readonly id="content3"></textarea>
			<h6 class="mt-5 font-weight-bold">4. 살아오면서 중요했던 일</h6>
			<br>
			<textarea maxlength="500"
				style="width: 100%; resize: none; height: 250px;" readonly id="content4"></textarea>
			<h6 class="mt-5 font-weight-bold">5. 보유기술 및 경험직무 (구체적으로 기술)</h6>
			<br>
			<textarea maxlength="500"
				style="width: 100%; resize: none; height: 250px;" readonly id="content5" class="mb-5"></textarea>

		</div>

<!-- 		<div class="container"> -->
<!-- 			<div class="col-12 mt-5 p-0 d-flex justify-content-center"> -->
<!-- 				<button class="btn btn-primary font-weight-bold mr-4" -->
<!-- 					style="width: 80px; background-color: #376092" id="modalPass">합격</button> -->
<!-- 				<button class="btn btn-danger font-weight-bold" style="width: 80px;" -->
<!-- 					id="modalFail">불합격</button> -->
<!-- 			</div> -->
<!-- 			<div id="afterCheck" class="text-center mt-3 text-bold"> -->
				
<!-- 			</div> -->
<!-- 		</div> -->

	</div>
</div>

<%@ include file="../include/scriptLoader.jsp"%>

<%@ include file="../include/footer.jsp"%>