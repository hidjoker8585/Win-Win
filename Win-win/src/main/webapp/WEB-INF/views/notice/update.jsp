
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../include/CSSLoader.jsp"%>
<style>
#content{
	width : 99%
}
td{
	font-size: 16px
}
#fileBox{
	max-width: 680px;
	max-height: 100px; 
	overflow-x : hidden;
	overflow-y : auto;
}

</style>

<%@ include file="../include/adminHeader.jsp"%>
<div class = "container">
	<form action="/notice/update" method="post" enctype="multipart/form-data">
	<div class="p-5">
	<h3 class="font-weight-bold">공지사항</h3>
	<hr style="border: solid #376092;">
	<table class="table table-sm table-bordered">
		<tr>
			<td class="text-center align-middle" style="width:300px;background-color: lightgray">
				<strong>제목</strong>
			</td>
			<td class="text-center" style="background-color: lightgray">
				<input type="text" class="form-control" id="title" name="title" value="${board.title }" placeholder="제목을 적으세요(66자 이내)"/>
			</td>
		</tr>
		<tr>
			<td class="text-center">
				작성일
			</td>
			<td class="text-center" id="today">
			</td>
		</tr>
		<tr>
			<td class="text-center">
				첨부할 파일	
			</td>
			<td class="text-center">
				<input type="file" multiple="multiple" id="files" name="files" onchange="fileCheck();"/>
				<div id="message" style="color: red"></div>				
			</td>
		</tr>
		<tr>
			<td class="text-center">
				첨부된 파일
			</td>
			<td class="text-center">
				<c:if test="${board.filesCnt eq 0 }">첨부된 파일이 없습니다</c:if>
				<c:if test="${board.filesCnt ne 0 }">
				<div id="fileBox">
					<table class="table table-sm">
						<c:forEach items="${files }" var="file">
							<tr>
								<td width="10%"><i class="fas fa-save mr-2 ml-2"></i></td>
								<td width="60%">${file.originName}</td>
								<td width="20%">${file.filesize } bytes</td>
								<td width="10%"><span class="badge badge-danger" onclick="delFile(event);">파일삭제</span></td>
								<td style="display:none">${file.fileNo }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				</c:if>
			</td>
		</tr>
	</table>

	<div class="p-5">
		<textarea class="form-control" rows="20" name="content" id="content">${board.content }</textarea>
	</div>
	</div>
	
	<input type="hidden" name="noticeno" value="${board.noticeno }"/>	
	
	</form>
	<div class="form-group d-flex justify-content-center">
		<button type="button" id="btnUpdate" class="btn btn-primary">수정</button>
		<button type="button" id="btnCancel" class="btn btn-primary ml-2">취소</button>
	</div>	
</div>

<input type="hidden" id="size" value="${size }"/>	

<%@ include file="../include/scriptLoader.jsp"%>

<script type="text/javascript"
 src="/resources/se2/js/HuskyEZCreator.js"></script>
 <script type="text/javascript" 
 src="/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script>
$(document).ready(function() {
	var time = new Date();
	var today = time.getFullYear()+"년 "+(time.getMonth()+1)+"월 "+time.getDate()+"일";	
	$("#today").text(today);	
	
	$("#btnCancel").click(function() {
		$(location).attr("href","/notice/view?noticeno="+${board.noticeno});
	});
	$("#btnUpdate").click(function() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		if($("#title").val()==""){
			alert("제목을 입력하세요");
			$("#title").focus();
		}else if($("#content").val()=="<br>"||$("#content").val()==""){
			alert("내용을 입력하세요");			
		}else if($("#title").val().length > 100){	
			alert("글자 제한 수를 초과했습니다.제목(100자 이내)");
			$("#title").focus();
		}else if($("#content").val().length > 1333){
			console.log($("#content").val().length);
			console.log($("#content").val());
			alert("글자 제한 수를 초과했습니다.본문(1333자 이내)");
		}else{
			submitContents($(this));
			$("form").submit();
		}
	});
});
function fileCheck(){
	var total = 10*1024*1024;
	var files = document.getElementById("files");
	$(files.files).each(function(){
		total -= this.size;
	});
	var storedSize = $("#size").val();
	total -= storedSize;
	if(total<0){
		$("#message").text("파일 용량이 10MB를 초과하였습니다");
		$("#btnUpdate").attr("disabled",true);
	}else{
		$("#message").text("");
		$("#btnUpdate").attr("disabled",false);
	}
}
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2",
    htParams : {
    	bUseToolbar: true, // 툴바 사용여부
    	bUseVerticalResizer: false, //입력창 크기 조절바
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
    } catch(e) {}
}

function delFile(event){
	var target = event.currentTarget;
	$(target).parent().parent().attr("style","display:none");
	var fileno = $(target).parent().next().text();
	var size = $(target).parent().parent().children().eq(2).text();
	var arr = size.split(" ");
	size = $("#size").val()-arr[0];
	$("#size").val(size);
	fileCheck();
	$.ajax({
		type:"post",
		url:"/notice/updateFile",
		data:{"fileNo":fileno},
		complete:function(){
			alert("파일 삭제 완료!");
		}
	});
}
function pasteHTML(filepath){
	var sHTML = '<img src="/resources/image/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}
</script>

<%@ include file="../include/footer.jsp"%>