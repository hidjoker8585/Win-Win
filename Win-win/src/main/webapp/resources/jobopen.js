/**
 * 
 */


$(document).ready(function(){
	
	$("#btnBasicCancel").click(function(){
		location.href="/main/adminmain";
	});
	
	
	$("#payCheck").click(function(){
		if($('#pay').css('visibility') == 'hidden'){
			    $('#pay').css('visibility','visible');
			    $('#rulePay').prop("checked",false);
			   
		} else {
			    $('#pay').css('visibility','hidden');
			    $('#pay input').val("");
			    $('#rulePay').prop("checked",true);
		}
	});
	
	$('input[type="checkbox"][id="rulePay"]').change(function(){
		if($(this).is(":checked")){
			$('#pay').css('visibility','hidden');
			$('#pay input').val("");
		} else {
			$('#pay').css('visibility', 'visible');
			
		}
	});
	
	
	
	$("#openCheck").click(function(){
		if($('#open').css('visibility') == 'hidden'){
			    $('#open').css('visibility','visible');
			    $('#allOpen').prop("checked",false);
			   
		} else {
			    $('#open').css('visibility','hidden');
			    $('#open input').val("");
			    $('#allOpen').prop("checked",true);
		}
	});
	
	$('input[type="checkbox"][id="allOpen"]').change(function(){
		if($(this).is(":checked")){
			$('#open').css('visibility','hidden');
			$('#open input').val("");
		}
	});
	
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
		var sector = '<div class="detailin mt-5 p-3 bg-secondary"> <div class="form-inline m-1"> <div class="col-2"> <label for="sector">모집 부문</label> </div> <div class="col-6"> <input type="text" class="form-control w-100" name="detail['+i+'].sector" required /> </div> <div class="col-4"> <i class="far fa-minus-square fa-2x subDetail" data-toggle="tooltip" data-placement="top" title="모집요강 삭제" style="cursor:pointer" ></i> </div> </div> <div class="form-inline m-1"> <div class="col-2"> <label for="task">담당 업무</label>	</div> <div class="col-10"> <input type="text" class="form-control w-100" name="detail['+i+'].task" required /> </div> </div> <div class="form-inline m-1"> <div class="col-2"><label for="volume">채용 인원</label> </div><div class="col-4  border-right border-info"><input type="number" class="form-control w-75" name="detail['+i+'].volume" required /> 명</div><div class="col-2"> <label for="location">근무지</label> </div> <div class="col-4"> <input type="text" class="form-control w-100" name="detail['+i+'].location" required /> </div></div><div class="form-inline m-1"> <div class="col-2"> <label for="special">우대 사항</label></div><div class="col-10"><input type="text" id="special" class="form-control w-100" name="detail['+i+'].special" required /></div> </div><div><input type="hidden" value="${sessionScope.jobopen }" name="detail['+i+'].jobopenNo"/></div> </div>'
		
		return sector;
	}
	
	var i = 0;
	$('.addDetail').click(function(){
		i++; 
		var s = setSector(i);
		$('#detailInfo').append(s);
		$('[data-toggle="tooltip"]').tooltip();
	});
	
	$(document).on("click",".subDetail",function(){
		$('[data-toggle="tooltip"]').tooltip('hide');
		$(this).parent().parent().parent().remove();
	});
	
	$("#btnDetailCancel").click(function(){
		
		var modal = document.getElementById('myModal');
		modal.style.display = "block";
		var span = document.getElementsByClassName('close')[0];
		var btnClose = document.getElementById('btnClose');
		var btnNo = document.getElementById('btnNo');
		
		$('#idChecking').html("작성을 취소하시겠습니까?<br>확인 후에는 저장되지 않습니다.");
		
		span.onclick = function(){
			modal.style.display = "none";
		}
		btnClose.onclick = function(){
			modal.style.display = "none";
			location.href="/main/adminmain";
		}
		btnNo.onclick = function(){
			modal.style.display = "none";
		}
		
	});
	
	$("#btnRegiCancel").click(function(){
		var modal = document.getElementById('myModal');
		modal.style.display = "block";
		var span = document.getElementsByClassName('close')[0];
		var btnClose = document.getElementById('btnClose');
		var btnNo = document.getElementById('btnNo');
		
		$('#idChecking').html("작성을 취소하시겠습니까?<br>확인 후에는 저장되지 않습니다.");
		
		span.onclick = function(){
			modal.style.display = "none";
		}
		btnClose.onclick = function(){
			modal.style.display = "none";
			location.href="/main/adminmain";
		}
		btnNo.onclick = function(){
			modal.style.display = "none";
		}
	});
	
	
	
	
	
	
});
