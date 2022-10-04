
<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../include/CSSLoader.jsp"%>
    
<style>
#fileBox{
	max-width: 680px;
	max-height: 100px; 
	overflow-x : hidden;
	overflow-y : auto;
}
.tablediv {
	padding: 0;
}
</style>

<c:if test="${empty adminLogin}">
<%@ include file="../include/header.jsp"%>
</c:if>

<c:if test="${adminLogin }">
<%@ include file="../include/adminHeader.jsp"%>
</c:if>

<div class= "container">
<div class="container">

	<div class="col-12 mt-5">
		<p class="font-weight-bold h3">공지사항</p>
		<hr style="border: solid #376092;">
	</div>

	<div class="d-flex justify-content-center">
		<div class="tablediv col-11 mt-3" style="border-bottom: 2px solid lightgrey">
			<table class="table table-striped " style="border-bottom: 1px solid lightgrey">
				<tr>
					<th width="15%">글번호 <span class="ml-2" id="noticeNo">${board.noticeno }</span></th>
					<th width="40%">제목 <span class="ml-3">${board.title }</span></th>
					<th width="15%">작성자 <span class="ml-3">[관리자]</span></th>
					<th width="10%">조회수<span class="ml-2">${board.hit }</span></th>
					<th width="20%">작성일<span class="ml-3"><fmt:formatDate value="${board.writedate}" pattern="yyyy-MM-dd" /></span></th>
				</tr>
			</table>
			<div class="text-right mb-2">
				<c:if test="${board.filesCnt eq 0}">
					<label style="cursor:pointer;"><i class="fas fa-download mr-2"></i>첨부된 파일(${board.filesCnt }</label>)
				</c:if>
				<c:if test="${board.filesCnt ne 0}">
					<label style="cursor:pointer;" onclick="onFiles();"><i class="fas fa-download mr-2"></i>첨부된 파일(${board.filesCnt }</label>)
				</c:if>		
			</div>			
		</div>
	</div>
	
	<div class="d-flex justify-content-center">
		<div class="col-11 mt-3" style="border: 1px dashed lightgrey;">	
		    <p class="mt-4">
				${board.content}
			</p>
		</div>
	</div>	
	
	<div class="d-flex justify-content-center">
		<div class="col-11 mt-3" style="border-top: 2px solid lightgrey; ">
	    	<div id="btns" class="form-group d-flex justify-content-center mt-3 mb-2 " style="margin-bottom: 0px;">
				<button id="btnList" type="button" class="btn btn-primary btn-sm">목록</button>
				<c:if test="${adminLogin }">				
					<button id="btnUpdate" type="button" class="btn btn-primary btn-sm ml-2 mr-2">수정</button>
					<button id="btnDel" type="button" class="btn btn-sm btn-primary">삭제</button>
				</c:if>
			</div>
		</div>
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
			        <p class="font-weight-bold text-center" id="idChecking">
			        	<div id="fileBox">
			        		<table id="upTable" class="table table-hover table-sm">
			        			<c:forEach items="${files}" var="file">
			        	 			<tr>
			        	 				<td style="cursor:pointer;" class="upCol" width="10%"><i class="fas fa-file-download mr-2 ml-2"></i></td>
			        	 				<td style="cursor:pointer;" class="upCol" width="60%" class="truncated">${file.originName }</td>
			        	 				<td style="cursor:pointer;" class="upCol" width="30%" class="truncated">${file.filesize } bytes</td>
			        	 				<td class="upCol" style="display :none;">${file.fileNo }</td>
			        	 			</tr>
			        			</c:forEach>
			        		</table>
			        	</div>
			        </p>
				</div>
			
			<div class="modal-footer d-flex justify-content-center">
				<div class="row">
				<button type="button"  id="btnClose" class="font-weight-bold btn btn-primary" style="background-color: #376092">확인</button>
				</div>
			</div>
	      </div>
	 
	    </div>
    </div>


<%@ include file="../include/scriptLoader.jsp"%>

<script>
$("#btnList").click(function(){
	$(location).attr("href","/notice/list");
});
$("#btnUpdate").click(function(){
	$(location).attr("href","/notice/update?noticeno="+${board.noticeno});
});
$("#btnDel").click(function(){
	$(location).attr("href","/notice/delete?noticeno="+${board.noticeno});
});
$("#upTable").on("click",".upCol",function(){
	var noticeno = $("#noticeNo").text();
	var fileno = $(this).parent().children().eq(3).text();
	console.log(fileno);
	$(location).attr("href","/notice/download?fileNo="+fileno+"&noticeno="+noticeno);	
});


function onFiles(){
	var modal = document.getElementById('myModal');
	modal.style.display = "block";
	var span = document.getElementsByClassName("close")[0];

	var btnClose = document.getElementById("btnClose");
				
	span.onclick = function() {
		modal.style.display = "none";
	}

	btnClose.onclick = function() {
		modal.style.display = "none";
	}
}
</script>

<%@ include file="../include/footer.jsp"%>