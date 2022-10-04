<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>

<style>
.box{
	float: left;
	width: 190px;
	height: 100px;
	display :inline-block;
    line-height: 6.4em;
}

.boxm{
	float:left;
	width:160px;
	height:100px;
	display:inline-block;
	line-height:6.4em;
}

.noticeBox{
	width:800px;
	height:200px;
 	display : inline-block;
	border : 1px solid blue;
	text-align : center;
	line-height: 200px;
	font-family: inherit;
	color: blue;
}

.size{
	display:inline-block;
	margin:1em;
	border:1px solid black;
}

.enter{
	white-space:pre;
}

.red {
	background-color: red;
}
.triangle-right-primary {
	float: left;	
      width: 0;
      height: 0;
      border-top: 50px solid transparent;
      border-left: 50px solid #376092;
      border-bottom: 50px solid transparent;
}
.triangle-right-white {
	float: left;
      width: 0;
      height: 0;
      border-top: 50px solid red;
      border-left: 100px solid transparent;
      border-bottom: 50px solid red;
}

.line {
	float : left;
	border-top : 1px solid #376092;
	border-right: 1px solid #376092;
	width:4.7em;
	height:4.75em;
	transform: scale(1) rotate(45deg) translateX(10px) translateY(10px);
}
    

</style>

<%@ include file="../include/adminHeader.jsp"%>


<div class="container">
	<div class="row m-3 justify-content-center">
		<div style="width: 680px; height: 101px; border:1px solid #376092;">
			<div class="box text-light text-center" style="background-color: #376092;"><strong>기본정보</strong></div>
			<div class="triangle-right-primary"></div>
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
			<form action="/jobOpen/basicUpdate" method="post" id="formId">
				<div class="form-inline m-3">
				    <div class="col-2">
				      <label for="title">공고 제목</label>
				    </div>
				    <div class="col-10">
				      <input type="text" id="title" class="form-control" style="width:680px" name="title" value="${basic.title }" required/>
				    </div>
			    </div>
			    
				<div class="form-inline m-3">
				    <div class="col-2">
				      	<label>모집 구분</label>
				    </div>
				    <div class="col-2">
				    	<div class="form-check-inline">
					    	<input type="checkbox" class="form-check-input" id="classify_new" name="offer" value="신입">
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
			    			<input type="checkbox" class="form-check-input" id="permanent" name="form" value="정규직">
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
			    			<input type="checkbox" class="form-check-input" id="rulPay" name="rulePay" value="회사 내규에 따름" checked>
							<label class="form-check-label" for="rulePay">회사 내규에 따름</label>
			    		</div>
			    	</div>
			    	<div class="col-7">
			    		<div class="form-check-inline">
			    			<a id="payCheck" style="cursor:pointer; text-decoration: underline;" class="m-2 text-black-50">급여 지정하기</a>
			    			<!-- 급여지정 지웠다 켜졌다 하기 -->
			    			<c:if test="${basic.startPay ne 0 }">
			    			<div id="pay" style="visibility: visible;">
			    			</c:if>
			    			<c:if test="${basic.startPay eq 0 }">
			    			<div id="pay" style="visibility: hidden;">
			    			</c:if>
			    				<input type="number" name="startPay" class="form-control input-sm" style="height:30px; width:100px;"/> 만원
			    				~
			    				<input type="number" name="endPay" class="form-control input-sm" style="height:30px; width:100px;"/> 만원
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
			    			<c:if test="${basic.startDate ne null }">
			    				<div id="open" style="visibility:visible">
			    			</c:if>
			    			<c:if test="${basic.startDate eq null }">
			    				<div id="open" style="visibility:hidden">
			    			</c:if>
			    				<input id="startOpen" name="startDate" type="date" class="form-control input-sm" style="height:30px; width:150px;"/>
			    				~
			    				<input name="endDate" name="endDate" type="date" class="form-control input-sm" style="height:30px; width:150px;"/>
			    			</div>
			    		</div>
			    	</div>
			    </div>
			    
			    
			    <div class="form-inline mt-5 d-flex justify-content-center" >
			    	<button id="btnOk" class="btn btn-info mr-3">저장하고 계속하기</button><button type="button" id="btnCancel" class="btn btn-secondary">취소</button>
			    </div>
			</form>
		</div>
	</div>
</div>


<%@ include file="../include/scriptLoader.jsp"%>

<script>

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
			$.ajax({
				type:"post",
				url:"/jobOpen/detailCancel",
				success:function(){
					location.href="/main/adminmain";
				},
				error:function(){
					console.log("취소 실패")
				}
			});
		}
		
		btnNo.onclick = function(){
			modal.style.display = "none";
		}
		
		
	});
	
	
	$("#payCheck").click(function(){
		if($('#pay').css('visibility') == 'hidden'){
			    $('#pay').css('visibility','visible');
			    $('#rulPay').prop("checked",false);
			   
		} else {
			    $('#pay').css('visibility','hidden');
			    $('#pay input').val("");
			    $('#rulPay').prop("checked",true);
		}
	});
	
	$('input[type="checkbox"][id="rulPay"]').change(function(){
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
	
	
	// 모집 구분 해결
	var offer = new Array();
	var bOffer = "${basic.offer}";
	offer = bOffer.split(",");
	var j=0;
	$('input:checkbox[name=offer]').each(function(){
		console.log(j);
		if(this.value==offer[j]){
			j++;
		this.checked = true;
		}
	});
	
	// 고용 형태 해결
	var form = new Array();
	var bForm = "${basic.form}";
	form = bForm.split(",");
	var j=0;
	$('input:checkbox[name=form]').each(function(){
		console.log(j);
		if(this.value==form[j]){
			j++;
		this.checked = true;
		}
	});
	
	if(${basic.startPay ne 0}){
		$('input:checkbox[name=rulePay]').attr("checked",false);
		
		$("input[name=startPay]").val("${basic.startPay}");
		$("input[name=endPay]").val("${basic.endPay}");
	}
	
	if(${basic.startDate ne null}){
		$('input:checkbox[name=allOpen]').attr("checked", false);
		
		$("input[name=startDate]").val('<fmt:formatDate value="${basic.startDate }" pattern="yyyy-MM-dd" />');
		$("input[name=endDate]").val('<fmt:formatDate value="${basic.endDate }" pattern="yyyy-MM-dd" />');
	}
	

	
});


</script>

<%@ include file="../include/footer.jsp"%>