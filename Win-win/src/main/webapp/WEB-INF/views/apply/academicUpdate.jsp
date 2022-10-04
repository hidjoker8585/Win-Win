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
		
		var modal = document.getElementById('logoutModal');
		modal.style.display = "block";
		
		var span = document.getElementsByClassName("close")[0];
		var btnClose = document.getElementById("btnLogoutClose");
		
		
		btnClose.onclick = function() {
			modal.style.display = "none";
		}
		
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
// 	console.log(now);
// 	console.log(Dday);
	
	var gap = now.getTime() - Dday.getTime();
	var result = Math.floor(gap/ (1000*60*60*24)) * -1;
	
	console.log("남은 날은 " + result + " 일");
	
	$("#dDay").val("(D- " + result + "일)");
	
	
	//고등학교 주/야
	var hDaySelect = document.getElementsByClassName("hDaySelect");
	var realHDay = "${highSchool.hsDay}";
	
	for(var i=0; i<hDaySelect.length; i++) {
		var hDay = hDaySelect[i].value;
		
		console.log("hDay : " + hDay);
		
		if(hDay==realHDay) {
			console.log("hDay if문 입장");
			$("#hsDay").find("option[value="+realHDay+"]").attr("selected", "selected");
		}
	}
	
	//고등학교 전공
	var hMajorSelect = document.getElementsByClassName("hMajorSelect");
	var realHMajor = "${highSchool.hsMajor}";
	
	for(var i=0; i<hMajorSelect.length; i++) {
		var hMajor = hMajorSelect[i].value;
		
		console.log("hMajor : " + hMajor);
		
		if(hMajor==realHMajor) {
			console.log("hMajor if문 입장");
			$("#hsMajor").find("option[value="+realHMajor+"]").attr("selected", "selected");
		}
	}
	
	//고등학교 졸업구분
	var hGraduateSelect = document.getElementsByClassName("hGraduateSelect");
	var realHGraduate = "${highSchool.hsGraduate}";
	
	for(var i=0; i<hGraduateSelect.length; i++) {
		var hGraduate = hGraduateSelect[i].value;
		
		console.log("hGraduate : " + hGraduate);
		
		if(hGraduate==realHGraduate) {
			console.log("hGraduate if문 입장");
			$("#hsGraduate").find("option[value="+realHGraduate+"]").attr("selected", "selected");
		}
	}
	
	//고등학교 지역
	var hRegionSelect = document.getElementsByClassName("hRegionSelect");
	var realHRegion = "${highSchool.hsRegion}";
	
	for(var i=0; i<hRegionSelect.length; i++) {
		var hRegion = hRegionSelect[i].value;
		
		console.log("hRegion : " + hRegion);
		
		if(hRegion==realHRegion) {
			console.log("hRegion if문 입장");
			$("#hsSelect").find("option[value="+realHRegion+"]").attr("selected", "selected");
		}
	}

	//전문대학 본교/분교
	var cBranchSelect = document.getElementsByClassName("cBranchSelect");
	var realCBranch = "${college.colBranch}";
	
	for(var i=0; i<cBranchSelect.length; i++) {
		var cBranch = cBranchSelect[i].value;
		
		console.log("cBranch : " + cBranch);
		
		if(cBranch==realCBranch) {
			console.log("cBranch if문 입장");
			$("#colBranch").find("option[value="+realCBranch+"]").attr("selected", "selected");
		}
	}
	
	
	//전문대학 주/야
	var cDaySelect = document.getElementsByClassName("cDaySelect");
	var realCDay = "${college.colDay}";
	
	for(var i=0; i<cDaySelect.length; i++) {
		var cDay = cDaySelect[i].value;
		
		console.log("cBranch : " + cBranch);
		
		if(cDay==realCDay) {
			console.log("cDay if문 입장");
			$("#colDay").find("option[value="+realCDay+"]").attr("selected", "selected");
		}
	}
	
	
	//전문대학 입학/편입
	var cTransferSelect = document.getElementsByClassName("cTransferSelect");
	var realCTransfer = "${college.colTransfer}";
	
	for(var i=0; i<cTransferSelect.length; i++) {
		var cTransfer = cTransferSelect[i].value;
		
		console.log("cTransfer : " + cTransfer);
		
		if(cTransfer==realCTransfer) {
			console.log("cTransfer if문 입장");
			$("#colTransfer").find("option[value="+realCTransfer+"]").attr("selected", "selected");
		}
	}
	
	//전문대학 졸업구분
	var cGraduateSelect = document.getElementsByClassName("cGraduateSelect");
	var realCGraduate = "${college.colGraduate}";
	
	for(var i=0; i<cGraduateSelect.length; i++) {
		var cGraduate = cGraduateSelect[i].value;
		
		console.log("cGraduate : " + cGraduate);
		
		if(cGraduate==realCGraduate) {
			console.log("cGraduate if문 입장");
			$("#colGraduate").find("option[value="+realCGraduate+"]").attr("selected", "selected");
		}
	}
	
	//전문대학 지역
	var cRegionSelect = document.getElementsByClassName("cRegionSelect");
	var realCRegion = "${college.colRegion}";
	
	for(var i=0; i<cRegionSelect.length; i++) {
		var cRegion = cRegionSelect[i].value;
		
		console.log("cRegion : " + cRegion);
		
		if(cRegion==realCRegion) {
			console.log("cRegion if문 입장");
			$("#colRegion").find("option[value="+realCRegion+"]").attr("selected", "selected");
		}
	}
	
	//대학 본교/분교
	var uBranchSelect = document.getElementsByClassName("uBranchSelect");
	var realUBranch = "${university.univBranch}";
	
	for(var i=0; i<uBranchSelect.length; i++) {
		var uBranch = uBranchSelect[i].value;
		
		console.log("uBranch : " + uBranch);
		
		if(uBranch==realUBranch) {
			console.log("uBranch if문 입장");
			$("#univBranch").find("option[value="+realUBranch+"]").attr("selected", "selected");
		}
	}
	
	//대학 주/야
	var uDaySelect = document.getElementsByClassName("uDaySelect");
	var realUDay = "${university.univDay}";
	
	for(var i=0; i<uDaySelect.length; i++) {
		var uDay = uDaySelect[i].value;
		
		console.log("uDay : " + uDay);
		
		if(uDay==realUDay) {
			console.log("uDay if문 입장");
			$("#univDay").find("option[value="+realUDay+"]").attr("selected", "selected");
		}
	}
	
	//대학 입학/편입
	var uTransferSelect = document.getElementsByClassName("uTransferSelect");
	var realUTransfer = "${university.univTransfer}";
	
	for(var i=0; i<uTransferSelect.length; i++) {
		var uTransfer = uTransferSelect[i].value;
		
		console.log("uTransfer : " + uTransfer);
		
		if(uTransfer==realUTransfer) {
			console.log("uTransfer if문 입장");
			$("#univTransfer").find("option[value="+realUTransfer+"]").attr("selected", "selected");
		}
	}
	
	//대학 졸업구분
	var uGraduateSelect = document.getElementsByClassName("uGraduateSelect");
	var realUGraduate = "${university.univGraduate}";
	
	for(var i=0; i<uGraduateSelect.length; i++) {
		var uGraduate = uGraduateSelect[i].value;
		
		console.log("uGraduate : " + uGraduate);
		
		if(uGraduate==realUGraduate) {
			console.log("uGraduate if문 입장");
			$("#univGraduate").find("option[value="+realUGraduate+"]").attr("selected", "selected");
		}
	}
	
	//대학 지역
	var uRegionSelect = document.getElementsByClassName("uRegionSelect");
	var realURegion = "${university.univRegion}";
	
	for(var i=0; i<uRegionSelect.length; i++) {
		var uRegion = uRegionSelect[i].value;
		
		console.log("uRegion : " + uRegion);
		
		if(uRegion==realURegion) {
			console.log("uRegion if문 입장");
			$("#univRegion").find("option[value="+realURegion+"]").attr("selected", "selected");
		}
	}
	
	//대학원 본교/분교
	var gBranchSelect = document.getElementsByClassName("gBranchSelect");
	var realGBranch = "${gSchool.gsBranch}";
	
	for(var i=0; i<gBranchSelect.length; i++) {
		var gBranch = gBranchSelect[i].value;
		
		console.log("gBranch : " + gBranch);
		
		if(gBranch==realGBranch) {
			console.log("gBranch if문 입장");
			$("#gsBranch").find("option[value="+realGBranch+"]").attr("selected", "selected");
		}
	}	
	
	//대학원 주/야
	var gDaySelect = document.getElementsByClassName("gDaySelect");
	var realGDay = "${gSchool.gsDay}";
	
	for(var i=0; i<gDaySelect.length; i++) {
		var gDay = gDaySelect[i].value;
		
		console.log("gDay : " + gDay);
		
		if(gDay==realGDay) {
			console.log("gDay if문 입장");
			$("#gsDay").find("option[value="+realGDay+"]").attr("selected", "selected");
		}
	}	
	
	//대학원 졸업구분
	var gGraduateSelect = document.getElementsByClassName("gGraduateSelect");
	var realGGraduate = "${gSchool.gsGraduate}";
	
	for(var i=0; i<gGraduateSelect.length; i++) {
		var gGraduate = gGraduateSelect[i].value;
		
		console.log("gGraduate : " + gGraduate);
		
		if(gGraduate==realGGraduate) {
			console.log("gGraduate if문 입장");
			$("#gsGraduate").find("option[value="+realGGraduate+"]").attr("selected", "selected");
		}
	}	
	
	//대학원 지역
	var gRegionSelect = document.getElementsByClassName("gRegionSelect");
	var realGRegion = "${gSchool.gsRegion}";
	
	for(var i=0; i<gRegionSelect.length; i++) {
		var gRegion = gRegionSelect[i].value;
		
		console.log("gRegion : " + gRegion);
		
		if(gRegion==realGRegion) {
			console.log("gRegion if문 입장");
			$("#gsRegion").find("option[value="+realGRegion+"]").attr("selected", "selected");
		}
	}	
	
	
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

	<h4 class="mt-4 mb-3 font-weight-bold">학력사항</h4>
	<div class="row">
		<img style="cursor: pointer" class="img-fluid d-block ml-3" src="/resources/image/G_userDetail.png" onclick="checkUserD();">
		<img class="img-fluid d-block" src="/resources/image/B_academic.png">
		<img style="cursor: pointer" class="img-fluid d-block" src="/resources/image/G_military.png" onclick="checkMil();">
		<img style="cursor: pointer" class="img-fluid d-block" src="/resources/image/G_career.png" onclick="checkCar();">
		<img style="cursor: pointer" class="img-fluid d-block" src="/resources/image/G_introduce.png" onclick="checkIntro();">
		<a href="/apply/finish?jobopenNo=${jobopenBasic.jobopenNo }">
			<img class="img-fluid d-block" src="/resources/image/G_complete.png">
		</a>
	</div>
	
	<form action="/apply/academicUpdate" method="POST" id="acaForm" name="acaForm">
	
	<h6 class="mt-5 font-weight-bold">고등학교
		<input type="button" class="btn btn-primary text-white mb-3 btn-sm font-weight-bold" style="float: right;" id="hsResetBtn" value="초기화" />
	</h6>
	
	<div class="col-md-12 mt-3 p-0">
		<table class="table border border-secondary col-md-12 mb-0 text-center table-sm">
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle" style="width: 37% ;">학교명<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 33% ;">전공<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 22% ;">졸업년도<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 8% ;">지역<span style="color : red;">*</span></th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle">
                  	<input type="hidden" name="userId" id="hsuserId" value="${sessionScope.id }" />
                  	<input type="hidden" name="jobopenNo" id="hsJobopenNo" value="${jobopenBasic.jobopenNo }" />
					<input type="text" id="hsName" name="hsName" class="mr-1 hschoolTxt highVal" style="width: 200px" value="${highSchool.hsName}" readonly/>
					<input type="button" class="m-1 mr-1" id="hsSearch" value="검색" /><input type="button" class="ml-1 mr-1 cancelAPIS" value="취소" />
					<select style="height:24px; width:70px;" class="hsselect highVal" id="hsDay" name="hsDay">
						<option value="">주/야</option>
						<option class="hDaySelect" value="주간">주간</option>
						<option class="hDaySelect" value="야간">야간</option>
					</select>
                  </td>
                  <td class="align-middle">
                  	<select style="height:24px; width: 110px;" class="hsselect highVal" id="hsMajor" name="hsMajor">
                  		<option value="">전공</option>
                  		<option class="hMajorSelect" value="인문계">인문계</option>
                  		<option class="hMajorSelect" value="자연계">자연계</option>
                  		<option class="hMajorSelect" value="실업계">실업계</option>
                  	</select>
                  </td>
                  <td class="align-middle">
                  	<input class="hschoolTxt highVal" type="date" name="hsEndDate" id="hsEndDate" value="${highSchool.hsEndDate}" min="2000-01-01" max="3000-12-31" style="height:24px; width: 120px;" />
                  	<select class="hsselect highVal" style="height:24px; width: 80px;" name="hsGraduate" id="hsGraduate">
                  		<option value="">졸업구분</option>
                  		<option class="hGraduateSelect" value="졸업">졸업</option>
                  		<option class="hGraduateSelect" value="졸업예정">졸업예정</option>
                  		<option class="hGraduateSelect" value="재학">재학</option>
                  	</select>
                  </td>
                  <td class="align-middle">
                    <select class="hsselect highVal" id="hsSelect" name="hsRegion">
                  		<option value="">지역</option>
                  		<option class="hRegionSelect" value="서울">서울</option>
                  		<option class="hRegionSelect" value="인천">인천</option>
                  		<option class="hRegionSelect" value="대전">대전</option>
                  		<option class="hRegionSelect" value="광주">광주</option>
                  		<option class="hRegionSelect" value="부산">부산</option>
                  		<option class="hRegionSelect" value="울산">울산</option>
                  		<option class="hRegionSelect" value="대구">대구</option>
                  		<option class="hRegionSelect" value="강원">강원</option>
                  		<option class="hRegionSelect" value="경기">경기</option>
                  		<option class="hRegionSelect" value="충북">충북</option>
                  		<option class="hRegionSelect" value="충남">충남</option>
                  		<option class="hRegionSelect" value="전북">전북</option>
                  		<option class="hRegionSelect" value="전남">전남</option>
                  		<option class="hRegionSelect" value="경북">경북</option>
                  		<option class="hRegionSelect" value="경남">경남</option>
                  	</select>
                  </td>
                </tr>
			</tbody>
		</table>
	</div>
	
	<h6 class="mt-5 font-weight-bold">전문대학
		<input type="button" class="btn btn-primary text-white mb-3 btn-sm font-weight-bold" style="float: right;" id="colResetBtn" value="초기화" />
	</h6>
	
	<div class="col-md-12 mt-3 p-0">
		<table class="table border border-secondary col-md-12 mb-0 text-center table-sm">
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle" style="width: 37% ;">학교명<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 33% ;">전공<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 22% ;">재학기간<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 8% ;">지역<span style="color : red;">*</span></th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle">
                  	<input type="hidden" name="jobopenNo" id="colJobopenNo" value="${jobopenBasic.jobopenNo }" />
					<input type="text" id="colName" name="colName" class="mr-1 colTxt colVal" style="width: 110px" value="${college.colName}" readonly/>
					<input type="button" class="m-1 mr-1" id="colSearch" value="검색"><input type="button" class="ml-1 mr-1 cancelAPIS2" value="취소" />
					<select style="height:24px; width:85px;" class="colselect colVal" id="colBranch" name="colBranch">
						<option value="0">본교/분교</option>
						<option class="cBranchSelect" value="본교">본교</option>
						<option class="cBranchSelect" value="분교">분교</option>
					</select>
					<select style="height:24px; width:70px;" class="colselect colVal" id="colDay" name="colDay">
						<option value="0">주/야</option>
						<option class="cDaySelect" value="주간">주간</option>
						<option class="cDaySelect" value="야간">야간</option>
					</select>
                  </td>
                  <td class="align-middle">
					<input type="text" class="mr-1 colTxt colVal" style="width: 100px" id="colMajor" name="colMajor" value="${college.colMajor }" readonly/>
					<input type="button" class="m-1 mr-1" id="colSearchM" name="colSearchM" value="검색" /><input type="button" class="ml-1 mr-1 cancelAPI" value="취소" />					                  
 					<input type="text" name="colScore" id="colScore" class="colVal mr-1 colTxt" style="width: 30px;" value="${college.colScore }" /> / <input id="colTotalScore" name="colTotalScore" type="text" class="colVal mr-1 colTxt" style="width: 30px; " value="${college.colTotalScore }"/> 만점
                  </td>
                  <td class="align-middle">
                  	<input class="colTxt colVal" type="date" id="colStartDate" name="colStartDate" min="2000-01-01" max="3000-12-31" style="height:24px; width: 120px;" value="${college.colStartDate }"/>
                  	<select style="height:24px; width: 70px;" class="colselect colVal" id="colTransfer" name="colTransfer">
                  		<option value="0">입학/편입</option>
                  		<option class="cTransferSelect" value="입학">입학</option>
                  		<option class="cTransferSelect" value="편입">편입</option>
                  	</select>
                  	<input class="colTxt colVal" type="date" id="colEndDate" name="colEndDate" min="2000-01-01" max="3000-12-31" style="height:24px; width: 120px;" value="${college.colEndDate}"/>
                   	<select style="height:24px; width: 70px;" class="colselect colVal" id="colGraduate" name="colGraduate">
                  		<option value="0">졸업구분</option>
                  		<option class="cGraduateSelect" value="졸업">졸업</option>
                  		<option class="cGraduateSelect" value="졸업예정">졸업예정</option>
                  		<option class="cGraduateSelect" value="재학">재학</option>
                  	</select>                 	
                  </td>
                  <td class="align-middle">
                    <select class="colselect colVal" id="colRegion" name="colRegion">
                  		<option value="0">지역</option>
                  		<option class="cRegionSelect" value="서울">서울</option>
                  		<option class="cRegionSelect" value="인천">인천</option>
                  		<option class="cRegionSelect" value="대전">대전</option>
                  		<option class="cRegionSelect" value="광주">광주</option>
                  		<option class="cRegionSelect" value="부산">부산</option>
                  		<option class="cRegionSelect" value="울산">울산</option>
                  		<option class="cRegionSelect" value="대구">대구</option>
                  		<option class="cRegionSelect" value="강원">강원</option>
                  		<option class="cRegionSelect" value="경기">경기</option>
                  		<option class="cRegionSelect" value="충북">충북</option>
                  		<option class="cRegionSelect" value="충남">충남</option>
                  		<option class="cRegionSelect" value="전북">전북</option>
                  		<option class="cRegionSelect" value="전남">전남</option>
                  		<option class="cRegionSelect" value="경북">경북</option>
                  		<option class="cRegionSelect" value="경남">경남</option>
                  	</select>
                  </td>
                </tr>
			</tbody>
		</table>
	</div>
	
	<h6 class="mt-5 font-weight-bold">대학교
		<input type="button" class="btn btn-primary text-white mb-3 btn-sm font-weight-bold" style="float: right;" id="univResetBtn" value="초기화" />
	</h6>

	<div class="col-md-12 mt-3 p-0">
		<table class="table border border-secondary col-md-12 mb-0 text-center table-sm">
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle" style="width: 37% ;">학교명<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 33% ;" colspan="2">전공<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 22% ;">재학기간<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 8% ;">지역<span style="color : red;">*</span></th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle">
                  	<input type="hidden" name="jobopenNo" id="univJobopenNo" value="${jobopenBasic.jobopenNo }" />
					<input type="text" id="univName" name="univName" class="univVal mr-1 univTxt" style="width: 110px" value="${university.univName }" readonly/>
					<input type="button" class="m-1 mr-1" id="univSearch" name="univSearch" value="검색" /><input type="button" class="ml-1 mr-1 cancelAPIS2" value="취소" />
					<select style="height:24px; width:85px;" class="univselect univVal" id="univBranch" name="univBranch">
						<option value="0">본교/분교</option>
						<option class="uBranchSelect" value="본교">본교</option>
						<option class="uBranchSelect" value="분교">분교</option>
					</select>
					<select style="height:24px; width:70px;" class="univselect univVal" id="univDay" name="univDay">
						<option value="0">주/야</option>
						<option class="uDaySelect" value="주간">주간</option>
						<option class="uDaySelect" value="야간">야간</option>
					</select>
                  </td>
                  <td class="align-middle">
                  <div>
					<input type="text" id="univMajor" name="univMajor" class="mr-1 univTxt univVal" style="width: 100px" value="${university.univMajor }" readonly/>
					<input type="button" class="m-1 mr-1" id="univMSearch" value="검색" /><input type="button" class="ml-1 mr-1 cancelAPI" value="취소" />
				  </div>
				  <div>		
					<input type="text"  id="univMinor" name="univMinor" class="mr-1 univTxt univVal" style="width: 100px" placeholder="부전공/복수전공" value="${university.univMinor }" readonly/>
					<input type="button" class="m-1 mr-1" id="univMiSearch" name="univMiSearch" value="검색" /><input type="button" class="ml-1 mr-1 cancelAPI" value="취소" />					                  
				  </div>
				  </td>
				  <td>						                  
 					<input type="text" id="univScore" name="univScore" class="mr-1 mt-2 univTxt univVal" style="width: 30px; " value="${university.univScore }"/> / <input type="text" id="univTotalScore" name="univTotalScore" class="mr-1 univTxt univVal" style="width: 30px; " value="${university.univTotalScore }"/> 만점
                  </td>
                  <td class="align-middle">
                  	<input class="univTxt univVal" type="date" id="univStartDate" name="univStartDate" value="${university.univStartDate }" min="2000-01-01" max="3000-12-31" style="height:24px; width: 120px;" />
                  	<select style="height:24px; width: 75px;" class="univselect univVal" id="univTransfer" name="univTransfer">
                  		<option value="0">입학/편입</option>
                  		<option class="uTransferSelect" value="입학">입학</option>
                  		<option class="uTransferSelect" value="편입">편입</option>
                  	</select>
                  	<input class="univTxt univVal" type="date" id="univEndDate" name="univEndDate" value="${university.univEndDate }" min="2000-01-01" max="3000-12-31" style="height:24px; width: 120px;" />
                   	<select style="height:24px; width: 75px;" class="univselect univVal" name="univGraduate" id="univGraduate">
                  		<option value="0">졸업구분</option>
                  		<option class="uGraduateSelect" value="졸업">졸업</option>
                  		<option class="uGraduateSelect" value="졸업예정">졸업예정</option>
                  		<option class="uGraduateSelect" value="재학">재학</option>
                  	</select>                 	
                  </td>
                  <td class="align-middle">
                    <select class="univselect univVal" id="univRegion" name="univRegion">
                  		<option value="0">지역</option>
                  		<option class="uRegionSelect" value="서울">서울</option>
                  		<option class="uRegionSelect" value="인천">인천</option>
                  		<option class="uRegionSelect" value="대전">대전</option>
                  		<option class="uRegionSelect" value="광주">광주</option>
                  		<option class="uRegionSelect" value="부산">부산</option>
                  		<option class="uRegionSelect" value="울산">울산</option>
                  		<option class="uRegionSelect" value="대구">대구</option>
                  		<option class="uRegionSelect" value="강원">강원</option>
                  		<option class="uRegionSelect" value="경기">경기</option>
                  		<option class="uRegionSelect" value="충북">충북</option>
                  		<option class="uRegionSelect" value="충남">충남</option>
                  		<option class="uRegionSelect" value="전북">전북</option>
                  		<option class="uRegionSelect" value="전남">전남</option>
                  		<option class="uRegionSelect" value="경북">경북</option>
                  		<option class="uRegionSelect" value="경남">경남</option>
                  	</select>
                  </td>
                </tr>
			</tbody>
		</table>
	</div>

	<h6 class="mt-5 font-weight-bold">대학원
		<input type="button" class="btn btn-primary text-white mb-3 btn-sm font-weight-bold" style="float: right;" id="gsResetBtn" value="초기화" />
	</h6>
	
	<div class="col-md-12 mt-3 p-0">
		<table class="table border border-secondary col-md-12 mb-0 text-center table-sm">
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle" style="width: 37% ;">학교명<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 33% ;">전공<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 22% ;">졸업년도<span style="color : red;">*</span></th>
					<th class="text-center align-middle" style="width: 8% ;">지역<span style="color : red;">*</span></th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle">
                  	<input type="hidden" name="jobopenNo" id="gsJobopenNo" value="${jobopenBasic.jobopenNo }" />
					<input type="text" id="gsName" name="gsName" value="${gSchool.gsName }" class="mr-1 gschoolTxt gsVal" style="width: 200px" />
					<select style="height:24px; width:85px;" class="gsselect gsVal" id="gsBranch" name="gsBranch" >
						<option value="0">본교/분교</option>
						<option class="gBranchSelect" value="본교">본교</option>
						<option class="gBranchSelect" value="분교">분교</option>
					</select>
					<select style="height:24px; width:70px;" class="gsselect gsVal" id="gsDay" name="gsDay">
						<option value="0">주/야</option>
						<option class="gDaySelect" value="주간">주간</option>
						<option class="gDaySelect" value="야간">야간</option>
					</select>
                  </td>
                  <td class="align-middle">
					<input type="text" id="gsMajor" name="gsMajor" value="${gSchool.gsMajor }" class="mr-1 gschoolTxt gsVal" style="width: 200px" />
 					<input type="text" id="gsScore" name="gsScore" value="${gSchool.gsScore }" class="mr-1 gschoolTxt gsVal" style="width: 30px; "/> / <input type="text" id="gsTotalScore" name="gsTotalScore" value="${gSchool.gsTotalScore }" class="mr-1 gschoolTxt gsVal" style="width: 30px; "/> 만점
                  </td>
                  <td class="align-middle">
                  	<input type="date" name="gsEndDate" id="gsEndDate" value="${gSchool.gsEndDate}" min="2000-01-01" max="3000-12-31" style="height:24px; width: 120px;" class="gschoolTxt gsVal"/>
                  	<select style="height:24px; width: 80px;" class="gsselect gsVal" id="gsGraduate" name="gsGraduate">
                  		<option value="0">졸업구분</option>
                  		<option class="gGraduateSelect" value="졸업">졸업</option>
                  		<option class="gGraduateSelect" value="졸업예정">졸업예정</option>
                  		<option class="gGraduateSelect" value="재학">재학</option>
                  	</select>
                  </td>
                  <td class="align-middle">
                    <select class="gsselect gsVal" id="gsRegion" name="gsRegion">
                  		<option value="0">지역</option>
                  		<option class="gRegionSelect" value="서울">서울</option>
                  		<option class="gRegionSelect" value="인천">인천</option>
                  		<option class="gRegionSelect" value="대전">대전</option>
                  		<option class="gRegionSelect" value="광주">광주</option>
                  		<option class="gRegionSelect" value="부산">부산</option>
                  		<option class="gRegionSelect" value="울산">울산</option>
                  		<option class="gRegionSelect" value="대구">대구</option>
                  		<option class="gRegionSelect" value="강원">강원</option>
                  		<option class="gRegionSelect" value="경기">경기</option>
                  		<option class="gRegionSelect" value="충북">충북</option>
                  		<option class="gRegionSelect" value="충남">충남</option>
                  		<option class="gRegionSelect" value="전북">전북</option>
                  		<option class="gRegionSelect" value="전남">전남</option>
                  		<option class="gRegionSelect" value="경북">경북</option>
                  		<option class="gRegionSelect" value="경남">경남</option>
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
                     <li style="line-height: 150%;"><strong><span class="text-info">학력사항</span>은 최종학력까지 졸업년월, 학교명, 지역명 등을 빠짐없이 기재하여 주시기 바랍니다.</strong></li>
                     <li style="line-height: 150%;"><strong><span class="text-danger">(전문대학 이상의 성적란에는 본인의 누계평점 및 만점을 기재합니다. 예)3.0/4.5)</span></strong></li>
                     <li style="line-height: 150%;"><strong><span class="text-info">부전공/복수전공</span> 항목은 해당사항이 있을경우만 기재하여 주시기 바랍니다.</strong></li>                     
                  </ul>
                  </td>
               </tr>
            </tbody>
         </table>
	</div>
	
	<div class="col-12 mt-5 p-0 d-flex justify-content-end">
		<input class="btn btn-primary text-white" type="button" id="saveBtn" value="저장하고 계속하기"/>
	</div>
</form>
	
</div>


 <div id="logoutModal" class="modal">
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
			        <p class="font-weight-bold text-center" id="logoutModal">시간이 경과되어 자동로그아웃됩니다.</p>
				</div>
			
			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
				<a href="/user/logout"><button type="button" id="btnLogoutClose" class="font-weight-bold btn btn-primary" style="background-color: #376092">확인</button></a>
				</div>
			</div>
	      </div>
	 
	    </div>
    </div>


	
<%@ include file="../include/scriptLoader.jsp"%>
<script>
function checkUserD() {
	
	var jobopenNo = ${jobopenBasic.jobopenNo};
	
	$.ajax({
		type:"get"
		, url: "/apply/checkUserD"
		, dataType: "json"
		, data: {
			"jobopenNo" : jobopenNo
		}
		, success: function( data ) {
			
			if(data.userDetail>0) {
				location.href="/apply/userDetailUpdate?jobopenNo="+jobopenNo;
			} else {
				location.href="/apply/userDetail?jobopenNo="+jobopenNo;
			}
			
		}, error: function() {
			alert("error");
		}
	})

	
}



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

function checkMil() {
	
	var jobopenNo = ${jobopenBasic.jobopenNo};
	
	$.ajax({
		type:"get"
		, url: "/apply/checkMil"
		, dataType: "json"
		, data: {
			"jobopenNo" : jobopenNo
		}
		, success: function( data ) {
			if(data.military>0) {
				location.href="/apply/militaryUpdate?jobopenNo="+jobopenNo;
			} else {
				location.href="/apply/military?jobopenNo="+jobopenNo;
			}
			
		}
	})
}

function checkCar() {
	
	var jobopenNo = ${jobopenBasic.jobopenNo};
	
	$.ajax({
		type:"get"
		, url: "/apply/checkCar"
		, dataType: "json"
		, data: {
			"jobopenNo" : jobopenNo
		}
		, success: function( data ) {
			if(data.language>0 || data.license>0 || data.career>0 || data.activity>0 || data.experience>0 || data.material>0) {
				location.href="/apply/careerUpdate?jobopenNo="+jobopenNo;
			} else {
				location.href="/apply/career?jobopenNo="+jobopenNo;
			}
			
		}
	})

	
}

function checkIntro() {
	
	var jobopenNo = ${jobopenBasic.jobopenNo};
	
	$.ajax({
		type:"get"
			, url: "/apply/checkIntro"
			, dataType: "json"
			, data: {
				"jobopenNo" : jobopenNo
			}
			, success: function( data ) {
				if(data.introduce>0) {
					location.href="/apply/introduceUpdate?jobopenNo="+jobopenNo;
				} else {
					location.href="/apply/introduce?jobopenNo="+jobopenNo;
				}
				
			}
		
	})
}




$("#saveBtn").click(function() {
	console.log("saveBtn 클릭");
	
		
		//고등학교 validation
		var checkH = 0;
		var hOk = false;
		
		var hsName = document.getElementById("hsName");
		var highVal = document.getElementsByClassName("highVal");
		
// 		console.log(highVal);
			

		for(var i=0; i<highVal.length; i++) {
			var checkVal = highVal[i].value;
				
			if(checkVal=="" || checkVal==null || checkVal==0) {
				checkH++;
			}
		}
		
// 		console.log("checkH : " + checkH);
		
		
		//전문대학 validation
		
		var checkCol = 0;
		var colOk = false;
		
		var colVal = document.getElementsByClassName("colVal");
		
// 		console.log(colVal.length);
			
		for(var i=0; i<colVal.length; i++) {
			var checkVal = colVal[i].value;
				
			if(checkVal=="" || checkVal==null || checkVal==0) {
				checkCol++;
			}
			
		}
		
		
		
		//대학교 validation
		
		var checkUniv = 0;
		var univOk = false;
		
		var univVal = document.getElementsByClassName("univVal");
		
// 		console.log(univVal.length);
			
		for(var i=0; i<univVal.length; i++) {
			var checkVal = univVal[i].value;
			
			if(i!=4) {
				console.log("i 4가 들어오면 안된다"+i);
				if(checkVal=="" || checkVal==null || checkVal==0) {
					checkUniv++;
					continue;
				}
			} else {
				console.log("i에 4만 들어와야함 : "+i);
				checkUniv++;
				continue;
			}
			
		}
		
// 		console.log("univ : " + checkUniv);
		
		
		//대학원 validation
		
		var checkGs = 0;
		var gsOk = false;
		
		var gsVal = document.getElementsByClassName("gsVal");
		
// 		console.log(gsVal.length);
			
		for(var i=0; i<gsVal.length; i++) {
			var checkVal = gsVal[i].value;
				
			if(checkVal=="" || checkVal==null || checkVal=="0") {
				checkGs++;
			}
		}
		
// 		console.log("checkGs : " + checkGs);

		
		if(checkH!=highVal.length && checkH!=0) {
			console.log("고등학교에 빈칸 있음");
			alert("고등학교 학력사항 항목을 모두 입력해주십시오.");
		} else if(checkCol!=colVal.length && checkCol!=0) {
			console.log("전문대학에 빈칸 있음");
			alert("전문대학 학력사항 항목을 모두 입력해주십시오.");
		} else if(checkUniv!=univVal.length && checkUniv!=1 && checkUniv!=0){
			console.log("대학교에 빈칸 있음");
			alert("대학교 학력사항 항목을 모두 입력해주십시오.");
		} else if(checkGs!=gsVal.length && checkGs!=0) {
			console.log("대학원에 빈칸 있음");
			alert("대학원 학력사항 항목을 모두 입력해주십시오.");
		} else {
			hOk = true;
			colOk = true;
			univOk = true;
			gsOk = true;
		}
		
		
		if(hOk==true && colOk==true && univOk==true && gsOk==true) {
			
			var colCheck = false;
			var univCheck = false;
			var gsCheck = false;
			
			var colStartDate = $("#colStartDate").val();
			var colEndDate = $("#colEndDate").val();
			var univStartDate = $("#univStartDate").val();
			var univEndDate = $("#univEndDate").val();
			var colScore = $("#colScore").val();
			var colTotalScore = $("#colTotalScore").val();
			var univScore = $("#univScore").val();
			var univTotalScore = $("#univTotalScore").val();
			var gsScore = $("#gsScore").val();
			var gsTotalScore = $("#gsTotalScore").val();
			
			var patternScore = /^\d+(?:[.]?[\d]?[\d])?$/ //소수점 둘째
			var patternTScore = /^\d+(?:[.]?[\d])?$/ //소수점 첫째
			
			
			if(checkCol==0) {		
			//전문대학 유효성검사
				if(colStartDate!="" || colStartDate!=null) {
					
					var colStartArr = colStartDate.split('-');
					var colEndArr = colEndDate.split('-');
					
					var colStart_Day = new Date(colStartArr[0],colStartArr[1],colStartArr[2]);
					var colEnd_Day = new Date(colEndArr[0],colEndArr[1],colEndArr[2]);
					
					if(colStart_Day.getTime() > colEnd_Day.getTime()) {
						alert("졸업일보다 입학일이 빨라야합니다.");
						$("#colStartDate").focus();
						console.log("전문대 입학일");
						return false;
					} else if(!patternScore.test(colScore)) {
						alert("학점은 소수점 둘째자리까지 입니다.");
						$("#colScore").val('');
						$("#colScore").focus();
						console.log("전문대 학점");
						return false;
					} else if(!patternTScore.test(colTotalScore)) {
						alert("총점은 소수점 첫째자리까지 입니다.");
						$("#colTotalScore").val('');
						$("#colTotalScore").focus();
						console.log("전문대 총점");
						return false;
					} else {
						colCheck = true;
					}	
					
				} else {
					colCheck = true;
				}
			
			} else {
				colCheck = true;
			}
			
			
			if(checkUniv==0) {
			//대학교 유효성검사
				if(univStartDate!="" || univStartDate!=null) {
					
					var univStartArr = univStartDate.split('-');
					var univEndArr = univEndDate.split('-');
					
					var univStart_Day = new Date(univStartArr[0],univStartArr[1],univStartArr[2]);
					var univEnd_Day = new Date(univEndArr[0],univEndArr[1],univEndArr[2]);
					
					if(univStart_Day.getTime() > univEnd_Day.getTime()) {
						alert("졸업일보다 입학일이 빨라야합니다.");
						$("#univStartDate").focus();
						console.log("대학 졸업");
						return false;
					} else if(!patternScore.test(univScore)) {
						alert("학점은 소수점 둘째자리까지 입니다.");
						$("#univScore").val('');
						$("#univScore").focus();
						console.log("대학 학점");
						return false;
					} else if(!patternTScore.test(univTotalScore)) {
						alert("총점은 소수점 첫째자리까지 입니다.");
						$("#univTotalScore").val('');
						$("#univTotalScore").focus();
						console.log("대학 총점");
						return false;
					} else {
						univCheck = true;
					}	
					
				} else {
					univCheck = true;
				}
			
			} else {
				univCheck = true;
				
			}
			
			if(checkGs==0) {
				//대학원 유효성검사
				if(gsScore!="" || gsScore!=null) {
					
					if(!patternScore.test(gsScore)) {
						alert("학점은 소수점 둘째자리까지 입니다.");
						$("#gsScore").val('');
						$("#gsScore").focus();
						console.log("대학원 학점");
						return false;
					} else if(!patternTScore.test(gsTotalScore)) {
						alert("총점은 소수점 첫째자리까지 입니다.");
						$("#gsTotalScore").val('');
						$("#gsTotalScore").focus();
						console.log("대학원 총점");
						return false;
					} else {
						gsCheck = true;
					}	
					
				} else {
					gsCheck = true;
				}			
			
			} else {
				gsCheck = true;				
			}
			
			if(colCheck==true && univCheck==true && gsCheck==true) {
				$("#acaForm").submit();
			}
			
	}
	
	
});



$("#hsResetBtn").click(function() {
// 	console.log("hs버튼 클릭")
	$(".hschoolTxt").val('');
	$(".hsselect").find('option:first').prop('selected', true);
// 	console.log("hs버튼 클릭2")
});

$("#colResetBtn").click(function() {
	console.log("col 버튼 클릭")
	$(".colTxt").val('');
	$(".colselect").find('option:first').prop('selected', true);


});

$("#univResetBtn").click(function() {
	console.log("univ 버튼 클릭")
	$(".univTxt").val('');
	$(".univselect").find('option:first').prop('selected', true);
});

$("#gsResetBtn").click(function() {
	console.log("버튼 클릭")
	$(".gschoolTxt").val('');
	$(".gsselect").find('option:first').prop('selected', true);

	
});

// $("#saveBtn").click(function() {
// 	console.log("save버튼 클릭");
// 	$("#hsForm").submit();
// });

$(".cancelAPI").click(function() {
	
	var cancelAPI = $(this).parent().children().eq(0);
	cancelAPI.val("");
});

$(".cancelAPIS").click(function() {
	
	var cancelAPIS = $(this).parent().children().eq(2);
	cancelAPIS.val("");
});

$(".cancelAPIS2").click(function() {
	
	var cancelAPIS2 = $(this).parent().children().eq(1);
	cancelAPIS2.val("");
})
</script>
<%@ include file="../apply/schoolAPI.jsp"%>		
<%@ include file="../apply/collegeAPI.jsp"%>	
<%@ include file="../apply/colMajorAPI.jsp"%>	
<%@ include file="../apply/universityAPI.jsp"%>	
<%@ include file="../apply/majorAPI.jsp"%>
<%@ include file="../apply/minorAPI.jsp"%>
<%@ include file="../include/footer.jsp"%>	