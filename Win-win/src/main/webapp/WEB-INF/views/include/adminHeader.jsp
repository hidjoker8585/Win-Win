<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</head>
<body>

<div class="container">
	<div>	
		<div class="text-right">
			<a href="/admin/adminLogout"><span class="badge badge-pill badge-primary mt-3 " style="background-color: #376092">로그아웃</span></a>
		</div>
		
		<p class="font-weight-bold h1"><a href="/main/adminmain" style="color:black; text-decoration: none">WIN-WIN</a></p>
		
		<ul class="nav justify-content-end mb-2" >	
		  <li class="nav-item">
		    <div class="font-weight-bold ml-3" style="cursor: pointer"><a href="/support/list" style="text-decoration: none; color: black;">지원현황</a></div>
		  </li>
		  <li class="nav-item">
		    <div class="font-weight-bold ml-3" style="cursor: pointer"><a href="/admin/chart" style="text-decoration: none; color: black;">통계관리</a></div>
		  </li>
		  <li class="nav-item">
		    <div class="font-weight-bold ml-3" style="cursor: pointer"><a href="/result/list" style="text-decoration: none; color: black;">지원결과관리</a></div>
		  </li>
		  <li class="nav-item">
		    <div class="font-weight-bold ml-3" style="cursor: pointer"><a href="/notice/list" style="text-decoration: none; color: black;">공지사항관리</a></div>
		  </li>
		  <li class="nav-item">
		    <div class="font-weight-bold ml-3" style="cursor: pointer"><a href="/jobOpen/manage" style="text-decoration: none; color: black;">채용공고관리</a></div>
		  </li>
		  <li class="nav-item">
		    <div class="font-weight-bold ml-3" style="cursor: pointer"><a href="/qna/list" style="text-decoration: none; color: black;">문의사항관리</a></div>
		  </li>
		</ul>
		
		<div style="height:5px; background-color: #376092" ></div>
	</div>
</div>

