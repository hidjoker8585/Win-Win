<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ include file="../include/CSSLoader.jsp"%>
<style>
</style>

<script type="text/javascript">
history.pushState(null, null, location.href); 
window.onpopstate = function () {
    history.go(1);
};

$(document).ready(function() {
	
	var tid;
	var cnt = 1800;
	
	counter_init();
	
	function counter_init() {
		tid = setInterval(function counter_run() {
			document.all.counter.innerText = time_format(cnt);
			cnt--;
// 			console.log(cnt);
			
			if(cnt < 0) {
				clearInterval(tid);
				logout();
			}
		}, 1000);
	}
	
	function logout() {
		
		var modal = document.getElementById('myModal');
		modal.style.display = "block";
		
		var span = document.getElementsByClassName("close")[0];
		var btnClose = document.getElementById("btnClose");
		
		
		btnClose.onclick = function() {
			modal.style.display = "none";
		}
		
		$("#logoutModal").html("시간이 경과되어 자동 로그아웃됩니다.")
		
	}	
	
	
	$("#timer").click(function() {
		clearInterval(tid);
		cnt = parseInt(1800);
		counter_init();
	});
	
	function time_format(s) {
		var nHour=0;
		var nMin=0;
		var nSec=0;
		
		if(s>0) {
			nMin = parseInt(s/60);
			nSec = s%60;
			
			if(nMin>60) {
				nHour = parseInt(nMin/60);
				nMin = nMin%60;
			}
		}
		
		if(nSec<10) nSec = "0"+nSec;
		if(nMin<10) nMin = "0"+nMin;
		
		return ""+nHour+":"+nMin+":"+nSec;
	}
	
	var Dday = new Date('<fmt:formatDate value="${jobopenBasic.endDate }" pattern="yyyy/MM/dd" />');
	var now = new Date();
	console.log(now);
	console.log(Dday);
	
	var gap = now.getTime() - Dday.getTime();
	var result = Math.floor(gap/ (1000*60*60*24)) * -1;
	
	console.log("남은 날은 " + result + " 일");
	
	$("#dDay").val("(D- " + result + "일)");
	
	
	
	$("#saveBtn").click(function() {
		
		console.log("저장하고 계속하기 버튼 클릭");
		
		var discharge = $("#discharge").val();
		
		if(discharge == "0") {
			alert("병역구분을 선택해주십시오.");
			$("#discharge").focus();
		} else if(discharge == "군필" || discharge == "복무중") {
			
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var mCategory = $("#mCategory").val();
			var mGrade = $("#mGrade").val();

			console.log(mCategory);
			if(startDate == "" || endDate == "" || mCategory == "0" || mGrade == "0") {
				console.log("빈칸!");
				alert("모든 항목을 입력해주십시오.");
			} else {
				console.log("군필/복무중_모든항목 입력!");
				$("#militaryForm").submit();
			}
		} else {
			console.log("마지막 else");
			$("#militaryForm").submit();
		}
		
	})
	
});

</script>
   
<%@ include file="../include/header.jsp"%>

<div class="container">
	<h3 class="mt-5 font-weight-bold">입사지원 등록</h3>
	<img class="img-fluid d-block" src="/resources/image/grayline.png">

	<div class="col-md-12 border border-secondary mt-3 p-0">
	<table class="table col-md-12 mb-0">
	  <thead>
	    <tr>
	      <td style="font-weight: bold; padding-left: 32px;">${jobopenBasic.title}</td>
	    </tr>
	  </thead>	  
	  <tbody>
	    <tr style="line-height: 0.8em;">
	      <th class="text-center align-middle bg-secondary">접수상태</th>
	      	<td class="text-center align-middle">지원서 저장 전 입니다</td>
	      <th class="text-center align-middle bg-secondary">원서 마감 일시</th>
	      	<c:if test="${jobopenBasic.endDate eq null}">
	      		<td class="text-center align-middle" style="color: red;"><input style="border: none; width: 124px; color: red;" type="text" value="상시채용" readonly/></td>
	      	</c:if>
	      	<c:if test="${jobopenBasic.endDate ne null}">
	      		<td class="text-center align-middle"><fmt:formatDate value="${jobopenBasic.endDate }" pattern="yyyy/MM/dd" /></td>
	      		<td class="text-danger text-center align-middle"><input style="border: none; width: 100px; color: red;" type="text" id="dDay" value="" readonly/></td>
			</c:if>
	      <th class="text-center align-middle bg-secondary">자동 로그아웃</th>
	      	<td class="text-danger text-center align-middle"><span id="counter"></span></td>
	      	<td><button id="timer">연장</button></td>
	    </tr>    
	  </tbody>
	</table>
	</div>

	<form action="/apply/military" method="POST" id="militaryForm">
	<h4 class="mt-4 mb-3 font-weight-bold">병역사항<input type="hidden" name="jobopenNo" id="jobopenNo" value="${jobopenBasic.jobopenNo}" /><input type="hidden" name="userId" id="userId" value="${sessionScope.id }"/></h4>
	<div class="row">
		<a href="/apply/userDetailUpdate?jobopenNo=${jobopenBasic.jobopenNo }">
			<img class="img-fluid d-block ml-3" src="/resources/image/G_userDetail.png">
		</a>
		<img style="cursor: pointer" class="img-fluid d-block" src="/resources/image/G_academic.png" onclick="checkAca();">		
		<img class="img-fluid d-block" src="/resources/image/B_military.png">
		<img class="img-fluid d-block" src="/resources/image/G_career.png">
		<img class="img-fluid d-block" src="/resources/image/G_introduce.png">
		<img class="img-fluid d-block" src="/resources/image/G_complete.png">
	</div>

	<h6 class="mt-5 font-weight-bold">병역정보</h6>
	
	<div class="col-md-12 mt-3 p-0">
		<table class="table border border-secondary col-md-12 mb-0 text-center table-sm">
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle" style="width: 20% ;">병역구분<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 40% ;">복무기간<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 20% ;">군별<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 20% ;">계급<span style="color : red;">*</span></th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle">
					<select style="height:24px; width:100px;" id="discharge" name="discharge">
						<option value="0">병역구분</option>
						<option value="비대상">비대상</option>
						<option value="군필">군필</option>
						<option value="미필">미필</option>
						<option value="면제">면제</option>
						<option value="복무중">복무중</option>
					</select>
                  </td>
                  <td class="align-middle">
                  	<input type="date" id="startDate" name="startDate" min="2000-01-01" max="3000-12-31" style="height:24px; width: 160px;" /> ~
                  	<input type="date" id= "endDate" name="endDate" min="2000-01-01" max="3000-12-31" style="height:24px; width: 160px;" />                 
                  </td>
                  <td class="align-middle">
                  	<select style="height:24px; width: 100px;" id="mCategory" name="mCategory">
                  		<option value="0">군별</option>
                  		<option value="육군">육군</option>
                  		<option value="해군">해군</option>
                  		<option value="공군">공군</option>
                  		<option value="해병">해병</option>
                  		<option value="전경">전경</option>
                  		<option value="의경">의경</option>
                  		<option value="공익">공익</option>
                  		<option value="병특">병특</option>
                  		<option value="카투사">카투사</option>
                  		<option value="기타">기타</option>
                  	</select>
                  </td>
                  <td class="align-middle">
                    <select style="height:24px; width: 100px;" id="mGrade" name="mGrade">
                  		<option value="0">계급</option>
                  		<option value="일병">일병</option>
                  		<option value="이병">이병</option>
                  		<option value="상병">상병</option>
                  		<option value="병장">병장</option>
                  		<option value="하사">하사</option>
                  		<option value="중사">중사</option>
                  		<option value="상사">상사</option>
                  		<option value="원사">원사</option>
                  		<option value="준위">준위</option>
                  		<option value="소위">소위</option>
                  		<option value="중위">중위</option>
                  		<option value="대위">대위</option>
                  		<option value="소령">소령</option>
                  		<option value="중령">중령</option>
                  		<option value="대령">대령</option>
                  		<option value="준장">준장</option>
                  		<option value="소장">소장</option>
                  		<option value="중장">중장</option>
                  		<option value="대장">대장</option>
                  		<option value="원수">원수</option>
                  	</select>
                  </td>
                </tr>
			</tbody>
		</table>
	</div>
	
	<br><br><br><br><br><br>
	
	<div class="col-12 mt-5 p-0">
         <table class="table border">
            <tbody>
               <tr>
                  <th class="text-center table-light align-middle">
                     <i class="fas fa-exclamation-triangle fa-3x"></i>
                  </th>
                  <td class="table-light align-middle"> 
                  <ul class="mb-0">
                     <li style="line-height: 150%;"><strong><span class="text-info">여성지원자</span>는 제대구분을 병역비대상으로 선택하시고 다음단계로 넘어갑니다.</strong></li>
                     <li style="line-height: 150%;"><strong><span class="text-danger">(단, 군복무를 마친 여성은 해당 제대구분을 선택합니다.)</span></strong></li>
                  </ul>
                  </td>
               </tr>
            </tbody>
         </table>
	</div>
	</form>
	
	<div class="col-12 mt-5 p-0 d-flex justify-content-end">
		<input class="btn btn-primary text-white" type="button" id="saveBtn" value="저장하고 계속하기"/>
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
			        <p class="font-weight-bold text-center" id="logoutModal"></p>
				</div>
			
			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
				<a href="/user/logout"><button type="button"  id="btnClose" class="font-weight-bold btn btn-primary" style="background-color: #376092">확인</button></a>
				</div>
			</div>
	      </div>
	 
	    </div>
    </div>	
	
<%@ include file="../include/scriptLoader.jsp"%>
<script type="text/javascript">
function checkAca() {
	
	var jobopenNo = ${jobopenBasic.jobopenNo};
	
	$.ajax({
		type:"get"
		, url: "/apply/checkAca"
		, dataType: "json"
		, data: {
			"jobopenNo" : jobopenNo
		}
		, success: function( data ) {
			
			if(data.highSchool>0 || data.college>0 || data.university>0 || data.gSchool>0) {
				location.href="/apply/academicUpdate?jobopenNo="+jobopenNo;
			} else {
				location.href="/apply/academic?jobopenNo="+jobopenNo;
			}
			
		}, error: function() {
			alert("error");
		}
	})
}

$("#discharge").change(function(){ 
	
	  console.log("discharge");
	  
	  if($(this).val() == "미필" || $(this).val() == "면제" || $(this).val() == "비대상") {
		  console.log("선택");
		  
		  $("#startDate").attr("disabled", true);
		  $("#endDate").attr("disabled", true);
		  $("#mCategory").attr("disabled",true);
		  $("#mGrade").attr("disabled",true);
	  }
	  
	  if($(this).val() == "군필" || $(this).val() == "복무중") {
		  $("#startDate").removeAttr("disabled");
		  $("#endDate").removeAttr("disabled");
		  $("#mCategory").removeAttr("disabled");
		  $("#mGrade").removeAttr("disabled");
	  }
});
</script>
<%@ include file="../include/footer.jsp"%>		
	