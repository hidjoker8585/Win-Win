<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row">
	<div class="col-12 d-flex justify-content-center">
			<ul class="pagination">


				<!-- 이전 페이지 -->
				<!-- 첫 페이지라면 금지 표시 -->
				<c:if test="${paging.curPage eq 1 }">
					<li class="page-item disabled"><a class="page-link "
						href="/jobOpen/list" aria-label="Previous">&laquo;<span aria-hidden="true"></span></a></li>
				</c:if>
				<c:if test="${paging.curPage ne 1 }">
					<!-- 첫페이지가아닐때 -->
					<li><a class="page-link"
						href="/jobOpen/list?curPage=${paging.curPage-1 }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="page">
					<c:if test="${paging.curPage eq page }">
						<li class="active page-item"><a class="page-link"
							href="/jobOpen/list?curPage=${page }">${page }</a></li>
					</c:if>
					<c:if test="${paging.curPage ne page }">
						<li class="page-item"><a class="page-link"
							href="/jobOpen/list?curPage=${page }">${page }</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지 -->
				<!-- 마지막 페이지라면 금지 표시 -->
				<c:if test="${paging.curPage eq paging.totalPage }">
					<!-- 마지막 페이지일때 -->
					<li class="page-item disabled"><a class="page-link"
						href="/jobOpen/list?curPage=${paging.totalPage }"
						aria-label="Next"><span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<c:if test="${paging.curPage ne paging.endPage }">
					<!-- 마지막 페이지가아닐때 -->
					<li><a class="page-link" href="/jobOpen/list?curPage=${paging.curPage+1 }"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>

			</ul>
	</div>
</div>