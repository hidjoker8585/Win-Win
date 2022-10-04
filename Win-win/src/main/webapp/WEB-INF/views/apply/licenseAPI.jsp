<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>


<script type="text/javascript">

	$(document).ready(function() {
		
	      $.ajax({
	          type:"post"
	          , url:"/apply/licenseAPI"
	          , dataType: "json"
	          , success: function( data ) {
	             
//	              console.log(JSON.parse(data.data).response.body.items.item);
	             
	             var list = JSON.parse(data.data).response.body.items.item;
	             
	             var value = new Array();
	             for(var i=0; i<list.length; i++) {
	                value[i] = list[i].jmfldnm;
	             }

	             value.sort();

	             for(var i=0; i<list.length; i++) {
	                $("#license").append(
	                   $("<option>").attr(
	                      "value", value[i]
	                   ).text(value[i])
	                );
	             }
	             
	          }, error: function() {
	             alert("error");
	          }
	       })
			
	 
		$('.js-example-basic-single').select2();
		
			
		// Get the modal
		var modal = document.getElementById('apiModal');
		
		// Get the button that opens the modal
// 		var btn = document.getElementsByClassName("licenseAPI");
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("liClose")[0];                                          
		
		var liBtnClose = document.getElementById("liBtnClose");
		
		// When the user clicks on the button, open the modal 
// 		btn.onclick = function() {
// 		    modal.style.display = "block";
// 		}
		
		$("table").on("click", ".licenseAPI", function() {
			$("#iDiv").text($(this).attr('data-idx'));
		    modal.style.display = "block";
		});
		
		$("table").on("click", ".liCancel", function() {
			$("#iDiv").text($(this).attr('data-idx'));
			var index = $("#iDiv").text();
			$('#selectLicense'+index).val("");	
		});
		
// 		for(var i=0; i<btn.length; i++) {
// 			btn[i].onclick = function() {
// 	 		    modal.style.display = "block";
// 			}
// 		}
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		    modal.style.display = "none";
		}
		
		liBtnClose.onclick = function() {
		    modal.style.display = "none";
		}
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
		
		$("#liBtnOk").click(function() {
			var select = $("#license option:selected").val();
			var write =$("#writeLicense").val();
			
			var index = $("#iDiv").text();
			
				if($('#license').val() == "자격증을 선택하세요") {
					$("#selectLicense"+index).val(write);
					modal.style.display = "none";
					$("#writeLicense").val('');
					
				} else {
					$("#selectLicense"+index).val(select);
					modal.style.display = "none";
					$("#license").val('자격증을 선택하세요').trigger('change') ;
				}

		});
		

			
	});	

</script>

</head>
<body>

    <!-- The Modal -->
    <div id="apiModal" class="modal">
 
	      <!-- Modal content -->
	      <div class="modal-content">
	      	
	      	<div class="row">
				<div class="col-6">
				<span class="font-weight-bold h2 d-flex justify-content-start mt-3">WIN-WIN</span>
				</div>
				<div class="col-6">
				<span class="d-flex justify-content-end mt-1"><span class="liClose">&times;</span></span>
				</div>
			</div>
	     	<div class="mb-3" style="height:4px; background-color: #376092" ></div>
	     	
	     	<!-- 모달 내용 입력하는 부분 -->
	     	<div>
		     	<div class="mt-4">
			        <p class="font-weight-bold text-center" style="margin-bottom: 0;">국가기술자격 자격증을 검색하세요.</p>
			        <p class="text-center mb-3" style="font-size: 13px; margin-bottom: 0;">( 기능사/산업기사/기사/기능장/기술사 )</p>
			        <div class="d-flex justify-content-center">
				        <select id="license" class="js-example-basic-single " style="width: 200px;">
				        	 <option selected="selected">자격증을 선택하세요</option>
						</select>
					</div> 
					
				</div>

				<div class="mt-4">
			        <p class="font-weight-bold text-center mb-3" style="margin-bottom: 0;">그밖의 자격증을 직접 입력하세요.</p>
			        <div class="d-flex justify-content-center">
			        	<input type="text" id="writeLicense" style="width:200px;"/>
			        </div>
				</div>
				
				<div id="iDiv" style="display:none;"></div>
			
			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
				<button type="button"  id="liBtnOk" class="font-weight-bold btn btn-primary mr-2 " style="background-color: #376092">확인</button>
				<button type="button"  id="liBtnClose" class="font-weight-bold btn btn-secondary">닫기</button>
				</div>
			</div>
	      </div>
	 
	    </div>
    </div>

</body>
</html>