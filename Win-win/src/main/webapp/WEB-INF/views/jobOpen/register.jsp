<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp" %>

<link rel="stylesheet" href="/resources/jobopen.css" />

<%@ include file="../include/adminHeader.jsp"%>

<div class="container">
	<div class="row m-3 justify-content-center">
		<div style="width: 663px; height: 101px; border:1px solid #376092;">
			<div class="boxm text-primary text-center pl-5" style="cursor:pointer;" onclick='location.href="/jobOpen/basicUpdate?jobopenNo=${sessionScope.jobopen }";'><strong>기본정보</strong></div>
			<div class="line"></div>
			<div class="box text-primary text-center" style="cursor:pointer;" onclick='location.href="/jobOpen/detailUpdate?jobopenNo=${sessionScope.jobopen }";'><strong>세부정보</strong></div>
			<div class="triangle-left-trans"></div>
			<div class="box text-light text-center" style="background-color: #376092;"><strong>등록하기</strong></div>
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
	<div class="row justify-content-center">
		<div class="col-auto">
			<div class="border border-info text-info p-5 text-center">작성하신 내용을 확인하신 후 등록하기 버튼을 눌러주세요. <br>수정하기를 원하신다면 위 진행상황을 눌러 페이지에서 수정하시면 됩니다.</div>
		</div>
	</div>
	
	<div class="row justify-content-center mt-5">
		<div class="col-8">
				<div class="form-inline m-3">
				    <div class="col-2">
				      <label>공고 제목</label>
				    </div>
				    <div class="col-10">
				      <span>${basic.title}</span>
				    </div>
			    </div>
			    
				<div class="form-inline m-3">
				    <div class="col-2">
				      	<label>모집 구분</label>
				    </div>
				    <div class="col-10">
				    	<span>${basic.offer }</span>
					</div>
					
			    </div>
			    
			    <div class="form-inline m-3">
			    	<div class="col-2">
			    		<label>고용 형태</label>
			    	</div>
			    	<div class="col-10">
			    		<span>${basic.form }</span>
			    	</div>
			    </div>

			    
			    <div class="form-inline m-3">
			    	<div class="col-2">
			    		<label>급&emsp;&emsp;&nbsp;여</label>
			    	</div>
			    	<div class="col-10" >
			    	<c:if test="${basic.startPay ne 0 }">
			    		<span>${basic.startPay }</span>만원 ~ <span>${basic.endPay }</span>만원
			    	</c:if>
			    	<c:if test="${basic.startPay eq 0 }">
			    		<span>${basic.rulePay }</span>
			    	</c:if>
			    	<!-- if 절 넣어서 내규급여, 급여 확인하기 -->
			    	</div>
			    </div>
			    
			    <div class="form-inline ml-3 mr-3 mb-3">
			    	<div class="col-2">
			    		<label>접수 기간</label>
			    	</div>
			    	<div class="col-10" >
			    	<c:if test="${basic.startDate ne null }">
			    		<span><fmt:formatDate value="${basic.startDate }" pattern="yyyy-MM-dd" /></span> ~ <span><fmt:formatDate value="${basic.endDate }" pattern="yyyy-MM-dd" /></span>
			    	</c:if>
			    	<c:if test="${basic.startDate eq null }">
			    		<span>${basic.allOpen }</span>
			    	</c:if>
			    	<!-- if 절 넣어서 상시채용, 접수기간 확인하기 -->
			    	</div>
			    </div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row justify-content-left p-4">
		<div class="col-auto">
			<div class="mt-5" style="border-bottom: 2px solid gray;"><h3>모집 요강</h3></div>
		</div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-8" id="detailInfo">
			<table class="table table-striped table-bordered table-hover" style="white-space : nowrap">
				<thead>
					<tr>
						<th>모집 부문</th>
						<th>담당 업무</th>
						<th>근무지</th>
						<th>모집인원</th>
						<th>우대사항</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${detail }" var="detail">
						<tr>
							<td>${detail.sector }</td>
							<td>${detail.task }</td>
							<td>${detail.location }</td>
							<td>${detail.volume }</td>
							<td>${detail.special }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="row justify-content-left p-4">
		<div class="col-auto">
			<div class="mt-5" style="border-bottom: 2px solid gray;"><h3>지원 자격</h3></div>
		</div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-8">
			<div class="form-inline m-3">
			    <div class="col-2">
			      <label>학&emsp;&emsp;&nbsp;력</label>
			    </div>
			    <div class="col-10">
			      <span>${basic.academic }</span>
			    </div>
		    </div>
		    
			<div class="form-inline m-3">
			    <div class="col-2">
			      	<label>학&emsp;&emsp;&nbsp;점</label>
			    </div>
			    <div class="col-10">
			    	<span>${basic.score }</span>
				</div>
				
		    </div>
		    
		    <div class="form-inline m-3">
		    	<div class="col-2">
		    		<label>어학 능력</label>
		    	</div>
		    	<div class="col-10">
		    		<span>${basic.lang }</span>
		    	</div>
		    </div>

		    
		    <div class="form-inline mt-3 ml-3 mr-3 mb-2">
		    	<div class="col-2">
		    		<label>기&emsp;&emsp;&nbsp;타</label>
		    	</div>
		    	<div class="col-10" >
		    		<span>${basic.etcQual }</span>
		    	</div>
		    </div>
		</div>
	</div>
	
	<div class="row justify-content-left p-4">
		<div class="col-auto">
			<div class="mt-5" style="border-bottom: 2px solid gray;"><h3>기타</h3></div>
		</div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-8">
			<div class="form-inline m-3">
			${basic.etc }
			</div>
		</div>
	</div>
	
	<div class="form-inline mt-5 d-flex justify-content-center" >
		<button id="btnOk" class="btn btn-info mr-3">채용공고 등록하기</button><button type="button" id="btnCancel" class="btn btn-secondary">취소</button>
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

$(document).ready(function(){
	$("#btnOk").click(function(){
		$.ajax({
			type:"post",
			url:"/jobOpen/register",
			success:function(){
				location.href="/main/adminmain";
			},
			error:function(){
				console.log("등록 실패");
			}
		})
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

<%@ include file="../include/footer.jsp"%>










