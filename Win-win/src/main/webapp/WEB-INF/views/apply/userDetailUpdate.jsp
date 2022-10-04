<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../include/CSSLoader.jsp"%>
<style>
</style>

<script type="text/javascript">
// window.onpopstate() : 히스토리에 저장된 데이터를 다시 사용하기 위해 꺼낸 후 사용 가능한 상태가 됐을 때, 뒤로가기버튼 눌렀을 때 trigger
// HTML5에서 지원
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
// 	console.log(now);
// 	console.log(Dday);
	
	var gap = now.getTime() - Dday.getTime();
	var result = Math.floor(gap/ (1000*60*60*24)) * -1;
	
	console.log("남은 날은 " + result + " 일");
	
	$("#dDay").val("(D- " + result + "일)");

	//전화번호 앞자리 
	var phoneIntro = document.getElementsByClassName("phone1Sel");
	var phone123 = "${phoneNum[0]}";
	
	for(var i=0; i<phoneIntro.length; i++) {
		var phone1 = phoneIntro[i].value;
// 		console.log("phone1 : " + phone1);
		
		if(phone1==phone123) {
// 			console.log("입장");
			$("#phoneNum1").find("option[value="+phone123+"]").attr("selected","selected");			
		}
	}
	
	//직무 선택
	var taskClass = document.getElementsByClassName("taskSelect");
	var realTask = "${userDetail.task}";
	
	for(var i=0; i<taskClass.length; i++) {
		var task1 = taskClass[i]. value;
		console.log("task1 : " + task1);
		
		if(task1==realTask) {
			console.log("입장");
			$("#taskSel").find("option[value='${userDetail.task}']").attr("selected","selected");
		}
		
	}
	
	//보훈, 비보훈
	var realVeteran = "${userDetail.veteran}";
	console.log("realVeteran : " + realVeteran);
	
	$('input:radio[name="veteran"][value="${userDetail.veteran}"]').prop('checked', true);
	
	//장애, 비장애
	var realDisable = "${userDetail.disable}";
	console.log("realDisable : " + realDisable);
	
	$('input:radio[name="disable"][value="${userDetail.disable}"]').prop('checked', true);
	

	//저장버튼 클릭 시 validation & submit
	$("#saveBtn").click(function() {
		
		console.log("저장하고 계속하기 버튼 클릭")
		
		var eName = $("#eName").val();
		var birth = $("#birth").val();
		var zipCode = $("#zipCode").val();
		var address = $("#address").val();
		var addressDetail = $("#addressDetail").val();
		var phoneNum = $("#phoneNum").val();
		var veteran = $("#veteran").val();
		var notVeteran = $("#notVeteran").val();
		var disable = $("#disable").val();
		var notDisable = $("#notDisable").val();
		var task = $("#taskSel").val();
		
		if(eName == "") {
			alert("영문 이름을 입력하세요.");
			$("#eName").focus();
		} else if(birth == "") {
			alert("생년월일을 입력하세요.");
			$("#birth").focus();			
		} else if(zipCode == "" || address == "" || addressDetail == "" ) {
			alert("주소 입력사항을 모두 입력하세요.");
			$("#addressDetail").focus();
		} else if(phoneNum) {
			alert("긴급연락처를 입력하세요.");
			$("#phoneNum").focus();
		} else if(veteran == "" && notVeteran == "") {
			alert("보훈여부를 입력하세요.");
			$("#disable").focus();
		} else if(disable == "" && notDisable == ""){
			alert("장애여부를 입력하세요.");
			$("#disable").focus();
		} else if(task == "0") {
			alert("직무를 선택하세요");
			$("#taskSel").focus();
		} else {

			var phoneNum2 = $("#phoneNum2").val();
			var phoneNum3 = $("#phoneNum3").val();
			
			var patternE = /^[a-zA-Z\s]$/ // 영문, 띄어쓰기만 허용
			var patternN = /^[0-9]{8}$/ //숫자 8자리만 가능
			var patternP = /^[0-9]{3,4}$/ //숫자 3~4자리만 가능
			
			console.log(eName);
			if(patternE.test(eName)) {
				alert("성명을 영어로 기재하십시오.");
				$("#eName").val('');
				$("#eName").focus();
			} else if(!patternN.test(birth)) {
				alert("생년월일을 YYYYMMDD 형식으로 기재하십시오.");
				$("#birth").val('');
				$("#birth").focus();
			} else if(!patternP.test(phoneNum2)){
				alert("올바른 전화번호 형식으로 입력하십시오.");
				$("#phoneNum2").val('');
				$("#phoneNum2").focus();
			} else if(!patternP.test(phoneNum3)){
				alert("올바른 전화번호 형식으로 입력하십시오.");
				$("#phoneNum3").val('');
				$("#phoneNum3").focus();
			} else {
				
				var phoneNum;
				
				var phoneNum1 = $("#phoneNum1 option:selected").val();
				var phoneNum2 = $("#phoneNum2").val();
				var phoneNum3 = $("#phoneNum3").val();
				
				phoneNum = phoneNum1+"-"+phoneNum2+"-"+phoneNum3;	
//		 		console.log(phoneNum);
				$("#phoneNum").val(phoneNum);
				
				$("#task").val(task);
				
				$("#userDetailForm").submit();	
				
			}

		}
		
	});
	
});

</script>
   
<%@ include file="../include/header.jsp"%>

<div class="container">
	<h3 class="mt-5 font-weight-bold">입사지원 등록</h3>
	<img class="img-fluid d-block" src="/resources/image/grayline.png">

	<div class="col-md-12 border border-secondary mt-3 p-0">
	<table class="table col-md-12 mb-0">
	  <tbody>
	    <tr>
	      <td style="font-weight: bold; padding-left: 32px; width: 64%;">${jobopenBasic.title}</td>
	      <td class="p-0 text-center align-middle bg-secondary" style="width: 14%; font-weight: bold;">지원직무</td>
	      	<td class="text-center align-middle" style="width: 18%;">
	      		<select style="height:21px; width:90px;" id="taskSel" >
	      			<option value="0">직무선택</option>
	      			<c:forEach items="${task }" var="task">
	      				<option class="taskSelect" value="${task.task }">${task.task }</option>
	      			</c:forEach>	
	      		</select>
	      	</td>
	    </tr>	  
	  </tbody>
	</table>	
	<table class="table col-md-12 mb-0">
	  <tbody>
	    <tr style="line-height: 0.8em;">
	      <th class="text-center align-middle bg-secondary">접수상태</th>
	      	<td class="text-center align-middle">지원서 저장 전 입니다</td>
	      <th class="text-center align-middle bg-secondary">원서 마감 일시</th>
	      	<c:if test="${jobopenBasic.endDate eq null}">
	      		<td class="pl-4 pr-0 text-center align-middle" style="color: red;"><input style="border: none; width: 124px; color: red;" type="text" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상시채용" readonly/></td>
	      	</c:if>
	      	<c:if test="${jobopenBasic.endDate ne null}">
	      		<td class="pr-0 text-center align-middle" style="padding-left: 10px;"><fmt:formatDate value="${jobopenBasic.endDate }" pattern="yyyy/MM/dd" /></td>
	      		<td class="pl-0 text-danger text-center align-middle"><input style="border: none; width: 55px; color: red;" type="text" id="dDay" value="" readonly/></td>
			</c:if>
	      <th class="text-center align-middle bg-secondary">자동 로그아웃</th>
	      	<td class="text-danger text-center align-middle"><span id="counter"></span></td>
	      	<td><button id="timer">연장</button></td>
	    </tr>    
	  </tbody>
	</table>
	</div>

	<h4 class="mt-4 mb-3 font-weight-bold">개인사항</h4>
	<div class="row">
		<img class="img-fluid d-block ml-3" src="/resources/image/B_userDetail.png">
		<img style="cursor: pointer" class="img-fluid d-block" src="/resources/image/G_academic.png" onclick="checkAca();">
		<img style="cursor: pointer" class="img-fluid d-block" src="/resources/image/G_military.png" onclick="checkMil();">
		<img style="cursor: pointer" class="img-fluid d-block" src="/resources/image/G_career.png" onclick="checkCar();">
		<img style="cursor: pointer" class="img-fluid d-block" src="/resources/image/G_introduce.png" onclick="checkIntro();">
		<a href="/apply/finish?jobopenNo=${jobopenBasic.jobopenNo }">
			<img class="img-fluid d-block" src="/resources/image/G_complete.png">
		</a>
	</div>

	<form action="/apply/userDetailUpdate" method="POST" id="userDetailForm">
	<h6 class="mt-5 mb-3 font-weight-bold">기본정보<input type="hidden" name="jobopenNo" value="${jobopenBasic.jobopenNo }" /></h6>
	
	<table class="table table-bordered border-secondary">
	<tbody>
	<tr>
		<th style="width: 15% ;" class="text-center align-middle bg-secondary">성명<span style="color : red;">*</span></th>
		<td style="width: 40%">
		<span style="font-size: 10px ;">한글 </span><input style="border: none; width: 50px;" type="text" id="username" name="username" value="${member.username }" readonly/> / <span style="font-size: 10px ;">영어 </span>
			<input type="text" class="ml-1 mr-1" id="eName" name="eName" value="${userDetail.eName }"/>
			<span style="font-size: 10px ;"> 예)Hong Gil Dong</span>
		</td>
		<th class="text-center align-middle bg-secondary">이메일<span style="color : red;">*</span></th>
		<td><input style="border: none; width: 300px; " id="userid" name="userId" type="text" value="${sessionScope.id }" readonly/></td>
	</tr>
	<tr>
		<th class="text-center align-middle bg-secondary" style="width: 5%" >생년월일<span style="color : red;">*</span></th>
		<td colspan="3">
			<input type="text" name="birth" id="birth" value="${userDetail.birth }"/>
			<span style="font-size: 10px ;">예)19900101</span>
		</td>
	</tr>
	<tr>
		<th class="text-center align-middle bg-secondary">주소<span style="color : red;">*</span></th>
		<td colspan="3">
			<table>
				<tr>
					<input type="text" style="width: 80px;" id="zipCode" name="zipCode" placeholder="우편번호" readonly onclick="Search()" value="${userDetail.zipCode }"/>
					<input type="button" class="ml-1 mr-1" onclick="Search()" value="우편번호 찾기" />
					<input type="text" style="width: 364px; " name="address" id="address" placeholder="주소는 자동입력됩니다" value="${userDetail.address }"readonly />
				</tr>
				<tr>
					<input type="text" style="width: 550px ;" class="mt-1" name="addressDetail" id="addressDetail" placeholder="상세주소를 입력하세요" value="${userDetail.addressDetail }"/>
				</tr>	
			</table>
		
		</td>
	</tr>
	<tr>
		<th class="text-center align-middle bg-secondary">긴급연락처<span style="color : red;">*</span></th>
		<td colspan="3">  		
			<select style="width: 100px; height: 27px" id="phoneNum1" name="phoneNum1">
				<option class="phone1Sel" value="010">010</option>
				<option class="phone1Sel" value="02">02</option>
				<option class="phone1Sel" value="051">051</option>
				<option class="phone1Sel" value="053">053</option>
				<option class="phone1Sel" value="032">032</option>
				<option class="phone1Sel" value="062">062</option>
				<option class="phone1Sel" value="042">042</option>
				<option class="phone1Sel" value="052">052</option>
				<option class="phone1Sel" value="044">044</option>
				<option class="phone1Sel" value="031">031</option>
				<option class="phone1Sel" value="033">033</option>
				<option class="phone1Sel" value="043">043</option>
				<option class="phone1Sel" value="041">041</option>
				<option class="phone1Sel" value="063">063</option>
				<option class="phone1Sel" value="061">061</option>
				<option class="phone1Sel" value="054">054</option>
				<option class="phone1Sel" value="055">055</option>
				<option class="phone1Sel" value="064">064</option>
			</select>
				-<input type="text" id="phoneNum2" name="phoneNum2" class="ml-1 mr-1 numberOnly" style="width: 100px ;" value="${phoneNum[1] }"/>-<input type="text" id="phoneNum3" name="phoneNum3" class="ml-1 mr-1 numberOnly" value="${phoneNum[2] }" />
			<input type="hidden" id="phoneNum" name="phoneNum" />	
		</td>
	</tr>
	
	<tr>
		<th class="text-center align-middle bg-secondary">휴대전화<span style="color : red;">*</span></th>
		<td colspan="3"><input style="border: none; width: 200px; " type="text" id="phone" name="phone" value="${member.phone }" readonly/></td>
	</tr>
	
	</tbody>
	</table>
	
	<h6 class="mt-5 mb-3 font-weight-bold">부가신상정보</h6>
	
	<table class="table table-bordered border-secondary">
	<tbody>
	<tr>
		<th style="width: 15% ;" class="text-center align-middle bg-secondary">보훈여부<span style="color : red;">*</span></th>
		<td colspan="2">
			<div style="width: 50%;" class="input-group">
     			<input name="veteran" id="veteran" class="m-1 align-middle" type="radio" value="보훈" aria-label="Radio button for following text input" />
  				<label for="veteran" class="mr-5 mb-0" style="width: 100px ;">보훈</label>
     			<input name="veteran" id="notVeteran" class="m-1 align-middle" type="radio" value="비보훈" aria-label="Radio button for following text input" />
				<label for="notVeteran" class="mr-5 mb-0" style="width: 100px ;">비보훈</label>	
			</div>
		</td>

	</tr>	
	<tr>	
		<th style="width: 15% ;" class="text-center align-middle bg-secondary">장애여부<span style="color : red;">*</span></th>
		<td colspan="2">
			<div style="width: 50%;" class="input-group">
     			<input name="disable" id="disable" class="m-1 align-middle" type="radio" value="장애" aria-label="Radio button for following text input" />
  				<label for="disable" class="mr-5 mb-0" style="width: 100px ;">장애</label>
     			<input name="disable" id="notDisable" class="m-1 align-middle" type="radio" value="비장애" aria-label="Radio button for following text input" />
				<label for="notDisable" class="mr-5 mb-0" style="width: 100px ;">비장애</label>	
			</div>
		</td>		
	</tr>
	<tr>
		<th style="width: 15% ;" class="text-center align-middle bg-secondary">취미/특기</th>
		<td colspan="2"><input type="text" name="interest" id="interest" value="${userDetail.interest }"></td>
	</tr>
	</tbody>
	</table>
	<input type="hidden" id="task" name="task" />
	</form>
	
	<br><br><br>
	
	<div class="col-12 mt-5 p-0">
         <table class="table border">
            <tbody>
               <tr>
                  <th class="text-center table-light align-middle">
                     <i class="fas fa-exclamation-triangle fa-3x"></i>
                  </th>
                  <td class="table-light align-middle"> 
                  <ul class="mb-0">
                     <li style="line-height: 150%;"><strong><span class="text-info">지원서 작성 전</span>에 채용공고의 직무안내 및 모집인원을 확인하신 후, 작성시 유의사항을 숙지하신 후에 지원서를 작성하시기 바랍니다.</strong></li>
                     <li style="line-height: 150%;"><strong><span class="text-info">긴급연락처</span>는 지원자 본인 부재 시 연락이 가능한 배우자나 가족의 연락처를 기재합니다.</strong></li>
                     <li><strong><span class="text-info">장애정보 및 보훈정보 관련 서류</span>는 면접대상자 한에서 추후 제출합니다.</strong></li>
                  </ul>
                  </td>
               </tr>
            </tbody>
         </table>
	</div>
	
	<div class="col-12 mt-5 p-0 d-flex justify-content-end">
		<input class="btn btn-primary text-white" type="button" id="saveBtn" name="save" value="저장하고 계속하기"/>
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
<script>
function Search() {
	new daum.Postcode({
		oncomplete: function(data) {
			//팝업에서 검색결과 항목을 클릭했을 때 실행할 코드 작성하는 부분
			
			var fullAddr = ''; //최종 주소 변수
			var extraAddr= ''; //조합형 주소 변수
			
			if(data.userSeletedType === 'R') { //사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;
			} else { //사용자가 지번 주소를 선택했을 경우
				fullAddr = data.jibunAddress;
			}
			
			
			//사용자가 선택한 주소가 도로명 타입일때 조합한다
			if(data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== '') {
					extraAddr += data.bname;
				}
				
				//건물명이 있을 경우 추가한다.
				if(data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ?','+data.buildingName : data.buildingName);
				}
				
				//조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종주소를 만든다
				fullAddr += (extraAddr !== ''?'('+extraAddr+')':'');
			}
			
			//우편번호와 주소 정보를 해당필드에 넣는다.
			document.getElementById('zipCode').value = data.zonecode;
			document.getElementById('address').value = fullAddr;
			
			//커서를 상세주소 필드로 이동한다.
			document.getElementById('addressDetail').focus();
		}
	}).open();
}


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



</script>
<%@ include file="../include/footer.jsp"%>