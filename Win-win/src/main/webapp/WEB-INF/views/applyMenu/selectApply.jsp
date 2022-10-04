<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>



<style type="text/css">

.info {
  font-size: 14px;
  font-weight: bold;  
  list-style-type: square;
  color: grey;
}

.infolist {
  font-size: 15px;
  font-weight: bold;  
}

</style>

<%@ include file="../include/header.jsp"%>

<div class="container">
<div class="container">

	<div class="col-12 mt-5">
		<p class="font-weight-bold h3">입사지원<span class="ml-3" style="font-size: 12px; font-weight: bold; color: grey;">정확한 정보를 바탕으로 성실하게 작성해 주시기 바랍니다.</span></p>
		<hr style="border: solid #376092;">
	</div>
	
	<div class="row col-12 mt-5">
		<div class="col-5 text-center mt-3">
			<p class="font-weight-bold h4">지원하기 전에 <span style="color: red;">꼭 알아두세요!</span></p>
			<img src="/resources/image/resume.png" style="height: 200px;"/>
		</div>
		<div class="col-7">
			<div class="mt-3">
				<p class="infolist">지원 시에 입력하신 정보</p> 
				<ul>
				<li class="info">지원자의 입사지원서 기재 내용이 허위임이 판정될 때에는 그 내용의 중요성과 관계없이 합격(입사)을 취소합니다.</li>
				<li class="info">최종 제출 전 각 단계별 지원 내용은 수정하실 수 있습니다.</li>
				</ul>
				<p  class="infolist">관련 문의사항</p> 
				<ul><li class="info">채용에 대한 문의사항은 채용문의 게시판으로 문의 해주시기 바랍니다.</li> </ul>
			
				<p  class="infolist">로그인 필요</p> 
				<ul><li class="info">로그인 한 사용자만 채용공고를 선택하여 입사지원 하실 수 있습니다.</li></ul>
			</div>
		</div>
	</div>

	<div class="mt-5">
	<table class="table table-bordered table-sm border-secondary col-8 " align="center" >
	<tbody>
		<tr>
			<th class="text-center align-middle bg-secondary pr-3 pl-3">채용분류</th>
			<td colspan="3">
				<div class="d-flex justify-content-start">
				<div class="form-check ml-4">
				  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
				  <label class="form-check-label" for="exampleRadios1">
				    신입사원 채용
				  </label>
				</div>
				<div class="form-check ml-4">
				  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
				  <label class="form-check-label" for="exampleRadios2">
				    경력사원 채용
				  </label>
				</div>
				</div>	
			</td>
		</tr>
		
		<tr>
			<th class="text-center align-middle bg-secondary pr-3 pl-3">채용공고</th>
			<td colspan="3">
				<select class="ml-4" id="jobTitle" style="width: 300px;height: 25px; ">
					<c:forEach items="${list }" var="JobopenBasic">
						<option></option>						
					</c:forEach>
				</select>
			</td>
			
		</tr>
	</tbody>
	</table>
	</div>

	<div class="d-flex justify-content-end" style="margin-right: 132px;">
	<button type="button" class="btn btn-primary btn-sm ml-3 mr-5" onclick="selectsubmit();" >지원하기</button>
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
	<!--         <select id="license" class="js-example-basic-single" > -->
	<!-- 		</select> -->
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

	$(document).ready(function() {
		
		(function() {
			$.ajax({
		          type:"post"
		          , url:"/applyMenu/selectApply"
		          , dataType: "json"
		          , success: function( data ) {
		        	 
		        	  console.log(data.result1);
			            
		        	  $("#jobTitle").find("option").remove();

		        	  
			             var list = data.result1;
			             
			             var title = new Array();
			             var no = new Array();
			             var end = new Array();
			             
			             var date = new Date();
			             date.setHours(0, 0, 0, 0);
			             
			             for(var i=0; i<list.length; i++) {
			            	 title[i] = list[i].title;
			            	 no[i] = list[i].jobopenNo;
			            	 end[i] = list[i].endDate;
			            	 
			            	 if(end[i] == null || date <= end[i]) {
			            		 
				                $("#jobTitle").append(
				                   $("<option>").attr(
				                      "value", no[i]
				                   ).text(title[i])
				                );
			            	 }
			             }
						
		        	  
		          }, error: function() {
		             alert("error");
		          }
		       })
		})();

		
		$("#exampleRadios2").click(function(){
			
			//여기다가 ajax로 경력 select 해서 가져오기 
		     
			$.ajax({
		          type:"post"
		          , url:"/applyMenu/selectApply"
		          , dataType: "json"
		          , success: function( data ) {
		        	 
		        	  console.log(data.result2);
			            
		        	  $("#jobTitle").find("option").remove();

		        	  
			             var list = data.result2;
			             
			             var title = new Array();
			             var no = new Array();
			             var end = new Array();
			             
			             var date = new Date();
			             date.setHours(0, 0, 0, 0);
			             
			             for(var i=0; i<list.length; i++) {
			            	 title[i] = list[i].title;
			            	 no[i] = list[i].jobopenNo;
			            	 end[i] = list[i].endDate;
			            	 
			            	 if(end[i] == null || date <= end[i]) {
			            		 
				                $("#jobTitle").append(
				                   $("<option>").attr(
				                      "value", no[i]
				                   ).text(title[i])
				                );
			            	 }
			             }
						
		        	  
		          }, error: function() {
		             alert("error");
		          }
		       })
							
		});
		
		
		$("#exampleRadios1").click(function(){
			
			//여기다가 ajax로 경력 select 해서 가져오기 
		     
			$.ajax({
		          type:"post"
		          , url:"/applyMenu/selectApply"
		          , dataType: "json"
		          , success: function( data ) {
		        	 
		        	  console.log(data.result1);
			            
		        	  $("#jobTitle").find("option").remove();

		        	  
			             var list = data.result1;
			             
			             var title = new Array();
			             var no = new Array();
			             var end = new Array();
			             
			             var date = new Date();
			             date.setHours(0, 0, 0, 0);
			             
			             for(var i=0; i<list.length; i++) {
			            	 title[i] = list[i].title;
			            	 no[i] = list[i].jobopenNo;
			            	 end[i] = list[i].endDate;
			            	 
			            	 if(end[i] == null || date <= end[i]) {
			            		 
				                $("#jobTitle").append(
				                   $("<option>").attr(
				                      "value", no[i]
				                   ).text(title[i])
				                );
			            	 }
			             }
						
		        	  
		          }, error: function() {
		             alert("error");
		          }
		       })
							
		});
	 
	});
	
	function selectsubmit(){
		var target = document.getElementById("jobTitle");
// 		   var title = target.options[target.selectedIndex].text;
	       var jobopenNo = target.options[target.selectedIndex].value;

				var applyData = {"jobopenNo": jobopenNo };

				console.log(applyData);
				
				$.ajax({
			          type:"post"
			          , url:"/applyMenu/sessionCheck"
			          , dataType: "json"
			          , data: applyData
			          , success: function( data ) {
			        	  
// 			        	  console.log(data.result);
			        	  
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
// 			        			  location.href = "/apply/userDetail?jobopenNo="+jobopenNo;
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
			  	
//         	  location.href = "/apply/userDetail?title="+title+"&jobopenNo="+jobopenNo;

	}
	
	function cntUserDetail(){
		var target = document.getElementById("jobTitle");
      	var jobopenNo = target.options[target.selectedIndex].value;
// 		var noData = {"jobopenNo": jobopenNo };	
		
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