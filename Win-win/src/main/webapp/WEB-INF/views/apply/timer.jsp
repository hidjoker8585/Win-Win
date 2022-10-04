<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	var tid;
	var cnt = 300;//초기값(초단위)
	
	counter_init();
	
	function counter_init() {
		tid = setInterval(function counter_run() {
			document.all.counter.innerText = time_format(cnt);
			cnt--;
			console.log(cnt);
			if(cnt < 0) {
				clearInterval(tid);
				self.location = "logout.php";
			}
		}, 1000);
	}
	
	
		$("#timer").click(function(){
			
				clearInterval(tid);
				cnt = parseInt(300);
				counter_init();
			
		});
	
	function time_format(s) {
		var nHour=0;
		var nMin=0;
		var nSec=0;
		if(s>0) {
			nMin = parseInt(s/60);
			nSec = s%60;

			if(nMin>60) {
				nHour = parseInt(nMin/60);
				nMin = nMin%60;
			}
		} 
		if(nSec<10) nSec = "0"+nSec;
		if(nMin<10) nMin = "0"+nMin;

		return ""+nHour+":"+nMin+":"+nSec;
	}

	
});
</script>

</head>
<body>
<h1>메인페이지</h1>
<hr>

<c:if test="${empty login }">
<button id="btnLogin">로그인</button>
<br>
</c:if>


<h4>${id } 님 로그인하셨습니다.</h4>
<span id="counter"> </span> 후 자동로그아웃
<br>
<button id="timer">연장</button>
<button id="btnLogout">로그아웃</button>


</body>
</html>


