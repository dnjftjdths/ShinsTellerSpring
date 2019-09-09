<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
 <head>
 <meta charset="utf-8">
  <title>Video with markers</title>
 	
   <link href="/resources/assets/css/video-js.css" rel="stylesheet">
   <!-- <link href="http://vjs.zencdn.net/7.6.0/video-js.css" rel="stylesheet"> -->
   <!-- <link href="/resources/assets/to/videojs.markers.css" rel="stylesheet"> -->
   <link href="/resources/assets/to/videojs.markers22222.css" rel="stylesheet">

  <!-- If you'd like to support IE8 (for Video.js versions prior to v7) -->
  <script src="https://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>

</head>


 <body marginheight="0px" marginwidth="0px">
 
 <div style="background-color: black; text-align: center;" > <!-- 452px  width="82%"-->
   <!-- video 이름 : GentHommeVOD, ChesterPantsVOD -->
   <!-- poster="/resources/vod/${videoName}_pic.jpg" -->
   <!--  src="/resources/vod/${videoName}.mp4" -->
   <video id="video" 
   preload="auto" autoplay="false" class="video-js vjs-default-skin"
   controls
   style="object-fit:fill; width: 980px; height: 452px; " poster="/resources/vod/${videoName}_pic.jpg" >
   <source src="/resources/vod/${videoName}.mp4" type="video/mp4" />

 </video>
 
<!--    <video id="demo" controls preload="auto" autoplay="false" class="video-js vjs-default-skin" >
   <source src="/resources/vod/${videoName}.mp4" type="video/mp4" />
 </video> -->
</div>
 
<script src="http://code.jquery.com/jquery-2.0.3.min.js"> </script>
<script src="http://vjs.zencdn.net/7.3.0/video.js"></script>
<!-- <script src="/resources/assets/to/videojs-markers.js"></script> -->
<script src="/resources/assets/to/videojs-markers-original.js"></script>
 <script type="text/javascript"> 
 
 var vid = document.getElementById("video");

 $(document).ready(function() {
  $('html, body').css({'overflow': 'hidden' });//, 'height': '100%'
  $('#element').on('scroll touchmove mousewheel', function(event) {
    event.preventDefault();
    event.stopPropagation();
    return false;
  });
  
  //vid.play();
  //vid.webkitRequestFullscreen();
 });

 function setTime(time) {
  vid.currentTime = time;
 }
 
  function setTimeStamp(timeAry) {
	  
	  //alert(timeAry);
	  arr = [];
	  //timeAry = [45.4,879.7,912]
	  for(var i in timeAry){
	   arr.push({
	  	 "time": timeAry[i]
	  	 });
	  }
	  
	  $(".vjs-tip").remove();
	  player.markers.reset(arr);
	  player.pause();
	  
 	//alert(arr.length);
 } 

 function getAllResult(videoName) {
 	$.ajax({
 			url  : "/videoTimeStampAll.sst" , 
 			type : "get" , 
 			data : {videoName : videoName} ,
 			dataType : "text" , 
 			success : function(timeStamp) {
 				//console.log(timeStamp);
 				window.goStt.gettSttResult(timeStamp);
 				//alert(timeStamp);
 				//location.href = "/video.sst?videoName="+videoName;
 			}
 		});
 	
 }

 function getSttResult(videoName, record) {
 	$.ajax({
 			url  : "/voice.sst" , 
 			type : "get" , 
 			data : {videoName : videoName, record : record} ,
 			dataType : "text" , 
 			success : function(timeStamp) {
 				//console.log(timeStamp);
 				window.goStt.gettSttResult(timeStamp);
 				//alert(timeStamp);	
 				//location.href = "/video.sst?videoName="+videoName;
 			}
 		});
 		
 }

         

         
var player = videojs('video', {nativeControlsForTouch: false} );

 
$(document).ready(function(){
	loadThirdDemo();
	
});
 
 
 
function loadThirdDemo() {
    //var player = videojs('video');
 
    
    player.markers({
       breakOverlay:{
          display: true
       },
       onMarkerClick: function(marker){
    	   //alert(marker.time);
          //player.currentTime = marker.time;
       },
       onMarkerReached: function(marker){
         // $('.dynamic-demo-events').append('<li class="list-group-item">Marker reached: '+marker.time+'</li>');
       },
       markers: []
    });

 
 }
 
  
 </script>

</body>

</html>