<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
th {
	font-size: 15px;
}
td {
	font-size: 14px;
}

</style>

<%@ include file="../include/adminHeader.jsp"%>

<div class="container">

	<div class="col-12 mt-5">
		<p class="font-weight-bold h3">채용공고관리</p>
		<hr style="border: solid #376092;">
	</div>
	<div class="mt-4">
		<table class="table table-sm col-md-11 table-bordered"  align="center">
			<thead class="thead-light">
				<tr>
					<th>공고 진행 검색</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td class="d-flex justify-content-between">
						<select class="w-25 status" style="height:min-content">
							<option selected="selected">전체 확인</option>
							<option value="채용 중">채용 중</option>
							<option value="채용 마감">채용 마감</option>
							<option value="결과 발표">결과 발표</option>
							<option value="공고 종료">공고 종료</option>
						</select>
						<button class="bigbutton btn font-weight-bold text-white btn-lg" style="background: #376092;" onclick="location.href='/jobOpen/basicInfo'">채용 공고 등록하기</button>
					</td>
				</tr>
				
			</tbody>
		</table>
	
	</div>


	<div class="mt-4">
		<table class="table table-sm col-md-11 table-hover text-center" align="center">
			<thead class="thead-light">
				<tr>
					<th>번호</th>
					<th>구분</th>
					<th>공고명</th>
					<th>게시기간</th>
					<th>조회수</th>
					<th>지원자수</th>
					<th>진행상황</th>
					<th>
					<th>
				</tr>
			</thead>
			<tbody class="here">

			</tbody>
		</table>
	</div>
	
	<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<ul class="pagination" id="managePagination">
				</ul>
			</div>
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
					<button type="button" id="btnOk" class="font-weight-bold btn btn-primary mr-1" style="background-color: #376092">확인</button>
					<button type="button" id="btnNo" class="font-weight-bold btn btn-primary" style="background-color: #376092">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="statusModal" class="modal">
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
		    	<p class="text-info">공고 상태를 수정할 수 있습니다</p>
		    	<select class="w-25 statusMo">
					<option selected="selected">전체 확인</option>
					<option value="채용 중">채용 중</option>
					<option value="채용 마감">채용 마감</option>
					<option value="결과 발표">결과 발표</option>
					<option value="공고 종료">공고 종료</option>
				</select>
				<p class="font-weight-bold text-center" id="stChecking">
					
				</p>
			</div>
			
			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
					<button type="button" id="btnOkst" class="font-weight-bold btn btn-primary mr-1" style="background-color: #376092">확인</button>
					<button type="button" id="btnNost" class="font-weight-bold btn btn-primary" style="background-color: #376092">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>



<%@ include file="../include/scriptLoader.jsp"%>


<script>

	var page = 1; // 현재 페이지
	var listCount = 15; // 목록갯수
	var pageCount = 5; // 페이지 수
	var $status = "전체 확인";
	
	$(document).ready(function(){
		$(".status").change(function(){
			$status = $(".status option:selected").val();
			manageList();
		});
		
		
// 		$('.container').on("click", '.page-link', function(){
// 			var curPage = $(this).attr('data-curPage');
// 			console.log("컨테이너");
// 			manageList(curPage);
// 		});
		
	});
	
	$(function(){
		manageList(page);
	});
	
	function manageList(page){
		if(!page){
			page=1;
		}
		
		var param = {
				curPage : page,
				listCount : listCount,
				pageCount : pageCount,
				status : $status
		}
		
		$.post('/jobOpen/manage',param, function(result){
			if(result){
				$('.here').empty();
				
				
				$.each(result.list, function(i, item){
				
					moment(item.startDate).format('YYYY-MM-DD');
					
					var html = '<tr>'
						+'<th class="jobopenno">'+item.jobopenNo+'</th>'
						+'<td>'+item.offer+'</td>'
						+'<td><a href="/jobOpen/view?boardNo='+item.jobopenNo+'" style="text-decoration: none;">'+item.title+'</a></td>'
						+'<td>';
					if(item.allOpen==0){
						html+= moment(item.startDate).format("YYYY-MM-DD")+'&nbsp;-&nbsp;'+moment(item.endDate).format("YYYY-MM-DD");
					} else {
						html+='상시채용';
					}	
					html +='</td>'
						+'<td>'+item.hit+'</td>'
						+'<td><strong class="text-success">'+item.applicantCnt+'</strong></td>'
						+'<td>';
					if(item.status=='채용 중'){
						html+='<span class="badge badge-pill badge-primary stat font-weight-bold" style="cursor:pointer">'+item.status+'</span>';
					} else if(item.status=='채용 마감'){
						html+='<span class="badge badge-pill badge-danger stat font-weight-bold" style="cursor:pointer">'+item.status+'</span>';
					} else if(item.status=='결과 발표'){
						html+='<span class="badge badge-pill badge-success stat font-weight-bold" style="cursor:pointer">'+item.status+'</span>';
					} else if(item.status=='공고 종료'){
						html+='<span class="badge badge-pill badge-secondary stat font-weight-bold" style="cursor:pointer">'+item.status+'</span>';
					}
					html +='</td>'
						+'<td><span class="badge badge-warning font-weight-bold" style="cursor: pointer;" onclick="jo_update('+item.jobopenNo+');">수정</span></td>'
						+'<td><span class="badge badge-danger font-weight-bold deleteJob" style="cursor: pointer;">삭제</span></td>'
						+'</tr>';
						
						
					$('.here').append(html);
				});
				
				if (result.list.length == 0) {
					$('.here').append('<tr><td colspan=9 class="text-center" style="height:150px; vertical-align:middle;">정보가 없습니다.</td></tr>');
				}
			}
			
			
			
			
			paging(page, listCount, result.totalCount, pageCount, manageList);
		},'json');
		
	}
	
	function paging (page, listCount, totalCount, pageCount, callback) {
	
		var firstPage 	= 1;
		var lastPage 	= Math.ceil(totalCount / listCount);
		var endPage 	= Math.ceil(Number(page / pageCount)) * pageCount;
			endPage 	= endPage > lastPage ? lastPage : endPage;
		var startPage 	= (endPage - pageCount) + 1;
			startPage	= startPage < firstPage ? firstPage : startPage;
		
		$('#managePagination').empty();
		
		var html = '';
		//Prev 있을 때
		if (firstPage < startPage) {
			html += '<li id="prevBtn">';
			html += '	<button class="page-link" data-curPage="" aria-label="Next">';
			html += '		<span aria-hidden="true">&laquo;</span>';
			html += '	</button>';
			html += '</li>';	
		}
		
		for (var i = startPage; i <= endPage; i++) {
			//현재 페이지
			if (i == page) {
				html += '<li class="page-item active page_btn">';
				html += '	<button class="page-link" data-curPage="' + page + '">' + page + '</button>';
				html += '</li>';
			} else {
				html += '<li class="page-item page_btn">';
				html += '	<button class="page-link" data-curPage="' + i + '">' + i + '</button>';
				html += '</li>';
			}
		}
		
		//Next 있을 때
		if (endPage < lastPage) {
			html += '<li id="nextBtn">';
			html += '	<button class="page-link" data-curPage="" aria-label="Next">';
			html += '		<span aria-hidden="true">&raquo;</span>';
			html += '	</button>';
			html += '</li>';		
		}
		
		$('#managePagination').append(html);
		
		$('.page_btn').unbind('click').click(function () {
			page = $(this).find('button').attr('data-curPage');
			callback(page);
		});
		
		//Prev Event
		$('#prevBtn').unbind('click').click(function () {
			page = startPage == 1 ? 1 : startPage - 1;
			callback(page);
		});
		
		//Next Event
		$('#nextBtn').unbind('click').click(function () {
			page = endPage + 1;
			callback(page);
		});
	}
	
	
	
	
/* 여기부터 버튼 이벤트 */
	
	/* 공고 수정 */
	function jo_update(num){
		location.href="/jobOpen/basicUpdate?jobopenNo="+num;
	}
	
	
	/* 모달 설정 */
	$(document).ready(function(){
		$('.statusMo').on("change", function(){
			var $sel = $('.statusMo option:selected').val();
			$('#stChecking').html($sel);
		});
		
		$(".close").on("click", function(){
			$("#statusModal").css("display", "none");
			$("#myModal").css("display", "none");
			$('#stChecking').html("");
			$('.statusMo option:eq(0)').prop("selected",true);
		});
		
		$("#btnNost").on("click", function(){
			$("#statusModal").css("display", "none");
			$('#stChecking').html("");
			$('.statusMo option:eq(0)').prop("selected",true);
		});
		
		$("#btnNo").on("click", function(){
			$("#myModal").css("display", "none");
		})
		
		var jobopenno;
		// 상태 수정 버튼 이벤트
		$('.here').on('click',".stat",function(){
			$("#statusModal").css("display", "block");
			var select = $(this).parent().parent().children().eq(6).text();
			$("#stChecking").html(select);
			jobopenno = $(this).parent().parent().children().eq(0).text();
			
		});
		
		$("#btnOkst").on("click", function(){
			$("#statusModal").css("display", "none");
			console.log(jobopenno);
			var sel = $('.statusMo option:selected').val();
			
			if(sel=='전체 확인'){
				sel = $('#stChecking').html();
			}
			
			$.ajax({
				method:"post"
				, url:"/jobOpen/jo_status"
				, data:{
					"jobopenNo" : jobopenno,
					"status" : sel
					}
				, success : function(){
					$('.statusMo option:eq(0)').prop("selected",true);
					jobopenno = null;
					manageList($('.active').children().attr("data-curPage"));
				}
			});
		});
		
		// 공고 삭제 버튼 이벤트
		$('.here').on('click','.deleteJob', function(){
			jobopenno = $(this).parent().parent().children().eq(0).text();
			$("#myModal").css("display", "block");
			$("#idChecking").html("정말 삭제하시겠습니까?");
			console.log(jobopenno);
		});
		
		$("#btnOk").on("click", function(){
			$("#myModal").css("display","none");
			
			$.ajax({
				method:"post"
				, url:"/jobOpen/jo_delete"
				, data: {"jobopenNo" : jobopenno}
				, success:function(){
					manageList($('.active').children().attr("data-curPage"));
				}
			});
		});
		
		
	})

	2.2
	
	
</script>






<%@ include file="../include/footer.jsp"%>