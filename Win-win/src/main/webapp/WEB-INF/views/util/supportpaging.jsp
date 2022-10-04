<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row">
	<div class="col-12 d-flex justify-content-center">
			<ul class="pagination">


<!-- 				이전 페이지 -->
<!-- 				첫 페이지라면 금지 표시 -->
				<c:if test="${paging.curPage eq 1 }">
					<li class="page-item disabled"><button class="page-link "
						data-curPage="1" aria-label="Previous">&laquo;<span aria-hidden="true"></span></button></li>
				</c:if>
				<c:if test="${paging.curPage ne 1 }">
<!-- 					첫페이지가아닐때 -->
					<li><button class="page-link"
						data-curPage="${ requestScope.paging.curPage-1 }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
					</button></li>
				</c:if>
				
<!-- 					페이징 번호 -->
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="page"> 
	 					<c:if test="${paging.curPage eq page }"> 
							<li class="page-item active">
						</c:if>
						<c:if test="${paging.curPage ne page }">
							<li class="page-item"> 	
						</c:if>
						<button class="page-link" data-curPage="${ page }">${ page }</button>
				</c:forEach>

<!-- 				다음 페이지 -->
<!-- 				마지막 페이지라면 금지 표시 -->
				<c:if test="${paging.curPage eq paging.totalPage }">
<!-- 					마지막 페이지일때 -->
					<li class="page-item disabled"><button class="page-link"
						data-curPage="${paging.totalPage}"><span aria-hidden="true">&raquo;</span>
					</button></li>
				</c:if>
				<c:if test="${paging.curPage ne paging.endPage }">
<!-- 					마지막 페이지가아닐때 -->
					<li><button class="page-link" data-curPage="${ paging.curPage+1 }"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</button></li>
				</c:if>

			</ul>
	</div>
</div>