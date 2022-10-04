<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>

<style>

.card-body {
	padding: 0;
}

.tablediv {
	padding: 0;
}

</style>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty adminLogin}">
<%@ include file="../include/header.jsp"%>
</c:if>

<c:if test="${adminLogin }">
<%@ include file="../include/adminHeader.jsp"%>
</c:if>


<div class="container">
<div class="container">

	<div class="col-12 mt-5">
		<p class="font-weight-bold h3">채용공고</p>
		<hr style="border: solid #376092;">
	</div>
		
	<div class="d-flex justify-content-center">
		<div class="tablediv col-11 mt-3" style="border-bottom: 2px solid lightgrey">
			<table class="table table-striped " style="border-bottom: 1px solid lightgrey">
				<tr>
					<th width="15%">글번호 <span class="ml-2" id="jobopenNo">${basic.jobopenNo}</span></th>
					<th width="45%">제목 <span class="ml-3" id="title">${basic.title}</span></th>
					<th width="15%">작성자 <span class="ml-3">[관리자]</span></th>
					<th width="10%">조회수<span class="ml-2">${basic.hit }</span></th>
					<th width="15%">작성일<span class="ml-3"><fmt:formatDate value="${basic.writeDate}" pattern="yyyy-MM-dd" /></span></th>
				</tr>
			</table>
		</div>
	</div>

	<div class="d-flex justify-content-center">
		<div class="col-11 mt-3" style="border: 1px dashed lightgrey;">	

					<div class="row justify-content-left p-4">
						<div class="col-auto">
							<div class="mt-3" style="border-bottom: 2px solid gray;"><h3>기본 정보</h3></div>
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
	    					    		<span><fmt:formatDate value="${basic.startDate }" pattern="yyyy-MM-dd" /></span> ~ <span id="edate"><fmt:formatDate value="${basic.endDate }" pattern="yyyy-MM-dd" /></span>
							    	</c:if>
							    	<c:if test="${basic.startDate eq null }">
							    		<span>${basic.allOpen }</span>
							    	</c:if>
							    	<!-- if 절 넣어서 상시채용, 접수기간 확인하기 -->
							    	</div>
							    </div>
						</div>
					</div>
					
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
		</div>
	</div>

	<div class="d-flex justify-content-center">
		<div class="col-11 mt-3" style="border-top: 2px solid lightgrey; ">
	    	<div id="btns" class="form-group d-flex justify-content-center mt-3 mb-2 " style="margin-bottom: 0px;">
				<a href="/jobOpen/list"><button id="btnList" type="button" class="btn btn-primary btn-sm">목록</button></a>
				<c:if test="${adminLogin}">
				<a href="/jobOpen/delete?boardNo=${basic.jobopenNo}"><button id="btnDel" type="button" class="btn btn-sm btn-primary ml-3">삭제</button></a>
				</c:if>
				<c:if test="${empty adminLogin }">
					<c:if test="${today > end}">
					<button type="button" class="btn btn-secondary btn-sm ml-3" onclick="selectsubmit();" disabled="disabled">지원하기</button>
					</c:if>
					<c:if test="${today <= end}">
					<button type="button" class="btn btn-primary btn-sm ml-3" onclick="selectsubmit();" >지원하기</button>
					</c:if>
					<c:if test="${basic.allOpen ne '0'}">
					<button type="button" class="btn btn-primary btn-sm ml-3" onclick="selectsubmit();" >지원하기</button>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
	
</div>
</div>

    <!-- The Modal -->
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
	        <p class="font-weight-bold text-center" id="ModalContent"></p> 
			</div>
			
			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
				<button type="button" id="btnClose" class="font-weight-bold btn btn-secondary">닫기</button>
				</div>
			</div>
	      </div>
	 
	    </div>
    </div>

<script type="text/javascript">

	

function selectsubmit(){
       var jobopenNo = document.getElementById("jobopenNo").innerHTML;
//        var title = document.getElementById("title").innerHTML;

			var applyData = { "jobopenNo": jobopenNo };

			$.ajax({
		          type:"post"
		          , url:"/applyMenu/sessionCheck"
		          , dataType: "json"
		          , data: applyData
		          , success: function( data ) {
		        	  
// 		        	  console.log(data.result);
// 		        	  console.log(data.checkApp);

		        	  if(data.result > 0 ) {
		        		  
			        	  if(data.checkApp > 0 ) {
			        			// Get the modal
			        			var modal = document.getElementById('myModal');
			        			
			        			modal.style.display = "block";
			        			
			        			// Get the <span> element that closes the modal
			        			var span = document.getElementsByClassName("close")[0];     

			        			var btnClose = document.getElementById("btnClose");
			        			
			        			// When the user clicks on <span> (x), close the modal
			        			span.onclick = function() {
			        			    modal.style.display = "none";
			        			}
			        			
			        			btnClose.onclick = function() {
			        			    modal.style.display = "none";
			        			}
			        			
			        			$("#ModalContent").html("이미 지원한 공고입니다.")
			        	  } else {
// 		        			  location.href = "/apply/userDetail?jobopenNo="+jobopenNo;
								cntUserDetail();
			        	  }
		        	  } else {
		        			// Get the modal
		        			var modal = document.getElementById('myModal');
		        			
		        			modal.style.display = "block";
		        			
		        			// Get the <span> element that closes the modal
		        			var span = document.getElementsByClassName("close")[0];     

		        			var btnClose = document.getElementById("btnClose");
		        			
		        			// When the user clicks on <span> (x), close the modal
		        			span.onclick = function() {
		        			    modal.style.display = "none";
		        			}
		        			
		        			btnClose.onclick = function() {
		        			    modal.style.display = "none";
		        			    location.href="/user/login";
		        			}
		        			
		        			$("#ModalContent").html("로그인이 필요합니다")
		        	  }
		          }, error: function() {
		             alert("error");
		          }
		       })
		  	
	}


	function cntUserDetail(){
		
	       var jobopenNo = document.getElementById("jobopenNo").innerHTML;
//	        var title = document.getElementById("title").innerHTML;

			var applyData = { "jobopenNo": jobopenNo };

		
		$.ajax({
	          type:"post"
	          , url:"/applyMenu/cntUserD"
	          , dataType: "json"
	          , data: {
		        	  "jobopenNo": jobopenNo }
			  , success: function( data ) {
	        	  
	        	  if(data.result > 0) {
	        		  location.href = "/apply/userDetailUpdate?jobopenNo="+jobopenNo;
	        	  } else{
	        		  location.href = "/apply/userDetail?jobopenNo="+jobopenNo;
	        	  }
		         	  
	          }, error: function() {
	             alert("error");
	          }
	       })
	}

</script>

<%@ include file="../include/scriptLoader.jsp"%>
<%@ include file="../include/footer.jsp"%>