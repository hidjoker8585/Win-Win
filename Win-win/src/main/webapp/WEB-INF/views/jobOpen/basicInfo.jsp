<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>

<link rel="stylesheet" href="/resources/jobopen.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ include file="../include/adminHeader.jsp"%>


<div class="container">
	<div class="row m-3 justify-content-center">
		<div style="width: 680px; height: 101px; border:1px solid #376092;">
			<div class="box text-light text-center" style="background-color: #376092;"><strong>기본정보</strong></div>
			<div class="triangle-left-primary"></div>
			<div class="boxm text-primary text-center pl-5"><strong>세부정보</strong></div>
			<div class="line"></div>
			<div class="box text-primary text-center"><strong>등록하기</strong></div>
		</div>		
	</div>
	<div class="row clearfix m-2">
		<div class="col-10"></div>
		<div class="col-2">
			<i class="fas fa-key"></i><small>&nbsp;사원 코드 : ${sessionScope.admincode }</small><br>
			<i class="far fa-id-card"></i><small>&nbsp;사원 이름 : ${sessionScope.adminname }</small>
		</div>
	</div>
</div>
	


<div class="container-fluid">

	<div class="row justify-content-center">
		<div class="col-auto">
			<div class="border border-info text-info p-5">채용 공고 만들기 입니다.   채용의 목적에 맞게 내용을 작성해주세요.</div>
		</div>
	</div>

			
			
	<div class="row justify-content-center mt-5">
		<div class="col-8">
			<form action="/jobOpen/basicInfo" method="post" id="formId">
				<div class="form-inline m-3">
				    <div class="col-2">
				      <label for="title">공고 제목</label>
				    </div>
				    <div class="col-10">
				      <input type="text" id="title" class="form-control" style="width:680px" name="title" required/>
				    </div>
			    </div>
			    
				<div class="form-inline m-3">
				    <div class="col-2">
				      	<label>모집 구분</label>
				    </div>
				    <div class="col-2">
				    	<div class="form-check-inline">
					    	<input type="checkbox" class="form-check-input" id="classify_new" name="offer" value="신입" checked>
							<label class="form-check-label" for="classify_new">신입</label>
						</div>
					</div>
					<div class="col-2">
						<div class="form-check-inline">
							<input type="checkbox" class="form-check-input" id="classify_exp" name="offer" value="경력">
							<label class="form-check-label" for="classify_exp">경력</label>
						</div>
				    </div>
			    </div>
			    
			    <div class="form-inline m-3 mt-4">
			    	<div class="col-2">
			    		<label>고용 형태</label>
			    	</div>
			    	<div class="col-2">
			    		<div class="form-check-inline">
			    			<input type="checkbox" class="form-check-input" id="permanent" name="form" value="정규직" checked>
							<label class="form-check-label" for="permanent">정규직</label>
			    		</div>
			    	</div>
			    	<div class="col-2">
			    		<div class="form-check-inline">
			    			<input type="checkbox" class="form-check-input" id="contract" name="form" value="계약직">
							<label class="form-check-label" for="contract">계약직</label>
			    		</div>
			    	</div>
			    	<div class="col-2">
			    		<div class="form-check-inline">
			    			<input type="checkbox" class="form-check-input" id="intern" name="form" value="인턴" >
							<label class="form-check-label" for="intern">인턴</label>
			    		</div>
			    	</div>
			    	<div class="col-2">
			    		<div class="form-check-inline">
			    			<input type="checkbox" class="form-check-input" id="military" name="form" value="병역특례" >
							<label class="form-check-label" for="military">병역특례</label>
			    		</div>
			    	</div>
			    </div>

			    
			    <div class="form-inline mt-3 ml-3 mr-3 mb-2">
			    	<div class="col-2">
			    		<label>급&emsp;&emsp;&nbsp;여</label>
			    	</div>
			    	<div class="col-3" >
			    		<div class="form-check-inline">
			    			<input type="checkbox" class="form-check-input" id="rulePay" name="rulePay" value="회사 내규에 따름" checked>
							<label class="form-check-label" for="rulePay">회사 내규에 따름</label>
			    		</div>
			    	</div>
			    	<div class="col-7">
			    		<div class="form-check-inline">
			    			<a id="payCheck" style="cursor:pointer; text-decoration: underline;" class="m-2 text-black-50">급여 지정하기</a>
			    			<!-- 급여지정 지웠다 켜졌다 하기 -->
			    			<div id="pay" style="visibility: hidden;">
			    				<input type="number" id="startPay" name="startPay" class="form-control input-sm" style="height:30px; width:100px;"/> 만원
			    				~
			    				<input type="number" id="endPay" name="endPay" class="form-control input-sm" style="height:30px; width:100px;"/> 만원
			    			</div>
			    		</div>
			    	</div>
			    </div>
			    
			    <div class="form-inline ml-3 mr-3 mb-3">
			    	<div class="col-2">
			    		<label>접수 기간</label>
			    	</div>
			    	<div class="col-3" >
			    		<div class="form-check-inline">
			    			<input type="checkbox" class="form-check-input" id="allOpen" name="allOpen" value="상시 채용" checked>
							<label class="form-check-label" for="allOpen">상시 채용</label>
			    		</div>
			    	</div>
			    	<div class="col-7">
			    		<div class="form-check-inline">
			    			<a id="openCheck" style="cursor:pointer; text-decoration: underline;" class="m-2 text-black-50">날짜 지정하기</a>
			    			<!-- 날짜지정 지웠다 켜졌다 하기 -->
			    			<div id="open" style="visibility:hidden">
			    				<input id="startOpen" name="startDate" type="text" class="form-control input-sm openDate" readOnly style="height:30px; width:150px;" required/>
			    				~
			    				<input id="endOpen" name="endDate" type="text" class="form-control input-sm openDate" readOnly style="height:30px; width:150px;" required/>
			    			</div>
			    		</div>
			    	</div>
			    </div>
			    
			    
			    <div class="form-inline mt-5 d-flex justify-content-center" >
			    	<button type="button" id="btnOk" class="btn btn-info mr-3">저장하고 계속하기</button><button type="button" id="btnCancel" class="btn btn-secondary">취소</button>
			    </div>
			</form>
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
					<button type="button" id="btnClose" class="font-weight-bold btn btn-primary mr-1" style="background-color: #376092">확인</button>
					<button type="button" id="btnNo" class="font-weight-bold btn btn-primary" style="background-color: #376092">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>



<%@ include file="../include/scriptLoader.jsp"%>

<script>
$(function(){
	
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	
	$("#startOpen").datepicker(
			{
				showOn : "button", 
				buttonImage : "/resources/image/cal.png", 
				buttonImageOnly : true,
				buttonText : "달력",
				changeMonth : true,
				changeYear : true,
				minDate : 0,
				maxDate : "+14d",
				onClose:function(i){
					$("#endOpen").datepicker("option","minDate",i);
				}
			});
	
	$("#startOpen").datepicker("option", "dateFormat", "yy-mm-dd");
		
	$("#endOpen").datepicker(
			{
				showOn : "button", 
				buttonImage : "/resources/image/cal.png", 
				buttonImageOnly : true, 
				buttonText : "달력",
				changeMonth : true,
				changeYear : true,
				minDate:0
			});
	
	$("#endOpen").datepicker("option", "dateFormat", "yy-mm-dd");
	

});

$(document).ready(function(){
	
	$("#btnCancel").click(function(){
		var modal = document.getElementById('myModal');
		modal.style.display = "block";
		var span = document.getElementsByClassName('close')[0];
		var btnClose = document.getElementById('btnClose');
		var btnNo = document.getElementById('btnNo');
		
		$('#idChecking').html("작성을 취소하시겠습니까?");
		
		span.onclick = function(){
			modal.style.display = "none";
		}
		btnClose.onclick = function(){
			modal.style.display = "none";
			location.href="/main/adminmain";
		}
		btnNo.onclick = function(){
			modal.style.display = "none";
		}
	});
	
	
	$("#payCheck").click(function(){
		if($('#pay').css('visibility') == 'hidden'){
			    $('#pay').css('visibility','visible');
			    $('#rulePay').prop("checked",false);
			   
		} else {
			    $('#pay').css('visibility','hidden');
			    $('#pay input').val("");
			    $('#rulePay').prop("checked",true);
		}
	});
	
	$('input[type="checkbox"][id="rulePay"]').change(function(){
		if($(this).is(":checked")){
			$('#pay').css('visibility','hidden');
			$('#pay input').val("");
		}
	});
	
	
	
	$("#openCheck").click(function(){
		if($('#open').css('visibility') == 'hidden'){
			    $('#open').css('visibility','visible');
			    $('#allOpen').prop("checked",false);
			   
		} else {
			    $('#open').css('visibility','hidden');
			    $('#open input').val("");
			    $('#allOpen').prop("checked",true);
		}
	});
	
	$('input[type="checkbox"][id="allOpen"]').change(function(){
		if($(this).is(":checked")){
			$('#open').css('visibility','hidden');
			$('#open input').val("");
		}
	});
	
	$('input[type="checkbox"][id="rulePay"]').click(function(){
		if(!$("#rulePay").is(":checked")){
			$('#pay').css('visibility','visible');
		} else {
			$('#pay').css('visibility','hidden');
			$('#pay input').val("");
		}
	});
	
	$('#allOpen').click(function(){
		if(!$("#allOpen").is(":checked")){
			$('#open').css('visibility','visible');
		} else {
			$('#open').css('visibility','hidden');
			$('#open input').val("");
		}
	});
	
	
	$('#btnOk').click(function(){
		if($("#title").val()==''){
			alert("공고 제목을 입력해주세요.");
			return;
		} else if(!$('#rulePay').is(':checked') && $('#startPay').val()==''){
			alert("최저 급여를 지정해주세요.");
			return;
		} else if(!$('#rulePay').is(':checked') && $('#endPay').val()==''){
			alert("최고 급여를 지정해주세요.");
			return;
		} else if(!$('#allOpen').is(':checked') && $('#startOpen').val()==''){
			alert("시작 날짜를 입력해주세요.");
			return;
		} else if(!$('#allOpen').is(':checked') && $('#endOpen').val()==''){
			alert("마감 날짜를 입력해주세요.");
			return;
		}
		
		$('#formId').submit();
	});
	
	
});


</script>

<%@ include file="../include/footer.jsp"%>