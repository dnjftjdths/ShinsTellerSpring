<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>상품 상세(${ product.prdname })</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.png">
		
		<!-- all css here -->
        <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
         
        <link rel="stylesheet" href="/resources/assets/css/bundle.css">
        <link rel="stylesheet" href="/resources/assets/css/plugins.css">
        <link rel="stylesheet" href="/resources/assets/css/productstyle.css">
        <link rel="stylesheet" href="/resources/assets/css/productresponsive.css">
        <script src="/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
    
    	<%-- <div style="background-color: skyblue;">
    	상품번호 : ${ product.prdno }<br>
    	제목 : ${ product.prdtitle }<br>
    	상품명 : ${ product.prdname }<br>
    	가격 : ${ product.price }<br>
    	브랜드 : ${ product.brand }<br>
    	제조사/원산지 : ${ product.manufacturer }<br>
    	대분류 : ${ product.category1 }<br>
    	소분류 : ${ product.category2 }<br>
    	vod명 : ${ product.vod_name }
        </div>  --%>  
		
        <nav class="navbar navbar-light fixed-top detail_top_bar">
        <button type="button" class="prdBtn" onclick="javascript:history.back();"><img src="/resources/assets/img/product/prdBackBtn.png" /></button>
  		<div class="top_bar_name">상품상세</div><!-- 네비게이션 바의 콘텐츠 -->
		<button type="button" class="prdBtn"><img src="/resources/assets/img/product/prdSearchBtn.png" /></button>
		<button type="button" class="prdBtn"><img src="/resources/assets/img/product/prdCartBtn.png" /></button>
		</nav>
		
		<div class="product_category">
         	홈 > ${ product.category1 } > ${ product.category2 }
         </div>
         <div class="product_broadInfo">
         	<button type="button" class="broadBtn">
         	<img src="/resources/assets/img/product/bellBtn.png" />
         	방송알림신청
         	</button>
         </div>
        <!--product details start-->
                <!--baner slide show-->
        
        <div class="banner_slide_show slide_show_two mb-40">
            <div class="container">
                <div class="row">
                    <div class="col-12 product_body">
                        <div class="banner_slider">
                            <div class="slider_active slider_a_four owl-carousel">
                                <div class="single_slider single_sl_four">
                                	<img class="prdimg" src="/resources/assets/img/product/${ product.prdname }12.jpg" />
                                	<div class="view_img view_video">
                                            <a href="javascript: goVideoPage('${ product.vod_name }', '${ product.prdtitle }', ${ product.price });" ><img src="/resources/assets/img/product/playbtn.png"  /></a>
                                    </div>
                                </div>
                                <div class="single_slider single_sl_four">
                                	<img src="/resources/images/${ product.prdname }2.jpg" />
                                	<div class="view_img view_video">
                                            <a href="javascript: goVideoPage('${ product.vod_name }', '${ product.prdtitle }', ${ product.price });" ><img src="/resources/assets/img/product/playbtn.png"  /></a>
                                    </div>
                                </div>
                                <div class="single_slider single_sl_four">
                                	<img src="/resources/images/${ product.prdname }3.jpg" />
                                	<div class="view_img view_video">
                                            <a href="javascript: goVideoPage('${ product.vod_name }', '${ product.prdtitle }', ${ product.price });" ><img src="/resources/assets/img/product/playbtn.png"  /></a>
                                    </div>
                                </div>
                                <div class="single_slider single_sl_four">
                                	<img src="/resources/images/${ product.prdname }4.jpg" />
                                	<div class="view_img view_video">
                                            <a href="javascript: goVideoPage('${ product.vod_name }', '${ product.prdtitle }', ${ product.price });" ><img src="/resources/assets/img/product/playbtn.png"  /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        	
		<div class="sticker">
				<a class="circle"></a>
			</div>
        
<script type="text/javascript">
function goVideoPage(videoName, title, price) {
	if(videoName == "GentHommeVOD" || videoName == "ChesterPantsVOD") {
	
	$.ajax({
			url  : "/videoTimeStamp.sst" , 
			type : "post" , 
			data : {videoName : videoName } ,
			dataType : "text" , 
			success : function(timeStamp) {
				//console.log(timeStamp);
				window.goVideo.getVideoPath(videoName, title, price, timeStamp);
				//location.href = "/video.sst?videoName="+videoName;
			}
		});
	alert(videoName + ', ' + title + ', ' + price);
	}
}

</script>
        
        
        
        <!--baner slide end-->
        <div class="product_details">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-6">
                        <div class="product_d_right">
                            <h1><span style="color: #ea3a3c; padding-right: 10px;">[TV쇼핑]</span> ${ product.prdtitle }</h1>
                            <div class="small_product_price mb-15">
                                <span class="new_price"> <fmt:formatNumber value="${ product.price }" pattern="#,###" /></span>원
                                <span class="old_price"> <fmt:formatNumber value="${ product.price + 1000 }" pattern="#,###" /></span>원&nbsp;
                                <img src="/resources/assets/img/product/questionMark.png" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--product details end-->
        
        <div class="share_choose_tap">
        	<div class="share_tap"><img src="/resources/assets/img/product/shareBtn.png" />공유하기</div>
        	<span class="seperate">|</span>
        	<div class="choose_tap"><img src="/resources/assets/img/product/chooseBtn.png" />찜하기</div>
        </div>
        
        <div class="bonus_service_tap">
        	<div class="card_shipping_tap" style="border-bottom: 1px solid #e5e5e5;">
        	<img class="iconimg" src="/resources/assets/img/product/cardIcon.png"/>무이자 할부 카드 확인
        	<img class="detailimg" src="/resources/assets/img/product/cardDetailBtn.png" />
        	</div>
        	<div class="card_shipping_tap">
        	<img class="iconimg" src="/resources/assets/img/product/ShippingIcon.png"/>무료배송/ 평균 배송일 3일
        	<img class="detailimg" src="/resources/assets/img/product/shippingDetail.png" />
        	</div>
        	<img src="/resources/assets/img/product/bonusService1.jpg" />
        	<img src="/resources/assets/img/product/bonusService2.jpg" />
        </div>
        <!--product details tab-->
        <div class="product_details_tab mb-40" style="display: inline-block; width:100%">
            <div class="container">
                <div class="row">
                    <div class="col-12 product_body">
                        <div class="product_details_tab_inner"> 
                            <div class="product_details_tab_button">    
                                <ul class="nav" role="tablist">
                                    <li >
                                        <a class="nav-link active" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">상품정보</a>
                                    </li>
                                    <li>
                                         <a class="nav-link" data-toggle="tab" href="#sheet" role="tab" aria-controls="sheet" aria-selected="false">구매정보</a>
                                    </li>
                                    <li>
                                       <a class="nav-link button_three" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">상품평</a>
                                    </li>
                                    <li>
                                       <a class="nav-link button_three" data-toggle="tab" href="#qAnda" role="tab" aria-controls="qAnda" aria-selected="false">Q&A</a>
                                    </li>
                                </ul>
                            </div> 
                            <div class="tab-content product_details_content">
                                <div class="tab-pane fade show active" id="info" role="tabpanel" >
                                    <div class="product_d_tab_content">
                                    	<c:forEach var="i" begin="1" end="24">
											<img src="/resources/assets/img/product/${ product.prdname }Detail${i}.jpg" alt=""/>
										</c:forEach>
                                    </div>    
                                </div>
                                <div class="tab-pane fade" id="sheet" role="tabpanel">
                                    <div class="product_d_tab_content">
                                    <div class="product_d_table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="first_child">상품번호</td>
                                                    <td><strong>${ product.prdno }</strong></td>
                                                </tr>
                                                <tr>
                                                    <td class="first_child">브랜드</td>
                                                    <td>${ product.brand }</td>
                                                </tr>
                                                <tr>
                                                    <td class="first_child">제조사/원산지</td>
                                                    <td>${ product.manufacturer }</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    </div> 
                                </div>
                                <div class="tab-pane fade" id="reviews" role="tabpanel">
                                    <div class="product_d_tab_content_inner">
                                        <div class="product_d_tab_content_item">
                                        <div class="reviewWrite">
                                        	<img src="/resources/assets/img/product/reviewWriteBtn.png" /> 상품평쓰기
                                        </div>
                                        <div class="row">
                                            <div class="samll_product_ratting">
                                            <span class="ratting_number">8.0</span>
                                            <ul>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="comment_form" href="#"><i class="fa fa-star"></i></a></li>
                                            </ul>
                                            </div>
                                            <div class="samll_product_ratting_left">
                                            <span class="left_name">품질</span>
                                            <ul>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star comment_form" href="#"><i class="fa fa-star"></i></a></li>
                                            </ul>
                                            <br>
                                            <span class="left_name">가격</span>
                                            <ul>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star comment_form" href="#"><i class="fa fa-star"></i></a></li>
                                            </ul><br>
                                            <span class="left_name">포장</span>
                                            <ul>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star comment_form" href="#"><i class="fa fa-star"></i></a></li>
                                            </ul><br>
                                            <span class="left_name">배송기간</span>
                                            <ul>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star" href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a class="left_star comment_form" href="#"><i class="fa fa-star"></i></a></li>
                                            </ul><br>
                                            </div>
                                         </div>    
                                    </div>          
                                </div>
                            </div>
                            <div class="tab-pane fade" id="qAnda" role="tabpanel">
                                    <div class="product_d_tab_content">
                                    	<div class="QnAcontent">
                                    	상품에 대한 궁금한 점을 물어보세요.<br>
										상품 문의  외에 결제, 배송, 교환, 반품문의는 고객센터 1:1 문의하기를 이용하시기 바랍니다.
										</div>
										<div class="row QnABtndiv">
										<div class="QnABtns">반품/배송 기타문의</div>
										<div class="QnABtns">상품문의</div>
										</div>
                                    </div> 
                                </div>  

                        </div>
                    </div>   
                        
                </div>
            </div>
        </div>
        </div>
        <!--product details tab end-->
	
		<!-- all js here -->
        <script src="/resources/assets/js/vendor/jquery-1.12.0.min.js"></script>
        <script src="/resources/assets/js/popper.js"></script>
        <script src="/resources/assets/js/bootstrap.min.js"></script>
        <script src="/resources/assets/js/plugins.js"></script>
        <script src="/resources/assets/js/product.js"></script>
    </body>
</html>
