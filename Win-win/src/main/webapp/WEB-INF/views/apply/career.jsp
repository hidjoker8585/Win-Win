<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	var gap = now.getTime() - Dday.getTime();
	var result = Math.floor(gap/ (1000*60*60*24)) * -1;
	
	$("#dDay").val("(D- " + result + "일)");
	
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

	<form action="/apply/career" method="post" id="career" enctype="multipart/form-data">
	<h4 class="mt-4 mb-3 font-weight-bold">경력사항</h4><input type="hidden" name="jobopenNo" value="${jobopenBasic.jobopenNo }" />
	<div class="row">
		<a href="/apply/userDetailUpdate?jobopenNo=${jobopenBasic.jobopenNo }"><img class="img-fluid d-block ml-3" src="/resources/image/G_userDetail.png"></a>
		<img style="cursor: pointer" class="img-fluid d-block" src="/resources/image/G_academic.png" onclick="checkAca();">
		<a href="/apply/militaryUpdate?jobopenNo=${jobopenBasic.jobopenNo }"><img class="img-fluid d-block" src="/resources/image/G_military.png"></a>
		<img class="img-fluid d-block" src="/resources/image/B_career.png">
		<img class="img-fluid d-block" src="/resources/image/G_introduce.png">
		<img class="img-fluid d-block" src="/resources/image/G_complete.png">
	</div>

	<h6 class="mt-5 font-weight-bold">어학정보</h6>
	<div class="col-md-12 border border-secondary mt-3 p-0">
		<table class="table col-md-12 mb-0 text-center table-sm" id="langTable">
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle">외국어명</th>
					<th class="text-center align-middle">회화수준</th>
					<th class="text-center align-middle">공익시험명</th>
					<th class="text-center align-middle">점수(또는 급)</th>
					<th class="text-center align-middle">취득일</th>
					<th class="text-center align-middle">주관처</th>
					<th class="text-center align-middle">삭제</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle"><input type="text" id="lName" name="langArr[0].lName" value="영어" style="width:80px;" readonly/></td>
                  <td>
                  	<select style="height:25px; width:70px;" class="language" id="grade" name="langArr[0].grade">
                  		<option value="0">선택</option>
                  		<option value="상">상</option>
                  		<option value="중">중</option>
                  		<option value="하">하</option>
                  	</select>
                  </td>
                  <td>
                  	<select style="height:26px; width:150px;" class="language" id="testName" name="langArr[0].testName">
                  		<option value="0">선택</option>
                  		<option value="TOEIC">TOEIC</option>
                  		<option value="TOEFL">TOEFL</option>
                  		<option value="TEPS">TEPS</option>
                  		<option value="TOEIC Speaking">TOEIC Speaking</option>
                  		<option value="OPIc">OPIc</option>
                  	</select>
                  </td>
                  <td class="align-middle"><input type="text" class="language" id="score" name="langArr[0].score" /></td>
                  <td class="align-middle"><input type="date" class="language languageDate" id="lDate" name="langArr[0].lDate" min="2000-01-01" max="3000-12-31" style="height:25px;"></td>
                  <td class="align-middle"><input type="text" class="language" id="lOrgan" name="langArr[0].lOrgan" /></td>
                  <td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td>
                </tr>
                <tr>
                	<td colspan="7" class="text-center align-middle">항목 추가 시 버튼을 눌러주시기 바랍니다. 
                	<span style="color:blue;">(최대 4개까지 가능)</span>
                	<input type="button" name="langABtn" value="+ 추가" />
                	</td>
                </tr>
			</tbody>
		</table>
	</div>
	
	<h6 class="mt-5 font-weight-bold">자격사항</h6>
	<div class="col-md-12 border border-secondary mt-3 p-0">
		<table class="table col-md-12 mb-0 text-center table-sm">
			
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle">자격증</th>
					<th class="text-center align-middle">취득일</th>
					<th class="text-center align-middle">주관처</th>
					<th class="text-center align-middle">삭제</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle"><input type="text" class="license" id="selectLicense0" name="licArr[0].liName" class="mr-1" style="width:200px" /><input class="licenseAPI" data-idx="0" type="button" style="margin-right: 3px;" value="검색"/><input id="liCancel0" data-idx="0" type="button" value="취소"/></td>
                  <td class="align-middle"><input type="date" class="license licenseDate" name="licArr[0].liDate" min="2000-01-01" max="3000-12-31" style="height:25px;"></td>
                  <td class="align-middle"><input type="text" class="license" name="licArr[0].liOrgan" /></td>
                  <td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td>
                </tr>
                <tr>
                	<td colspan="7" class="text-center align-middle">항목 추가 시 버튼을 눌러주시기 바랍니다. 
                	<span style="color:blue;">(최대 4개까지 가능)</span>
                	<input type="button" name="liABtn" value="+ 추가" />
                	</td>
                </tr>
			</tbody>
		</table>
	</div>
	
	<h6 class="mt-5 font-weight-bold">회사경력</h6>
	<div class="col-md-12 border border-secondary mt-3 p-0">
		<table class="table col-md-12 mb-0 text-center table-sm">
			
			<tbody>
				<tr style="line-height: 1.5em;">
					<th colspan="2" class="text-center align-middle">근무기간</th>
					<th class="text-center align-middle">회사명</th>
					<th class="text-center align-middle">직위</th>
					<th class="text-center align-middle">담당업무</th>
					<th class="text-center align-middle">연봉(만원)</th>
					<th class="text-center align-middle">퇴직사유</th>
					<th class="text-center align-middle">삭제</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle"><input type="date" class="career carStartDate" name="carArr[0].cStartDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td>
                  <td class="align-middle"><input type="date" class="career carEndDate" name="carArr[0].cEndDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td>
                  <td class="align-middle"><input type="text" class="career" name="carArr[0].cName" class="mr-1" style="width:100px" /></td>
                  <td class="align-middle"><input type="text" class="career" name="carArr[0].position" class="mr-1" style="width:50px" /></td>
                  <td class="align-middle"><input type="text" class="career" name="carArr[0].task" class="mr-1" style="width:100px" /></td>
                  <td class="align-middle"><input type="text" class="career carSalary" name="carArr[0].salary" class="mr-1" style="width:100px" /></td>
                  <td class="align-middle"><input type="text" class="career" name="carArr[0].cContent" class="mr-1" style="width:300px" /></td>
                  <td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td>
                </tr>
                <tr>
                	<td colspan="8" class="text-center align-middle">항목 추가 시 버튼을 눌러주시기 바랍니다. 
                	<span style="color:blue;">(최대 4개까지 가능)</span>
                	<input type="button" name="carABtn" value="+ 추가" />
                	</td>
                </tr>
			</tbody>
		</table>
	</div>
	
	<h6 class="mt-5 font-weight-bold">사회봉사활동</h6>
	<div class="col-md-12 border border-secondary mt-3 p-0">
		<table class="table col-md-12 mb-0 text-center table-sm">
			
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle">단체명</th>
					<th colspan="2" class="text-center align-middle">기간</th>
					<th class="text-center align-middle">설명</th>
					<th class="text-center align-middle">삭제</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle"><input type="text" class="activity" name="actArr[0].aName" class="mr-1" style="width:250px" /></td>
                  <td class="align-middle"><input type="date" class="activity actStartDate" name="actArr[0].aStartDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td>
                  <td class="align-middle"><input type="date" class="activity actEndDate" name="actArr[0].aEndDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td>
                  <td class="align-middle"><input type="text" class="activity" name="actArr[0].aContent" class="mr-1" style="width:350px" /></td>
                  <td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td>
                </tr>
                <tr>
                	<td colspan="8" class="text-center align-middle">항목 추가 시 버튼을 눌러주시기 바랍니다. 
                	<span style="color:blue;">(최대 4개까지 가능)</span>
                	<input type="button" name="actABtn" value="+ 추가" />
                	</td>
                </tr>
			</tbody>
		</table>
	</div>
	
	<h6 class="mt-5 font-weight-bold">연수경험</h6>
	<div class="col-md-12 border border-secondary mt-3 p-0">
		<table class="table col-md-12 mb-0 text-center table-sm">
			
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle">구분</th>
					<th class="text-center align-middle">연수기관</th>
					<th colspan="2" class="text-center align-middle">기간</th>
					<th class="text-center align-middle">설명</th>
					<th class="text-center align-middle">삭제</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td>
                  <select style="height:25px; width:80px;" class="experience" name="expArr[0].eOption">
                  		<option value="0">선택</option>
                  		<option value="봉사">봉사</option>
                  		<option value="수상경력">수상경력</option>
                  		<option value="어학연수">어학연수</option>
                  		<option value="TOEIC Speaking">인턴</option>
                  		<option value="기타">기타</option>
                  	</select>
                  </td>
                  <td class="align-middle"><input type="text" class="experience" name="expArr[0].eOrgan" class="mr-1" style="width:250px" /></td>
                  <td class="align-middle"><input type="date" class="experience expStartDate" name="expArr[0].eStartDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td>
                  <td class="align-middle"><input type="date" class="experience expEndDate" name="expArr[0].eEndDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td>
                  <td class="align-middle"><input type="text" class="experience" name="expArr[0].eContent" class="mr-1" style="width:350px" /></td>
                  <td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td>
                </tr>
                <tr>
                	<td colspan="8" class="text-center align-middle">항목 추가 시 버튼을 눌러주시기 바랍니다. 
                	<span style="color:blue;">(최대 4개까지 가능)</span>
                	<input type="button" name="expABtn" value="+ 추가" />
                	</td>
                </tr>
			</tbody>
		</table>
	</div>
	
	<h6 class="mt-5 font-weight-bold">포트폴리오 첨부파일</h6>
	<div class="col-md-12 border border-secondary mt-3 p-0">
		<table class="table col-md-12 mb-0 text-center table-sm">
			
			<tbody>
				<tr style="line-height: 1.5em;">
					<th class="text-center align-middle">종류</th>
					<th class="text-center align-middle">파일명</th>
					<th class="text-center align-middle">등록수정일</th>
					<th class="text-center align-middle">용량</th>
					<th class="text-center align-middle">파일첨부</th>
					<th class="text-center align-middle">삭제</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="align-middle"><input type="text" id="extFile" name="extName" class="mr-1" style="width:150px;" readOnly/></td>
                  <td class="align-middle"><input type="text" id="originFile" name="originName" class="mr-1" style="width:300px;" readOnly/></td>
                  <td class="align-middle"><input type="text" id="updateday" name="date" class="mr-1" style="width:200px;" readOnly/></td>
                  <td class="align-middle"><input type="text" id="fileSize" name="filesize" class="mr-1" style="width:200px" readOnly/></td>
                  <td class="align-middle"><input type="file" name="file" id="file" style="display:none"><input type="button" onclick='$("#file").click();' value="파일첨부"/></td>
                  <td class="align-middle"><input type="button" id="DLBtn" value="삭제"/></td>
                </tr>
<!--                 <tr> -->
<!--                 	<td colspan="8" class="text-center align-middle">파일 첨부시 파일첨부 버튼을 눌러주시기 바랍니다.  -->
<!--                 	<span style="color:blue;">(최대 4개까지 가능)</span> -->
<!--                 	<input type="button" name="matABtn" value="+ 추가" /> -->
<!--                 	</td> -->
<!--                 </tr> -->
			</tbody>
		</table>
	</div>

	   <div class="col-12 mt-5 p-0">
         <table class="table border">
            <tbody>
               <tr>
                  <th class="text-center table-light align-middle">
                     <i class="fas fa-exclamation-triangle fa-3x"></i>
                  </th>
                  <td class="table-light align-middle"> 
                  <ul class="mb-0">
                     <li style="line-height: 150%;"><strong>경력사항은 <span class="text-info">가장 최근의 경력부터 과거경력의 순서</span>로 작성합니다.</strong></li>
                     <li style="line-height: 150%;"><strong>학교 졸업 후 <span class="text-info">경력사항을 빠짐없이 모두 </span>기재합니다.</strong></li>
                     <strong><span class="text-danger">[퇴직사유 예 : 이직, 육아, 출산, 병가, 구조조정, 회사폐업 등]</span></strong>
                     <li><strong>연봉은 "( 월급여 X 12개월 ) + 상여"를 기준으로 작성하시기 바랍니다. (계약연봉기준)</strong></li>
                     <li><strong>해외연수의 경우 <span class="text-info">확인서 제출이 가능한 경우</span>에 한해서 기재하여 주시기 바랍니다.</strong></li>
                     <li><strong>포트폴리오 파일 첨부는 1개만 가능하며 <span class="text-danger">등록 가능한 최대 용량은 총 10MB</span>입니다.</strong></li>
                  </ul>
                  </td>
               </tr>
            </tbody>
         </table>
   </div>
   
   </form>
   <div class="col-12 mt-5 p-0 d-flex justify-content-end">
   	  <input class="btn btn-primary text-white" type="button" id="Btn" value="저장하고 계속하기"/>
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
$(document).ready(function() {
	$(document).on("click","[name=DBtn]",function(){
        
        var value = $(this).parent().parent();
        var standard = $(this).parent().parent().parent().children('tr');
        
         if( standard.length > 3 ) {
        	value.remove();
        }

    });
	
	$(document).on("click","[class=licenseAPI]",function(){
		console.log("버튼클릭");
		
	})
	
	function addLangForm(i) {
		var form = '<tr><td class="align-middle a"><input type="text" name="langArr['+i+'].lName" value="영어" style="width:80px;" readonly/></td><td><select style="height:25px; width:70px;" class="language" name="langArr['+i+'].grade"><option value="0">선택</option><option value="상">상</option><option value="중">중</option><option value="하">하</option></select></td><td><select style="height:26px; width:150px;" class="language" name="langArr['+i+'].testName"><option value="0">선택</option><option value="TOEIC">TOEIC</option><option value="TOEFL">TOEFL</option><option value="TEPS">TEPS</option><option value="TOEIC Speaking">TOEIC Speaking</option><option value="OPIc">OPIc</option> </select></td><td class="align-middle"><input type="text" class="language" name="langArr['+i+'].score" /></td><td class="align-middle"><input type="date" class="language languageDate" name="langArr['+i+'].lDate" min="2000-01-01" max="3000-12-31" style="height:25px;"></td><td class="align-middle"><input type="text" class="language" name="langArr['+i+'].lOrgan" /></td><td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td></tr>';
		return form;
	}
	
	var i=1;
	$(document).on("click","[name=langABtn]",function(){
		
		
		var test = $(this).parent().parent().parent().children().eq(1);
		var standard = $(this).parent().parent().parent().children('tr');
		
		$.trClone = test.clone().html();
    	$.newTr = $("<tr>"+$.trClone+"</tr>");
    	
		
		var a = addLangForm(i);

		if( standard.length < 6 ) {
			test.parent().children().last().before(a);
			i++;
    	}
 	});
	
	function addLiForm(i) {
		var form = '<tr><td class="align-middle"><input type="text" class="license" id="selectLicense'+i+'" name="licArr['+i+'].liName" class="mr-1" style="width:200px" /><input class="licenseAPI" type="button" data-idx="'+i+'" style="margin-right: 3px;" value="검색"/><input class="liCancel" type="button" data-idx="'+i+'" value="취소"/></td><td class="align-middle"><input type="date" class="license licenseDate" name="licArr['+i+'].liDate" min="2000-01-01" max="3000-12-31" style="height:25px;"></td><td class="align-middle"><input type="text" class="license" name="licArr['+i+'].liOrgan" /></td><td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td></tr>';
		return form;
	}
	
	var i=1;
	$(document).on("click","[name=liABtn]",function(){
		
		
		var test = $(this).parent().parent().parent().children().eq(1);
		var standard = $(this).parent().parent().parent().children('tr');
		
		$.trClone = test.clone().html();
    	$.newTr = $("<tr>"+$.trClone+"</tr>");
    	
		
		var a = addLiForm(i);

		if( standard.length < 6 ) {
			test.parent().children().last().before(a);
			i++;
    	}
 	});
	
	
	function addCarForm(i) {
		var form = '<tr><td class="align-middle"><input type="date" class="career carStartDate" name="carArr['+i+'].cStartDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td><td class="align-middle"><input type="date" class="career carEndDate" name="carArr['+i+'].cEndDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td><td class="align-middle"><input type="text" class="career" name="carArr['+i+'].cName" class="mr-1" style="width:100px" /></td><td class="align-middle"><input type="text" class="career" name="carArr['+i+'].position" class="mr-1" style="width:50px" /></td><td class="align-middle"><input type="text" class="career" name="carArr['+i+'].task" class="mr-1" style="width:100px" /></td><td class="align-middle"><input type="text" class="career carSalary" name="carArr['+i+'].salary" class="mr-1" style="width:100px" /></td><td class="align-middle"><input type="text" class="career" name="carArr['+i+'].cContent" class="mr-1" style="width:300px" /></td><td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td></tr>';
		return form;
	}
	
	var i=1;
	$(document).on("click","[name=carABtn]",function(){
		
		
		var test = $(this).parent().parent().parent().children().eq(1);
		var standard = $(this).parent().parent().parent().children('tr');
		
		$.trClone = test.clone().html();
    	$.newTr = $("<tr>"+$.trClone+"</tr>");
    	
		
		var a = addCarForm(i);

		if( standard.length < 6 ) {
			test.parent().children().last().before(a);
			i++;
    	}
 	});
	
	
	function addActForm(i) {
		var form = '<tr><td class="align-middle"><input type="text" class="activity" name="actArr['+i+'].aName" class="mr-1" style="width:250px" /></td><td class="align-middle"><input type="date" class="activity actStartDate" name="actArr['+i+'].aStartDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td><td class="align-middle"><input type="date" class="activity actEndDate" name="actArr['+i+'].aEndDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td><td class="align-middle"><input type="text" class="activity" name="actArr['+i+'].aContent" class="mr-1" style="width:350px" /></td><td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td></tr>';
		return form;
	}
	
	var i=1;
	$(document).on("click","[name=actABtn]",function(){
		
		
		var test = $(this).parent().parent().parent().children().eq(1);
		var standard = $(this).parent().parent().parent().children('tr');
		
		$.trClone = test.clone().html();
    	$.newTr = $("<tr>"+$.trClone+"</tr>");
    	
		
		var a = addActForm(i);

		if( standard.length < 6 ) {
			test.parent().children().last().before(a);
			i++;
    	}
 	});
	
	
	function addExpForm(i) {
		var form = '<tr><td> <select style="height:25px; width:80px;" class="experience" name="expArr['+i+'].eOption"><option value="0">선택</option><option value="봉사">봉사</option><option value="수상경력">수상경력</option><option value="어학연수">어학연수</option><option value="TOEIC Speaking">인턴</option><option value="기타">기타</option> </select></td><td class="align-middle"><input type="text" class="experience" name="expArr['+i+'].eOrgan" class="mr-1" style="width:250px" /></td><td class="align-middle"><input type="date" class="experience expStartDate" name="expArr['+i+'].eStartDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td><td class="align-middle"><input type="date" class="experience expEndDate" name="expArr['+i+'].eEndDate" max="3000-12-31" min="1900-01-01" style="height:25px; width:120px;"></td><td class="align-middle"><input type="text" class="experience" name="expArr['+i+'].eContent" class="mr-1" style="width:350px" /></td><td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td></tr>';
		return form;
	}
	
	var i=1;
	$(document).on("click","[name=expABtn]",function(){
		
		
		var test = $(this).parent().parent().parent().children().eq(1);
		var standard = $(this).parent().parent().parent().children('tr');
		
		$.trClone = test.clone().html();
    	$.newTr = $("<tr>"+$.trClone+"</tr>");
    	
		
		var a = addExpForm(i);

		if( standard.length < 6 ) {
			test.parent().children().last().before(a);
			i++;
    	}
 	});
	
	$("#DLBtn").click(function(){
		
		$("#extFile").val("");
		$("#originFile").val("");
		$("#updateday").val("");
		$("#fileSize").val("");
		$("#file").val("");
		
	});
	
	
// 	function addMatForm(i) {
// 		var form = '<tr><td class="align-middle"><input type="text" id="extFile" name="matArr['+i+'].extName" class="mr-1" style="width:150px;" disabled/></td><td class="align-middle"><input type="text" id="originFile" name="matArr['+i+'].originName" class="mr-1" style="width:300px;" disabled/></td><td class="align-middle"><input type="text" name="matArr['+i+'].date" class="mr-1" style="width:200px;" disabled/></td><td class="align-middle"><input type="text" id="fileSize" name="matArr['+i+'].filesize" class="mr-1" style="width:200px" disabled/></td><td class="align-middle"><input type="file" name="file" id="file'+i+'" style="display:none"><input type="button" onclick="$("#file'+i+'").click();" value="파일첨부"/></td><td class="align-middle"><input type="button" name="DBtn" value="삭제"/></td></tr>';
// 		return form;
// 	}
	
// 	var i=1;
// 	$(document).on("click","[name=matABtn]",function(){
		
		
// 		var test = $(this).parent().parent().parent().children().eq(1);
// 		var standard = $(this).parent().parent().parent().children('tr');
		
// 		$.trClone = test.clone().html();
//     	$.newTr = $("<tr>"+$.trClone+"</tr>");
    	
		
// 		var a = addMatForm(i);

// 		if( standard.length < 6 ) {
// 			test.parent().children().last().before(a);
// 			i++;
//     	}
//  	});
	
	$('#liCancel0').click(function() {
		$('#selectLicense0').val("");	
	});
  
});

$('#file').on('change', function(){
	
	var originName = $(this).val().split('\\').pop();
	var realName = originName.split('.')[0];
	var extName = $(this).val().split('.').pop();

	var fileSize = document.getElementById('file').files[0].size/1024;

	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = mm+'/'+dd+'/'+yyyy;
	
	$("#extFile").val(extName);
	$("#originFile").val(realName);
	$("#fileSize").val(fileSize.toFixed(2));
	$("#updateday").val(today);

});

$('#Btn').click(function() {
	console.log("career 저장하고 계속하기 클릭");
	
	//어학 null validation
	var checkLang = 0;
	var langOk = false;
	
	var langVal = document.getElementsByClassName("language");
	console.log("Language 갯수 : " + langVal.length);
	
	for(var i=0; i<langVal.length; i++) {
		var checkVal = langVal[i].value;
		
		if(checkVal=="" || checkVal==null || checkVal==0) {
			checkLang++;
		}
	}
		
	console.log("checkLang : " + checkLang);
	
	//자격증 null validation _ class="license"
	var checkLic= 0;
	var licOk = false;
	
	var licVal = document.getElementsByClassName("license");
	console.log("License 갯수 : "+ licVal.length);
	
	for(var i=0; i<licVal.length; i++) {
		var checkVal = licVal[i].value;
		
		if(checkVal=="" || checkVal==null || checkVal==0) {
			checkLic++;
		}
	}
	
	console.log("checkLic : " + checkLic);
	
	//회사경력 null valication_class="career" 
	
	var checkCar= 0;
	var carOk = false;
	
	var carVal = document.getElementsByClassName("career");
	console.log("Career 갯수 : "+ carVal.length);
	
	for(var i=0; i<carVal.length; i++) {
		var checkVal = carVal[i].value;
		
		if(checkVal=="" || checkVal==null || checkVal==0) {
			checkCar++;
		}
	}
	
	console.log("checkCar : " + checkCar);
	
	//사회봉사 null validation_class="Activity"
	var checkAct= 0;
	var actOk = false;
	
	var actVal = document.getElementsByClassName("activity");
	console.log("Activity 갯수 : "+ actVal.length);
	
	for(var i=0; i<actVal.length; i++) {
		var checkVal = actVal[i].value;
		
		if(checkVal=="" || checkVal==null || checkVal==0) {
			checkAct++;
		}
	}
	
	console.log("checkAct : " + checkAct);

	//연수경험 null validation_class="experience"
	var checkExp= 0;
	var expOk = false;
	
	var expVal = document.getElementsByClassName("experience");
	console.log("Experience 갯수 : "+ expVal.length);
	
	for(var i=0; i<expVal.length; i++) {
		var checkVal = expVal[i].value;
		
		if(checkVal=="" || checkVal==null || checkVal==0) {
			checkExp++;
		}
	}
	
	console.log("checkExp : " + checkExp);
	


	//-----------------------------------------------
	
	if(checkLang!=langVal.length && checkLang!=0) {
		console.log("어학정보 빈칸있음");
		alert("어학정보 항목을 모두 입력해주십시오.");
	} else if(checkLic!=licVal.length && checkLic!=0) {
		console.log("자격사항 빈칸있음");
		alert("자격사항 항목을 모두 입력해주십시오.");		
	} else if(checkCar!=carVal.length && checkCar!=0) {
		console.log("회사경력 빈칸있음");
		alert("회사경력 항목을 모두 입력해주십시오.");		
	} else if(checkAct!=actVal.length && checkAct!=0) {
		console.log("사회봉사 빈칸있음");
		alert("사회봉사활동 항목을 모두 입력해주십시오.");		
	} else if(checkExp!=expVal.length && checkExp!=0) {
		console.log("연수경험 빈칸있음");
		alert("연수경험 항목을 모두 입력해주십시오.");		
	} else {
		langOk = true;
		licOk = true;
		carOk = true;
		actOk = true;
		expOk = true;
	}
	
	if(langOk == true && licOk == true && carOk == true && actOk == true && expOk == true){
		var langCheck = false;
		var licCheck = false;
		var carCheck = false;
		var actCheck = false;
		var expCheck = false;
		
		//어학 취득일 검증
		
		if(langCheck==false) {
			
			console.log("langCheck if문");
			
			var langDate = document.getElementsByClassName("languageDate");
			for(var i=0; i<langDate.length;i++) {
				var languageDate = langDate[i].value;
				console.log("languageDate : " + languageDate);
				
				//오늘 날짜
				var now = new Date();
				console.log(now);
				
				//어학 취득일
				var langDateArr = languageDate.split('-');
				var lang_Day = new Date(langDateArr[0], langDateArr[1], langDateArr[2]);
				
				//오늘 날짜-어학 취득일
				var gap = now.getTime() - lang_Day.getTime();
				var result = Math.floor(gap/(1000*60*60*24)) * -1;

				console.log("result : " + result);
				
				
				if(result>30) {
					alert("어학정보 취득일을 확인해주십시오.");
					langCheck = false;
					
					break;
				} else {
					langCheck = true;
				}
				
			}
			
			console.log("langCheck : " + langCheck);

		} 
		
		
		if(langCheck==true && licCheck==false) {
			
			console.log("licCheck if문");
						
			//자격증 취득일 검증
			var licDate = document.getElementsByClassName("licenseDate");
			
			for(var i=0; i<licDate.length;i++) {
				var licenseDate = licDate[i].value;
				console.log("licenseDate : " + licenseDate);
				
				//오늘 날짜
				var now = new Date();
				console.log(now);
				
				//자격증 취득일
				var licDateArr = licenseDate.split('-');
				var lic_Day = new Date(licDateArr[0], licDateArr[1], licDateArr[2]);
				
				//오늘 날짜-어학 취득일
				var gap = now.getTime() - lic_Day.getTime();
				var result = Math.floor(gap/(1000*60*60*24)) * -1;

				console.log("result : " + result);
				
				
				if(result>30) {
					alert("자격증 취득일을 확인해주십시오.");
					licCheck = false;
					
					break;
				} else {
					licCheck = true;
				}
				
			}
			
			console.log("licCheck : " + licCheck);

		} 
		
		if(langCheck==true && licCheck==true && carCheck==false) {
			
			console.log("carCheck if문")
			
			//회사경력 날짜 검증
			var carStartDate = document.getElementsByClassName("carStartDate");
			var carEndDate = document.getElementsByClassName("carEndDate");
			
			for(var i=0; i<carStartDate.length;i++) {
				var careerSDate = carStartDate[i].value;
				var careerEDate = carEndDate[i].value;
				
				console.log("careerSDate : " + careerSDate);
				console.log("careerEDate : " + careerEDate);
				
				//회사경력 start, endDate
				var carSDateArr = careerSDate.split('-');
				var car_SDay = new Date(carSDateArr[0], carSDateArr[1], carSDateArr[2]);
				console.log("car_SDay"+car_SDay);
				
				var carEDateArr = careerEDate.split('-');
				var car_EDay = new Date(carEDateArr[0], carEDateArr[1], carEDateArr[2]);
				console.log("car_EDay" + car_EDay);

				//오늘날짜 
				var now = new Date();
				console.log(now);
				
				//오늘날짜 - startDate
				var sGap = now.getTime() - car_SDay.getTime();
				var sResult = Math.floor(sGap/(1000*60*60*24)) * -1;
				console.log("sResult : " + sResult);
				
				//오늘날짜 - endDate
				var eGap = now.getTime() - car_EDay.getTime();
				var eResult = Math.floor(eGap/(1000*60*60*24)) * -1;
				console.log("eResult : " + eResult);

				if(sResult>30) {
					alert("회사경력 근무시작일을 확인해주십시오.");
					
					break;
				} else if(eResult>30) {
					alert("회사경력 근무종료일을 확인해주십시오.");
					
					break;
				} else {
					
					//endDate-startDate
					var gap = car_EDay.getTime() - car_SDay.getTime();
					var result = Math.floor(gap/(1000*60*60*24)) * -1;

					console.log("result : " + result);
					
					if(result>0) {
						alert("회사경력 근무기간을 확인해주십시오.");
						carCheck = false;
						
						break;
					} else {
						
						var patternNumber = /^[0-9]*$/
						var salaryVal = document.getElementsByClassName("carSalary");
						console.log("salaryVal : " + salaryVal.length);
						for(var i=0 ; i<salaryVal.length; i++) {
							var checkSalary = salaryVal[i].value;
							console.log("checkSalary : " + checkSalary);
							console.log("typeof : " + typeof(checkSalary));	
							
							if(checkSalary!="") {
								console.log("int_typeof : " + typeof(checkSalary));

								
								if(!patternNumber.test(checkSalary)) {
									alert("회사경력 연봉을 만 단위 숫자로 입력해주십시오.");
									carCheck = false;
									
									return;
								} else {
									carCheck = true;
								}

							} else {
								carCheck = true;
								
							}
						}
						
					}
					
				}

				
			}
			
			console.log("carCheck : " + carCheck);

		} 
		
		if(langCheck==true && licCheck==true && carCheck==true && actCheck==false) {
			
			console.log("actCheck if문");
			
			//사회봉사활동 검증
			var actStartDate = document.getElementsByClassName("actStartDate");
			var actEndDate = document.getElementsByClassName("actEndDate");
			
			for(var i=0; i<actStartDate.length;i++) {
				var activitySDate = actStartDate[i].value;
				var activityEDate = actEndDate[i].value;
				
				console.log("activitySDate : " + activitySDate);
				console.log("activityEDate : " + activityEDate);
				
				//사회봉사 start, endDate
				var actSDateArr = activitySDate.split('-');
				var act_SDay = new Date(actSDateArr[0], actSDateArr[1], actSDateArr[2]);
				console.log("act_SDay"+act_SDay);
				
				var actEDateArr = activityEDate.split('-');
				var act_EDay = new Date(actEDateArr[0], actEDateArr[1], actEDateArr[2]);
				console.log("act_EDay" + act_EDay);

				//오늘날짜 
				var now = new Date();
				console.log(now);
				
				//오늘날짜 - startDate
				var sGap = now.getTime() - act_SDay.getTime();
				var sResult = Math.floor(sGap/(1000*60*60*24)) * -1;
				console.log("sResult : " + sResult);
				
				//오늘날짜 - endDate
				var eGap = now.getTime() - act_EDay.getTime();
				var eResult = Math.floor(eGap/(1000*60*60*24)) * -1;
				console.log("eResult : " + eResult);

				if(sResult>30) {
					alert("사회봉사활동의 시작일을 확인해주십시오.");
					
					break;
				} else if(eResult>30) {
					alert("사회봉사활동의 종료일을 확인해주십시오.");
					
					break;
				} else {
					
					//endDate-startDate
					var gap = act_EDay.getTime() - act_SDay.getTime();
					var result = Math.floor(gap/(1000*60*60*24)) * -1;

					console.log("result : " + result);
					
					if(result>0) {
						alert("사회봉사활동 기간을 확인해주십시오.");
						actCheck = false;
						
						break;
					} else {
						actCheck = true;
					}
					
				}
				
			}
			
			console.log("actCheck : " + actCheck);

		} 
		
		if(langCheck==true && licCheck==true && actCheck==true && expCheck==false) {
			
			console.log("expCheck if문");
			
			//연수경험 검증
			var expStartDate = document.getElementsByClassName("expStartDate");
			var expEndDate = document.getElementsByClassName("expEndDate");
			
			for(var i=0; i<expStartDate.length;i++) {
				var experienceSDate = expStartDate[i].value;
				var experienceEDate = expEndDate[i].value;
				
				console.log("experienceSDate : " + experienceSDate);
				console.log("experienceEDate : " + experienceEDate);
				
				//사회봉사 start, endDate
				var expSDateArr = experienceSDate.split('-');
				var exp_SDay = new Date(expSDateArr[0], expSDateArr[1], expSDateArr[2]);
				console.log("exp_SDay"+exp_SDay);
				
				var expEDateArr = experienceEDate.split('-');
				var exp_EDay = new Date(expEDateArr[0], expEDateArr[1], expEDateArr[2]);
				console.log("exp_EDay" + exp_EDay);

				//오늘날짜 
				var now = new Date();
				console.log(now);
				
				//오늘날짜 - startDate
				var sGap = now.getTime() - exp_SDay.getTime();
				var sResult = Math.floor(sGap/(1000*60*60*24)) * -1;
				console.log("sResult : " + sResult);
				
				//오늘날짜 - endDate
				var eGap = now.getTime() - exp_EDay.getTime();
				var eResult = Math.floor(eGap/(1000*60*60*24)) * -1;
				console.log("eResult : " + eResult);

				if(sResult>30) {
					alert("연수경험의 시작일을 확인해주십시오.");
					
					break;
				} else if(eResult>30) {
					alert("연수경험의 종료일을 확인해주십시오.");
					
					break;
				} else {
					
					//endDate-startDate
					var gap = exp_EDay.getTime() - exp_SDay.getTime();
					var result = Math.floor(gap/(1000*60*60*24)) * -1;

					console.log("result : " + result);
					
					if(result>0) {
						alert("연수경험의 기간을 확인해주십시오.");
						expCheck = false;
						
						break;
					} else {
						expCheck = true;
					}
					
				}
				
			}
			
			console.log("expCheck : " + expCheck);

		}
		
		if(langCheck==true && licCheck==true && carCheck==true && actCheck==true && expCheck==true) {
			console.log("마지막 if");
			$('#career').submit();
		}
		
// 		console.log("expCheck : " + expCheck);
// 		console.log("actCheck : " + actCheck);
// 		console.log("carCheck : " + carCheck);
// 		console.log("licCheck : " + licCheck);
// 		console.log("langCheck : " + langCheck);

	}
	
	//-----------------------------------------------
	
	
	
});


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
</script>

<%@ include file="../apply/licenseAPI.jsp"%>

<%@ include file="../include/footer.jsp"%>
