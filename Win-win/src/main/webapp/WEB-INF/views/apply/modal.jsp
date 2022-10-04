<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
        .closeCheck:hover,
        .closeCheck:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>


</head>
<body>

<div class="modalCheck" id="checkModal">
	<div class="modal-contentCheck">
	
		<h3 class="mt-3 font-weight-bold">지원서 미리보기</h3><hr style="border: solid 2px #376092;"><br>
	<div class="container">
		<h4 class="ml-2 font-weight-bold">개인사항</h4><hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">
		<h6 class="ml-4 mt-5 font-weight-bold">기본정보</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
			<tr>
				<th style="width: 15% ;" class="text-center text-center align-middle bg-secondary">성명</th>
				<td style="width: 40%">
					<span style="font-size: 10px ;">한글 </span>${member.username } / <span style="font-size: 10px ;">영어 </span>${userDetail.eName }
				</td>
				<th class="text-center text-center align-middle bg-secondary">이메일</th>
				<td>${sessionScope.id }</td>
			</tr>
			<tr>
				<th class="text-center text-center align-middle bg-secondary" style="width: 5%" >생년월일</th>
				<td colspan="3">${userDetail.birth }</td>
			</tr>
			<tr>
				<th class="text-center text-center align-middle bg-secondary">주소</th>
				<td colspan="3">${userDetail.zipCode }, &nbsp&nbsp ${userDetail.address }, &nbsp&nbsp ${userDetail.addressDetail }</td>
			</tr>
			<tr>
				<th class="text-center text-center align-middle bg-secondary">긴급연락처</th>
				<td colspan="3">${userDetail.phoneNum }</td>
			</tr>
			<tr>
				<th class="text-center text-center align-middle bg-secondary">휴대전화</th>
				<td colspan="3">${member.phone }</td>
			</tr>
		</tbody>
		</table>
		
	</div>
	
	
	<div class="mt-5 container">
		<h4 class="ml-2 font-weight-bold">학력사항</h4><hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">
		<h6 class="ml-4 mt-5 font-weight-bold">고등학교</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">학교명</th>
					<th class="text-center text-center align-middle">전공</th>
					<th class="text-center text-center align-middle">졸업년도</th>
					<th class="text-center text-center align-middle">지역</th>
				</tr>
				<tr style="line-height: 1.0em; height:15px;">
                  <td class="text-center align-middle">${highSchool.hsName }&nbsp${highSchool.hsDay }</td>
                  <td class="text-center align-middle">${highSchool.hsMajor }</td>
                  <td class="text-center align-middle">${highSchool.hsEndDate }&nbsp${highSchool.hsGraduate }</td>
                  <td class="text-center align-middle">${highSchool.hsRegion }</td>
                </tr>
		</tbody>
		</table>
		
		<h6 class="ml-4 mt-5 font-weight-bold">전문대학</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">학교명</th>
					<th class="text-center text-center align-middle">전공</th>
					<th class="text-center text-center align-middle">재학기간</th>
					<th class="text-center text-center align-middle">지역</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${college.colName }&nbsp${college.colBranch }&nbsp${college.colDay }</td>
                  <td class="text-center align-middle">${college.colMajor }&nbsp${college.colScore }/${college.colTotalScore }</td>
                  <td class="text-center align-middle">${college.colStartDate }&nbsp${college.colTransfer}&nbsp&nbsp${college.colEndDate }&nbsp${college.colGraduate }</td>
                  <td class="text-center align-middle">${college.colRegion }</td>
                </tr>
		</tbody>
		</table>
		
		<h6 class="ml-4 mt-5 font-weight-bold">대학교</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">학교명</th>
					<th class="text-center text-center align-middle">전공</th>
					<th class="text-center text-center align-middle">졸업년도</th>
					<th class="text-center text-center align-middle">지역</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${university.univName }&nbsp${university.univBranch }&nbsp${university.univDay }</td>
                  <td class="text-center align-middle">${university.univMajor }&nbsp${university.univMinor }&nbsp${university.univScore }&nbsp/&nbsp${university.univTotalScore }</td>
                  <td class="text-center align-middle">${university.univStartDate }&nbsp${university.univTransfer}&nbsp&nbsp${university.univEndDate }&nbsp${university.univGraduate }</td>
                  <td class="text-center align-middle">${university.univRegion }</td>
                </tr>
		</tbody>
		</table>
		
		<h6 class="ml-4 mt-5 font-weight-bold">대학원</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">학교명</th>
					<th class="text-center text-center align-middle">전공</th>
					<th class="text-center text-center align-middle">졸업년도</th>
					<th class="text-center text-center align-middle">지역</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${gSchool.gsName }&nbsp${gSchool.gsBranch }&nbsp${gSchool.gsDay }</td>
                  <td class="text-center align-middle">${gSchool.gsMajor }&nbsp${gSchool.gsScore }&nbsp/&nbsp${gSchool.gsTotalScore }</td>
                  <td class="text-center align-middle">${gSchool.gsEndDate }&nbsp${gSchool.gsGraduate }</td>
                  <td class="text-center align-middle">${gSchool.gsRegion }</td>
                </tr>
		</tbody>
		</table>
		
	</div>
	
	<div class="mt-5 container">
		<h4 class="ml-2 font-weight-bold">병역사항</h4><hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">
		<h6 class="ml-4 mt-5 font-weight-bold">병역정보</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">제대구분</th>
					<th class="text-center text-center align-middle">복무기간</th>
					<th class="text-center text-center align-middle">군별</th>
					<th class="text-center text-center align-middle">계급</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${military.discharge }</td>
                  <td class="text-center align-middle">${military.startDate }&nbsp ~ &nbsp${military.endDate }</td>
                  <td class="text-center align-middle">${military.mCategory }</td>
                  <td class="text-center align-middle">${military.mGrade }</td>
                </tr>
		</tbody>
		</table>
		
	</div>
	
	<div class="mt-5 container">
		<h4 class="ml-2 font-weight-bold">경력사항</h4><hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">
		<h6 class="ml-4 mt-5 font-weight-bold">어학정보</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">외국어명</th>
					<th class="text-center text-center align-middle">회화수준</th>
					<th class="text-center text-center align-middle">공익시험명</th>
					<th class="text-center text-center align-middle">점수(또는 급)</th>
					<th class="text-center text-center align-middle">취득일</th>
					<th class="text-center text-center align-middle">주관처</th>
				</tr>
				<c:forEach items="${language }" var="language">
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${language.lName }</td>
                  <td class="text-center align-middle">${language.grade }</td>
                  <td class="text-center align-middle">${language.testName }</td>
                  <td class="text-center align-middle">${language.score }</td>
                  <td class="text-center align-middle">${language.lDate }</td>
                  <td class="text-center align-middle">${language.lOrgan }</td>
                </tr>
                </c:forEach>
		</tbody>
		</table>
		<h6 class="ml-4 mt-5 font-weight-bold">자격사항</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">자격증</th>
					<th class="text-center text-center align-middle">취득일</th>
					<th class="text-center text-center align-middle">주관처</th>
				</tr>
				<c:forEach items="${license }" var="license">
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${license.liName }</td>
                  <td class="text-center align-middle">${license.liDate }</td>
                  <td class="text-center align-middle">${license.liOrgan }</td>
                </tr>
                </c:forEach>
		</tbody>
		</table>
		<h6 class="ml-4 mt-5 font-weight-bold">회사경력</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">근무기간</th>
					<th class="text-center text-center align-middle">회사명</th>
					<th class="text-center text-center align-middle">직위</th>
					<th class="text-center text-center align-middle">담당업무</th>
					<th class="text-center text-center align-middle">연봉(만원)</th>
					<th class="text-center text-center align-middle">퇴직사유</th>
				</tr>
				<c:forEach items="${career }" var="career">
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${career.cStartDate } &nbsp ~ &nbsp ${career.cEndDate }</td>
                  <td class="text-center align-middle">${career.cName }</td>
                  <td class="text-center align-middle">${career.position }</td>
                  <td class="text-center align-middle">${career.task }</td>
                  <td class="text-center align-middle">${career.salary }</td>
                  <td class="text-center align-middle">${career.cContent }</td>
                </tr>
				</c:forEach>
		</tbody>
		</table>
		<h6 class="ml-4 mt-5 font-weight-bold">사회봉사활동</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">단체명</th>
					<th class="text-center text-center align-middle">기간</th>
					<th class="text-center text-center align-middle">설명</th>
				</tr>
				<c:forEach items="${activity }" var="activity">
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${activity.aName }</td>
                  <td class="text-center align-middle">${activity.aStartDate } &nbsp ~ &nbsp ${activity.aEndDate }</td>
                  <td class="text-center align-middle">${activity.aContent }</td>
                </tr>
                </c:forEach>
		</tbody>
		</table>
		<h6 class="ml-4 mt-5 font-weight-bold">연수경험</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">구분</th>
					<th class="text-center text-center align-middle">연수기관</th>
					<th class="text-center text-center align-middle">기간</th>
					<th class="text-center text-center align-middle">설명</th>
				</tr>
				<c:forEach items="${experience }" var="experience">
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${experience.eOption }</td>
                  <td class="text-center align-middle">${experience.eOrgan }</td>
                  <td class="text-center align-middle">${experience.eStartDate } &nbsp ~ &nbsp ${experience.eEndDate }</td>
                  <td class="text-center align-middle">${experience.eContent }</td>
                </tr>
                </c:forEach>
		</tbody>
		</table>
		<h6 class="ml-4 mt-5 font-weight-bold">포트폴리오 첨부파일</h6><br>
		
		<table class="ml-4 mr-4 table border-secondary" style="width: 95%;">
		<tbody>
				<tr style="line-height: 1.0em;">
					<th class="text-center text-center align-middle">종류</th>
					<th class="text-center text-center align-middle">파일명</th>
					<th class="text-center text-center align-middle">등록수정일</th>
					<th class="text-center text-center align-middle">용량</th>
				</tr>
				<tr style="line-height: 0.8em; height:10px;">
                  <td class="text-center align-middle">${material.originName }</td>
                  <td class="text-center align-middle">${material.originName }</td>
                  <td class="text-center align-middle"><fmt:formatDate value="${material.writedate }" pattern="yyyy/MM/dd" /></td>
                  <td class="text-center align-middle">${material.filesize }</td>
                </tr>
		</tbody>
		</table>
	
	</div>

	<div class="mt-5 container">
		<h4 class="ml-2 font-weight-bold">자기소개서</h4><hr class="ml-2 border-dark bg-dark" style="border: solid 1px;">
		
		<h6 class="mt-5 font-weight-bold">1. 성장과정 (자신에 대한 소개)</h6><br>		
		<textarea maxlength="500" style="width: 100%;resize: none; height:250px;" readonly>${introduce.content1 }</textarea>
		<h6 class="mt-5 font-weight-bold">2. 지원동기 및 포부</h6><br>		
		<textarea maxlength="500" style="width: 100%;resize: none; height:250px;" readonly>${introduce.content2 }</textarea>
		<h6 class="mt-5 font-weight-bold">3. 성격의 장단점</h6><br>		
		<textarea maxlength="500" style="width: 100%;resize: none; height:250px;" readonly>${introduce.content3 }</textarea>
		<h6 class="mt-5 font-weight-bold">4. 살아오면서 중요했던 일</h6><br>		
		<textarea maxlength="500" style="width: 100%;resize: none; height:250px;" readonly>${introduce.content4 }</textarea>
		<h6 class="mt-5 font-weight-bold">5. 보유기술 및 경험직무 (구체적으로 기술) </h6><br>		
		<textarea maxlength="500" style="width: 100%;resize: none; height:250px;" readonly>${introduce.content5 }</textarea>
		
	</div>	
	
	<div class="container">
	<div class="col-12 mt-5 p-0 d-flex justify-content-end">
   	  <button class="btn btn-primary text-white mr-2" style="width:80px;" id="btnUpdate">수정</button>
   	  <button class="btn btn-secondary text-black" style="width:80px;" id="btnClose">닫기</button>
   	</div>
   	<br><br><br>
	</div>
	
	</div>
</div>
</body>

<script type="text/javascript">

// Get the modal
var modal = document.getElementById('checkModal');

// Get the button that opens the modal
var btn = document.getElementById("Btn");

// Get the <span> element that closes the modal
// var span = document.getElementsByClassName("closeCheck")[0];                                          

var btnClose = document.getElementById("btnClose");
var btnUpdate = document.getElementById("btnUpdate");

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
// span.onclick = function() {
//     modal.style.display = "none";
// }


btnUpdate.onclick = function() {
    location.href = '/apply/userDetailUpdate?jobopenNo=${introduce.jobopenNo}';
}

btnClose.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</html>