<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  	<!-- Brand -->
  	<a class="navbar-brand" href="#">Navbar</a>

  	<!-- Toggler/collapsibe Button -->
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    	<span class="navbar-toggler-icon"></span>
  	</button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
      	<button onclick="getCurTime()" type="button">현재 동영상 시간</button>
      </li>
      <li class="nav-item">
      	<button onclick="setCurTime(10)" type="button">10분으로 이동</button>
      </li>
      
      <li class="nav-item">
      	<a href="#" onclick="setCurTime(15)">15분으로 이동</a>
      </li>
    </ul>
  </div> 
</nav>

	<button onclick="getCurTime()" type="button">Get current time position</button>
	<button onclick="setCurTime(10)" type="button">Set time position to 10 minutes</button><br> 
	<button onclick="showTimestmp()" type="button">Show TimeStmp</button>
	
	<div style="position:relative; z-index: 1;">
	<video id="myVideo" width="600" controls autoplay loop>
  		<source src="/resources/assets/video/09-1.mp4" type="video/mp4">
	</video></div>

	<div style="position:relative; top: 5px; left: 5px;z-index: 2;">
		<button onclick="setCurTime(10)" type="button">10분</button>
	</div>
	<script>
		var list1 = new Array();
	 
		<c:forEach items="${timestamp}" var="time">
			list1.push("${time}");
		</c:forEach>
	
		var str = "";
		function showTimestmp() {
			for (var i = 0; i < list1.length; i++) {
			    str += list1[i];
			}
			alert(str);
		}
		
		var vid = document.getElementById("myVideo");

		function getCurTime() { 
  		alert(vid.currentTime);
		} 

		function setCurTime(minute) { 
  		vid.currentTime=60 * minute;
		} 
</script> 
</body>
</html>

