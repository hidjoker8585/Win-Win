<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/CSSLoader.jsp"%>

<style>
th {
	font-size: 15px;
}
.view {
	font-size: 14px;
	cursor:pointer;
}
</style>

<c:if test="${empty adminLogin}">
<%@ include file="../include/header.jsp"%>
</c:if>

<c:if test="${adminLogin }">
<%@ include file="../include/adminHeader.jsp"%>
</c:if>

<div class = "container">
	<div class="container">
	<div class="col-12 mt-5">
		<p class="font-weight-bold h3">공지사항</p>
		<hr style="border: solid #376092;">
	</div>
	
	<c:if test="${adminLogin }">
		<div class="mt-2">
			<table class="table table-sm col-md-11 table-borderless mb-1" align="center">
				<tr> 
					<td class="text-right">
						<button class="bigbutton btn font-weight-bold text-white btn-lg" style="background: #376092;" id="btnWrite">공지사항 작성하기</button>		
					</td>
				</tr>
			</table>
		</div>
	</c:if>
		
	<div class="d-flex justify-content-center">
		<table class="table table-sm col-md-11 table-hover text-center">
			<thead class="thead-light">
				<tr>
					<th width="13%">번호</th>
					<th class="truncated" width="50%">제목</th>
					<th width="4%"><th>
					<th width="11%">작성일자</th>
					<th width="11%">작성자</th>
					<th width="11%">조회수</th>
				</tr>
			</thead>
		<tbody>
		<c:forEach items="${list }" var="board">
		<tr>
			<td class="view">${board.noticeno }</td>
			<td class="text-left view"><a href="/notice/view?noticeno=${board.noticeno}" style="text-decoration: none">${board.title }</a></td>
			<td class="view">
			<c:if test="${board.filesCnt ne 0 }">
				<span class="badge badge-pill badge-secondary">파일첨부</span>
			</c:if>
			<td class="view">
			<td class="view"><fmt:formatDate value="${board.writedate}" pattern="yyyy-MM-dd" /></td>
			<td class="view">[관리자]</td>
			<td class="view">${board.hit }</td>	
		</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
	<br>
	
	<jsp:include page="/WEB-INF/views/util/noticepaging.jsp" />

	</div>
</div>

<%@ include file="../include/scriptLoader.jsp"%>

<script>
$("#btnWrite").click(function(){
	$(location).attr("href","/notice/write");
});
$("table").on("click",".view",function(){
	var noticeno = $(this).parent().children().eq(0).text();
	$(location).attr("href","/notice/view?noticeno="+noticeno);
});
</script>

<%@ include file="../include/footer.jsp"%>