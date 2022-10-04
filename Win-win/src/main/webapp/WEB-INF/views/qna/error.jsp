<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../include/CSSLoader.jsp"%>
<style>

</style>

<c:if test="${empty adminLogin}">
<%@ include file="../include/header.jsp"%>
</c:if>

<c:if test="${adminLogin }">
<%@ include file="../include/adminHeader.jsp"%>
</c:if>
<div class="container">
<div class="container">
	<div class="col-12 mt-5">
		<p class="font-weight-bold h3"><i class="fas fa-exclamation-triangle mr-2"></i>해당 페이지의 요청 권한이 없습니다</p>
		<hr style="border: solid #376092;">
		<p style="font-weight: bold;">로그인 정보와 게시판 정보가 일치하지 않습니다.<br>
		아래의 예외사항을 참고하여 로그인 정보를 다시 한번 확인해 보세요.<br></p>		 		 
		<p style="font-size: 14px;">
		 &nbsp;&nbsp;- 게시글 작성자가 아닐 때 글 수정/삭제 요청<br>
		 &nbsp;&nbsp;- 댓글 작성자가 아닐 때 댓글 삭제 요청<br>
		 &nbsp;&nbsp;- 게시글 작성자가 아닐 때 댓글 등록 요청<p><br>
		<i class="far fa-hand-point-right mr-2"></i><a href="/qna/view?qnaNo=${board.qnaNo }">게시글로 이동</a><br>
		<i class="far fa-hand-point-right mr-2"></i><a href="/qna/list">목록으로</a><br>
	</div>
</div>
</div>
<%@ include file="../include/scriptLoader.jsp"%>
<script>
</script>
<%@ include file="../include/footer.jsp"%>