<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/CSSLoader.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">

.a {
  text-decoration: none !important; 
  color: black !important;
}

.title {
  font-size: 14px;
}
</style>

<%@ include file="../include/header.jsp"%>

<div class="container">

	<div style="height: 100px"></div>
	<h4 class="text-center font-weight-bold">WINWIN은 <span style="color: #008CBA">임직원</span>의 <span style="color: #008CBA">꿈</span>이 실현되는 소중한 공간을 만들어갑니다.</h4>
	
	<div class="mt-5 text-center">
		<img src="/resources/image/linkbar.PNG" width="708"/>
	</div>

	<div class="text-center mt-3">
		<a class="a" href="/notice/list"><i class="fas fa-bullhorn fa-2x ml-5 mr-5 pl-4 pr-4"></i></a>
		<a class="a" href="/applyMenu/selectApply"><i class="far fa-edit fa-2x ml-5 mr-5 pl-4 pr-4"></i></a>		
		<a class="a" href="/applyMenu/passfail"><i class="far fa-check-square fa-2x ml-5 mr-5 pl-4 pr-4"></i></a>
		<a class="a" href="/qna/list"><i class="far fa-question-circle fa-2x ml-5 mr-5 pl-4 pr-4"></i></a>
	</div>
	
	<div class="text-center mt-2">
		<span class="title ml-5 mr-5 pl-3 pr-2 font-weight-bold"><a class="a" href="/notice/list">공지사항</a></span>
		<span class="title ml-5 mr-5 pl-3 pr-2 font-weight-bold"><a class="a" href="/applyMenu/selectApply">입사지원</a></span>		
		<span class="title ml-5 mr-5 pl-3 pr-2 font-weight-bold"><a class="a" href="/applyMenu/passfail">결과확인</a></span>
		<span class="title ml-5 mr-5 pl-3 pr-2 font-weight-bold"><a class="a" href="/qna/list">채용문의</a></span>
	</div>
	
	<hr class="mt-5" style="height:1px; width:750px; background-color: lightgray">
	<span class="ml-5 pl-5"></span><span class="title ml-5 pl-5 font-weight-bold"><a class="a" href="/jobOpen/list">채용공고</a></span>
	
	<div class="text-center mt-2">
		<table class="table table-sm col-md-8 " align="center">
		  <thead>
		    <tr>
		      <th>번호</th>
		      <th>구분</th>
		      <th>공고명</th>
		      <th>게시기간</th>
		      <th>진행상황</th>
		    </tr>
		  </thead>
		  <tbody>
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

<jsp:include page="../util/usermainpaging.jsp" />
	
</div>

<%@ include file="../include/scriptLoader.jsp"%>
<%@ include file="../include/footer.jsp"%>