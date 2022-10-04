<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


</head>
<body>

<div class="container">
	<div>
	
	    <c:if test="${empty login }">
		<div class="text-right">
			<a href="/user/login"><span class="badge badge-pill badge-primary mt-3 " style="background-color: #376092">로그인</span></a>
			<a href="/user/join"><span class="badge badge-pill badge-primary mt-3" style="background-color: #376092">회원가입</span></a>
		</div>
		</c:if>
		
		<c:if test="${login }">
		<div class="text-right">
			<a href="/user/logout"><span class="badge badge-pill badge-primary mt-3 " style="background-color: #376092">로그아웃</span></a>
		</div>
		</c:if>
		
	    <p class="font-weight-bold h1"><a href="/main/usermain" style="color:black; text-decoration: none">WIN-WIN</a></p>
		<ul class="nav justify-content-end mb-2" >	
		  <li class="nav-item" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
		    <div class="font-weight-bold ml-3" style="cursor: pointer">채용정보</div>
		  </li>
		  <li class="nav-item" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
		    <div class="font-weight-bold ml-3" style="cursor: pointer">입사지원</div>
		  </li>
		  <li class="nav-item" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
		    <div class="font-weight-bold ml-3" style="cursor: pointer">채용문의</div>
		  </li>
		</ul>
		
			<div class="pos-f-t">
			  <div class="collapse" id="navbarToggleExternalContent">
				<ul class="nav justify-content-end mb-1">
					<li class="nav-item ml-4 font-weight-bold text-black-50" style="font-size: 13px"><a href="/notice/list" style="text-decoration: none; color: gray; padding-left: 1px">공지사항</a></li>
					<li class="nav-item ml-4 font-weight-bold text-black-50" style="font-size: 13px"><a href="/applyMenu/selectApply" style="text-decoration: none; color: gray; padding-left: 1px">입사지원</a></li>
					<li class="nav-item ml-4 font-weight-bold text-black-50" style="font-size: 13px"><a href="/qna/list" style="text-decoration: none; color: gray; padding-left: 1px">문의사항</a></li>
				</ul>
				<ul class="nav justify-content-end mb-2">
					<li class="nav-item ml-4  font-weight-bold text-black-50" style="font-size: 13px"><a href="/jobOpen/list" style="text-decoration: none; color: gray; padding-left: 2px">채용공고</a></li>
					<li class="nav-item ml-4  font-weight-bold text-black-50 mr-xl-5" style="font-size: 13px"><a href="/applyMenu/passfail" style="text-decoration: none; color: gray; padding-right: 5px;">결과확인</a></li>
					<li class="mr-4"></li>
				</ul>
			  </div>	  
			
				<div style="height:5px; background-color: #376092" ></div>
		
		</div>
		
	</div>	
</div>

