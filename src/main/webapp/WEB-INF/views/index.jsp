<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shin's Teller :: TV쇼핑의 새로운 시작 - 빅데이터 하이라이트 추천 </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		
		<!-- all css here -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		    <link rel="stylesheet" href="/resources/assets/css/main.css">
		    <link rel="stylesheet" href="/resources/assets/css/wave.css">
        <link rel="stylesheet" href="/resources/assets/css/navbar.css">
        <script src="/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
		
    	<div class="fixed-top" data-toggle="affix">
		    <div class="navbar navbar-expand-sm" id="first">
		        <div class="navbar-brand">
		        	<a href="#">
			        	<img src="/resources/assets/img/logo/logo_white.png" alt="ShinsTeller">
			        </a>
		        </div>
		        <div class="toggler text-white">
		        	<a class="navbar-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		        		<i class="material-icons">menu</i>
		        	</a>
		        </div>
		        <div class="navbar-collapse collapse ml-auto">
		            <ul class="nav navbar-nav">
		                <li class="nav-item "><a href="#" class="nav-link">소개</a>
		                </li>
		                <li class="nav-item"><a href="#" class="nav-link">바로가기</a>
		                </li>
		            </ul>
		        </div>
		    </div>
		    <div class="navbar navbar-expand pl-2" id="second">
		    	<form class="" action="">
				  <input type="search">
				  <i class="fa material-icons">
					search
				  </i>
				</form>
				<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
					<li class="nav-item">
			        	<a class="nav-link" href="#">신스텔러 소개</a>
			      	</li>
					<li class="nav-item">
			        	<a class="nav-link" href="#">오싹한LIVE</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="#">싸군딜</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="#">베스트</a>
			      	</li>
			    </ul>
			</div>
		</div>
		<!-- 슬라이드파트 -->
		

		<div class="slideshow-container">
			<div class="mySlides fade">
			  <div class="numbertext">1 / 3</div>
			  <img src="/resources/assets/img/banner_01.png" style="width:100%">
			  <!-- <div class="text">Caption Text</div> -->
			</div>
			
			<div class="mySlides fade">
			  <div class="numbertext">2 / 3</div>
			  <img src="/resources/assets/img/banner_02.png" style="width:100%">
			  <!-- <div class="text">Caption Two</div> -->
			</div>
			
			<div class="mySlides fade">
			  <div class="numbertext">3 / 3</div>
			  <img src="/resources/assets/img/banner_03.png" style="width:100%">
			  <!-- <div class="text">Caption Three</div> -->
			</div>
		</div>
			<div style="text-align:center">
			  <span class="dot"></span> 
			  <span class="dot"></span> 
			  <span class="dot"></span> 
			</div>
		
    	<section>
    		<div class="container">
    			<c:forEach items="${ products }" var="index" varStatus="status">
    				
    				<c:set var="counter" value="${status.index}"  />
    				<c:if test="${ 0 eq counter % 3 }">
    					<div class="row">
    				</c:if>
					<div class="col-md-4 card" >
						<a href="/product.sst?prdno=${index.prdno}">
							<img src="/resources/images/${index.prdname}1.jpg" class="card-img-top" alt="...">	
						</a>
						
					  <div class="card-body">
					  	<div class="onair_time">
					  <c:if test="${status.index == 0 || status.index == 1 }">
						  <i>ON-AIR</i>
						  </c:if>
					  	<span style="color: #ea3a3c; padding-right: 10px;">[TV쇼핑]</span>
						</div>
					    <h5 class="card-title">${ index.prdtitle }</h5>
					    <div class="btn-line">
					    	<a class="btn round-btn">
						    	<i class="material-icons heart-btn">favorite</i>
						    </a>
						    <a class="btn round-btn cart">
						    	<i class="material-icons cart-btn">shopping_cart</i>
						    </a>	
					    </div>
					    <span class="card-text" id="price">
							${ index.price } </span>원
					  </div>
					</div>
					<c:if test="${ 2 eq counter%3 }">
    					</div>
    				</c:if>
				</c:forEach>
				
			</div>
			
			<a href="#" id="scrollUp" class="scrollUp">
				<i class="material-icons">keyboard_arrow_up</i>
			</a>

			
			<div class="sticker">
				<a class="circle"></a>
			</div>
			
    	</section>
			<div class='box'>
				<div class='wave -one'></div>
				<div class='wave -two'></div>
				<div class='wave -three'></div>
				<div class='title'>ShinsTeller</div>
			</div>
    	
    	
		
		
		<!-- all js here -->
		
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="/resources/assets/js/main.js"></script>
		<script src="/resources/assets/js/scrollnav.js"></script>        
    </body>
</html>
