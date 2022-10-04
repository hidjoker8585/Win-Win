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
		<p class="font-weight-bold h3">지원 결과확인<span class="ml-3" style="font-size: 12px; font-weight: bold; color: grey;">지원하신 채용공고의 합격 결과를 확인하실 수 있습니다.</span></p>
		<hr style="border: solid #376092;">
	</div>
	
	<div class="row col-12 mt-5">
		<div class="col-5 text-center mt-3">
			<img src="/resources/image/hand.png" style="height: 200px;"/>
		</div>
		<div class="col-7 d-flex flex-wrap align-content-center mt-2">
			<div>
				<p class="infolist">지원 결과 확인 시</p> 
				<ul>
				<li class="info">지원하신 공고를 선택하시고 비밀번호를 다시 한번 입력하신 후 합격 결과를 확인하시기 바랍니다.</li>
				</ul>
				<p class="infolist">상시채용 공고 결과 발표</p> 
				<ul><li class="info">상시채용 공고는 e-mail을 통해 <span style="color:#376092">개별통보</span> 됩니다.</li> </ul>
				<p class="infolist">관련 문의사항</p> 
				<ul><li class="info">결과에 대한 문의사항은 채용문의 게시판으로 문의 해주시기 바랍니다.</li> </ul>
			
			</div>
		</div>
	</div>

	<div class="mt-5">
	<table class="table table-bordered table-sm border-secondary col-8 " align="center">
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
					<select class="ml-4" id="jobTitle" style="width: 300px; height: 25px;">
						<c:forEach items="${list }" var="JobopenBasic">
							<option value="${JobopenBasic.jobopenNo}">${JobopenBasic.title}</option>						
						</c:forEach>	
					</select>
			</td>
		</tr>
		
<!-- 		<tr> -->
<!-- 			<th class="text-center align-middle bg-secondary pr-3 pl-3" >한글성명</th> -->
<!-- 			<td colspan="3">  		 -->
<!-- 				<input class="ml-4" type="text" style="width: 250px; height: 25px;"/> -->
<!-- 			</td>			 -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th class="text-center align-middle bg-secondary pr-3 pl-3" >이메일</th> -->
<!-- 			<td colspan="3">  		 -->
<!-- 				<input class="ml-4" type="text" style="width: 250px; height: 25px;"/> -->
<!-- 			</td>			 -->
<!-- 		</tr> -->
		<tr>
			<th class="text-center align-middle bg-secondary pr-3 pl-3" >비밀번호</th>
			<td colspan="3">  		
				<input class="ml-4" id="pw" type="password" style="width: 300px; height: 25px; required"/>
			</td>			
		</tr>
	</tbody>
	</table>
		<div class="d-flex justify-content-end" style="margin-right: 132px;">
		<button type="button" class="btn btn-primary btn-sm ml-3 mr-5" onclick="selectsubmit();" >결과확인</button>
		</div>
	</div>

</div>
</div>

<!--     The Modal -->
    <div id="myModal" class="modal">
 
<!-- 	      Modal content -->
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

	$(document).ready(function() {
		$("#exampleRadios2").click(function(){
			
			//여기다가 ajax로 경력 select 해서 가져오기 
		     
			$.ajax({
		          type:"post"
		          , url:"/applyMenu/passfail"
		          , dataType: "json"
		          , success: function( data ) {
		        	 
		        	  console.log(data.result2);
			            
		        	  $("#jobTitle").find("option").remove();

		        	  
			             var list = data.result2;
			             
			             var title = new Array();
			             var no = new Array();
			             
			             for(var i=0; i<list.length; i++) {
			            	 title[i] = list[i].title;
			            	 no[i] = list[i].jobopenNo;
			            	 
			                $("#jobTitle").append(
			                   $("<option>").attr(
			                      "value", no[i]
			                   ).text(title[i])
			                );
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
		          , url:"/applyMenu/passfail"
		          , dataType: "json"
		          , success: function( data ) {
		        	 
		        	  console.log(data.result1);
			            
		        	  $("#jobTitle").find("option").remove();

		        	  
			             var list = data.result1;
			             
			             var title = new Array();
			             var no = new Array();
 			             
			             for(var i=0; i<list.length; i++) {
			            	 title[i] = list[i].title;
			            	 no[i] = list[i].jobopenNo;
			            	 
			                $("#jobTitle").append(
			                   $("<option>").attr(
			                      "value", no[i]
			                   ).text(title[i])
			                );
			             }
						
		        	  
		          }, error: function() {
		             alert("error");
		          }
		       })
							
		});
	 
	});
	
	
	function selectsubmit(){
		var target = document.getElementById("jobTitle");

// 		var pass = $("#pw").val();
		
// 		console.log(pass);
		
				$.ajax({
			          type:"post"
			          , url:"/applyMenu/loginCheck"
			          , dataType: "json"
// 			          , data: {
// 			        	  "pw" : pass
// 			          }
			          , success: function( data ) {
			        	  
// 			        	  alert(data.pwCheck);
			        	  
			        	  if(data.result > 0 ) {
			        		  
// 			        		  if(data.pwCheck > 0) {
			        			  			        			  
// 			        		  } else {
			        			  pwdCheck();
			        			  
// 			        		  }
			        		  
			        		  
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
	
	function pwdCheck(){

		var pass = $("#pw").val();		
		
		$.ajax({
	          type:"post"
	          , url:"/applyMenu/pwdCheck"
	          , dataType: "json"
	          , data: {
	        	  "pw" : pass
	          }
	          , success: function( data ) {
	        	  
	        	  if(data.pwCheck > 0 ) {
	        		  passfail();
	        	  } else {
	        		  
	        		  if ( $("#pw").val() == "") {
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
		        			
		        			$("#ModalContent").html("비밀번호를 입력해주세요.")
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
	        			}
	        			
	        			$("#ModalContent").html("비밀번호가 일치하지 않습니다.")
	        		  }
	        			
	        	  }
		        	  
	          }, error: function() {
	             alert("error");
	          }
	       })
	}
	
	
	function passfail() {
			var target = document.getElementById("jobTitle");
	      	var jobopenNo = target.options[target.selectedIndex].value;
// 	     	var applyData = {"jobopenNo": jobopenNo };   
	     	
			$.ajax({
		          type:"post"
		          , url:"/applyMenu/passfailCheck"
		          , dataType: "json"
		          , data: {
		        	  "jobopenNo": jobopenNo
		          }
		          , success: function( data ) {
		        	  
					if(data.result == "지원결과없음") {
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
	        			
	        			$("#ModalContent").html("해당 공고에 지원하지 않았습니다.")
					} else if (data.result == null) {
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
	        			
	        			$("#ModalContent").html("해당공고는 아직 발표 전입니다.")
					} else if(data.result == "합격") {
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
	        			
	        			$("#ModalContent").html("축하합니다 합격입니다.")
		
					} else if(data.result == "불합격") {
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
	        			
	        			$("#ModalContent").html("불합격 입니다.")
		
					}
			        	  
		          }, error: function() {
		             alert("error");
		          }
		       })
	};
</script>	

<%@ include file="../include/scriptLoader.jsp"%>
<%@ include file="../include/footer.jsp"%>