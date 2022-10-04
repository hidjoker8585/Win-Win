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
	
	<div class="mt-4">
		<table class="table table-sm col-md-11 table-hover table-bordered" align="center">
			<thead class="thead-light">
				<tr>
					<th>채용공고 알림</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>&nbsp;<i class="fas fa-lightbulb text-danger"></i>&nbsp;<a href="/notice/view?noticeno=2">입사지원 작성가이드</a></td>
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
					<th>진행상황</th>
				</tr>
			</thead>
			
			<c:forEach items="${list }" var="JobopenBasic">
			<tr>
				<td>${JobopenBasic.jobopenNo }</td>
				<td>${JobopenBasic.offer }</td>
				<td><a href="/jobOpen/view?boardNo=${JobopenBasic.jobopenNo}" style="text-decoration: none;">${JobopenBasic.title }</a></td>
				<td>
					<c:if test="${JobopenBasic.allOpen eq '0' }">
						<fmt:formatDate value="${JobopenBasic.startDate }" pattern="yyyy-MM-dd" />&nbsp;-&nbsp;<fmt:formatDate value="${JobopenBasic.endDate }" pattern="yyyy-MM-dd" />
					</c:if>
					<c:if test="${JobopenBasic.allOpen ne '0' }">
						상시채용
					</c:if>	
				</td>
				<td>${JobopenBasic.hit }</td>
				<td>
					<c:if test="${JobopenBasic.status eq '채용 중'}">
						<span class="badge badge-pill badge-primary  font-weight-bold">${JobopenBasic.status }</span>
					</c:if>
					<c:if test="${JobopenBasic.status eq '결과 발표'}">
						<span class="badge badge-pill badge-success  font-weight-bold">${JobopenBasic.status }</span>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		
		</table>
	</div>
	
<jsp:include page="../util/jobopenpaging.jsp" />
	
</div>
</div>

<%@ include file="../include/scriptLoader.jsp"%>
<%@ include file="../include/footer.jsp"%>