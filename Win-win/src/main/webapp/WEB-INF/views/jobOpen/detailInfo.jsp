<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp" %>

<link rel="stylesheet" href="/resources/jobopen.css" />
<%@ include file="../include/adminHeader.jsp"%>

<div class="container">
	<div class="row m-3 justify-content-center">
		<div style="width: 663px; height: 101px; border:1px solid #376092;">
			<div class="box text-primary text-center" style="cursor:pointer;" onclick='location.href="/jobOpen/basicUpdate?jobopenNo=${sessionScope.jobopen }";'><strong>기본정보</strong></div>
			
			
			
			<div class="triangle-left-trans"></div>
			<div class="box text-light text-center" style="background-color: #376092;"><strong>세부정보</strong></div>
			<div class="triangle-left-primary"></div>
			<div class="boxm text-primary text-center"><strong>등록하기</strong></div>
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

<div class="container">
	<form action="/jobOpen/detailInfo" method="post" id="formId">
	
		<!-- start of offer -->
		<div class="row justify-content-left p-4">
			<div class="col-auto">
				<div class="mt-5" style="border-bottom: 2px solid gray;"><h3>모집 요강</h3></div>
			</div>
		</div>
	
		<div class="row justify-content-center">
			<div class="col-9" id="detailInfo">
				<div class="detailin p-3 bg-secondary">
					<div class="form-inline m-1">
						<div class="col-2">
							<label for="sector">모집 부문</label>
						</div>
						<div class="col-6">
							<input type="text" id="sector" class="form-control w-100" name="detail[0].sector" placeholder="ex) IT/WEB 서비스" required />
						</div>
						<div class="col-4">
							<i class="far fa-plus-square fa-2x addDetail" data-toggle="tooltip" data-placement="top" title="모집요강 추가" style="cursor:pointer" ></i>
						</div>
						
					</div>
					
					<div class="form-inline m-1">
						<div class="col-2">
							<label for="task">담당 업무</label>		
						</div>
						<div class="col-10">
							<input type="text" id="task" class="form-control w-100" name="detail[0].task" placeholder="ex) Back-End 개발자" required />
						</div>
					</div>
					
					<div class="form-inline m-1">
						<div class="col-2">
							<label for="volume">채용 인원</label>
						</div>
						<div class="col-4  border-right border-light">
							<input type="number" id="volume" class="form-control w-75" name="detail[0].volume" placeholder="00" required /> 명
						</div>
						<div class="col-2">
							<label for="location">근무지</label>
						</div>
						<div class="col-4">
							<input type="text" id="location" class="form-control w-100" name="detail[0].location" placeholder="근무지를 입력해주세요" required />
						</div>
					</div>
					
					<div class="form-inline m-1">
						<div class="col-2">
							<label for="special">우대 사항</label>		
						</div>
						<div class="col-10">
							<input type="text" id="special" class="form-control w-100" name="detail[0].special" required />
						</div>
					</div>
					<div>
						<input type="hidden" value="${sessionScope.jobopen }" name="detail[0].jobopenNo"/>
					</div>
					
				</div>
			</div>
		</div> <!-- end of offer -->
		
		
		<!-- start of Qualify -->
		<div class="row justify-content-left p-4">
			<div class="col-auto">
				<div class="mt-5" style="border-bottom: 2px solid gray;"><h3>지원 자격</h3></div>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="col-9" id="detailInfo">
				<div class="p-3 bg-secondary">
					<div class="form-inline m-1">
						<div class="col-2">
							<label for="academic">학&nbsp;&nbsp;&nbsp;력</label>
						</div>
						<div class="col-5">
							<input type="text" id="academic" class="form-control w-100" name="academic" placeholder="ex) 4년제 대졸" required />
						</div>
						<div class="col-2">
							<div class="form-check-inline">
						    	<input type="checkbox" class="form-check-input" id="chkAcademic">
								<label class="form-check-label" for="chkAcademic">없음</label>
							</div>
						</div>
					</div>
					
					<div class="form-inline m-1">
						<div class="col-2">
							<label for="score">학&nbsp;&nbsp;&nbsp;점</label>		
						</div>
						<div class="col-5">
							<input type="text" id="score" class="form-control w-100" name="score" placeholder="ex) 4.5환산 기준 3.0" required />
						</div>
						<div class="col-2">
							<div class="form-check-inline">
						    	<input type="checkbox" class="form-check-input" id="chkScore">
								<label class="form-check-label" for="chkScore">없음</label>
							</div>
						</div>
					</div>
					
					<div class="form-inline m-1">
						<div class="col-2">
							<label for="lang">어&nbsp;&nbsp;&nbsp;학</label>
						</div>
						<div class="col-5">
							<input type="text" id="lang" class="form-control w-100" name="lang" placeholder="ex) TOEIC 600점 이상" required />
						</div>
						<div class="col-2">
							<div class="form-check-inline">
						    	<input type="checkbox" class="form-check-input" id="chkLang">
								<label class="form-check-label" for="chkLang">없음</label>
							</div>
						</div>
					</div>
					
					<div class="form-inline m-1">
						<div class="col-2">
							<label for="etcQual">기타 자격</label>		
						</div>
						<div class="col-10">
							<input type="text" id="etcQual" class="form-control w-100" name="etcQual" value="없음" required />
						</div>
					</div>
					<div>
						<input type="hidden" value="${sessionScope.jobopen }" name="jobopenNo" />
					</div>
				</div>
			</div>
		</div> <!-- end of Qualify  -->
		
		<!-- start of etc -->
		<div class="row justify-content-left p-4">
			<div class="col-auto">
				<div class="mt-5" style="border-bottom: 2px solid gray;"><h3>기타</h3></div>
			</div>
		</div>
		
		<div class="form-group row justify-content-center">
			<div class="col-9">
				<textArea style="width:99%"id="content" name="etc" class="form-control"></textArea>
			</div>	
		</div>
		
		
		
		<div class="form-inline mt-5 d-flex justify-content-center" >
			  <button id="btnOk" class="btn btn-info mr-3">저장하고 계속하기</button><button type="button" id="btnCancel" class="btn btn-secondary">취소</button>
		</div>
		
	</form>
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

$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	
	
	$('input[type="checkbox"][id="chkAcademic"]').change(function(){
		if($(this).is(":checked")){
			$('#academic').val("없음");
		} else {
			$('#academic').val("");
		}
	});
	$('input[type="checkbox"][id="chkLang"]').change(function(){
		if($(this).is(":checked")){
			$('#lang').val("없음");
		} else {
			$('#lang').val("");
		}
	});
	$('input[type="checkbox"][id="chkScore"]').change(function(){
		if($(this).is(":checked")){
			$('#score').val("없음");
		} else {
			$('#score').val("");
		}
	});
	
	
	function setSector(i){
		var sector = '<div class="detailin mt-5 p-3 bg-secondary"> <div class="form-inline m-1"> <div class="col-2"> <label for="sector">모집 부문</label> </div> <div class="col-6"> <input type="text" id="sector" class="form-control w-100" name="detail['+i+'].sector" required /> </div> <div class="col-4"> <i class="far fa-minus-square fa-2x subDetail" data-toggle="tooltip" data-placement="top" title="모집요강 삭제" style="cursor:pointer" ></i> </div> </div> <div class="form-inline m-1"> <div class="col-2"> <label for="task">담당 업무</label>	</div> <div class="col-10"> <input type="text" id="task" class="form-control w-100" name="detail['+i+'].task" required /> </div> </div> <div class="form-inline m-1"> <div class="col-2"><label for="volume">채용 인원</label> </div><div class="col-4  border-right border-info"><input type="number" id="volume" class="form-control w-75" name="detail['+i+'].volume" required /> 명</div><div class="col-2"> <label for="location">근무지</label> </div> <div class="col-4"> <input type="text" id="location" class="form-control w-100" name="detail['+i+'].location" required /> </div></div><div class="form-inline m-1"> <div class="col-2"> <label for="special">우대 사항</label></div><div class="col-10"><input type="text" id="special" class="form-control w-100" name="detail['+i+'].special" required /></div> </div><div><input type="hidden" value="${sessionScope.jobopen }" name="detail['+i+'].jobopenNo"/></div> </div>'
		
		return sector;
	}
	
	var i = 0;
	$('.addDetail').click(function(){
		i++; 
		var s = setSector(i);
		$('#detailInfo').append(s);
		$('[data-toggle="tooltip"]').tooltip();
	});
	9
	
	$(document).on("click",".subDetail",function(){
		$('[data-toggle="tooltip"]').tooltip('hide');
		$(this).parent().parent().parent().remove();
	});
	
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
	
	
});

</script>
<script type="text/javascript"
 src="/resources/se2/js/HuskyEZCreator.js"></script>
<script>
var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "/resources/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2",
		htParams : {
		bUseToolbar: true, // 툴바 사용여부
		bUseVerticalResizer: true, //입력창 크기 조절바
		bUseModeChanger: true //모드 탭
	}
});

		//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.
	try {
		    elClickedObj.form.submit();
		    $('form').submit();
		} catch(e) {}
	}
	
	$(document).ready(function() {
		$("#btnOk").click(function() {
			submitContents($(this));
	});
});

</script>

<%@ include file="../include/footer.jsp"%>