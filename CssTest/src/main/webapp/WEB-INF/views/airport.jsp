<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
     <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
<link rel="stylesheet" href="resources/css/departureboard.css">

<title>Insert title here</title>
<style>
 
body
{
  background-color:#f1f1f2;
}
.tile
{
  width:80%;
  margin:60px auto;
}
.inner{
	position:relative;
}
#tile-1 .tab-pane
{
  padding:15px;
  padding: 15px;
  position: absolute;

  
 
}
#tile-1 .nav-tabs
{
  position:relative;
  border:none!important;
  background-color:#fff;
/*   box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14), 0 1px 5px 0 rgba(0,0,0,0.12), 0 3px 1px -2px rgba(0,0,0,0.2); */
  border-radius:6px;
}
#tile-1 .nav-tabs li
{
  margin:0px!important;
}
#tile-1 .nav-tabs li a
{
  position:relative;
  margin-right:0px!important;
  padding: 20px 40px!important;
  font-size:16px;
  border:none!important;
  color:#333;
}
#tile-1 .nav-tabs a:hover
{
  background-color:#fff!important;
  border:none;
}
#tile-1 .slider
{
  display:inline-block;
  width:30px;
  height:4px;
  border-radius:3px;
  background-color:#39bcd3;
  position:absolute;
  z-index:1200;
  bottom:0;
  transition:all .4s linear;
  
}
#tile-1 .nav-tabs .active
{
  background-color:transparent!important;
  border:none!important;
  color:#39bcd3!important;
}

</style>
<body>




<div class="tile" id="tile-1">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs nav-justified" role="tablist">
    <div class="slider"></div>
     <li class="nav-item">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-home"></i> ICN</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"><i class="fas fa-id-card"></i> GIMPO</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false"><i class="fas fa-map-signs"></i> GIMHAE</a>
      </li>
    <li class="nav-item">
        <a class="nav-link" id="setting-tab" data-toggle="tab" href="#setting" role="tab" aria-controls="setting" aria-selected="false"><i class="fas fa-cogs"></i> JEJU</a>
      </li>
  </ul>
	<div class="inner">
  <!-- Tab panes -->
    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab" style="display:flex; justify-content:center;">
    	<div class="board">
  	<ul class="departures">
    <li class="headers">
      <span class="h-time">Time</span>
      <span class="h-to">TO</span>
      <span class="h-dest">Destination</span>
      <span class="h-airline">Airline</span>
 	  <span class="h-plane">Flight</span>
 	  <span class="h-terminal">Terminal</span>
      <span class="h-gate">Gate</span>
      <span class="h-expt">Delayed</span>
      <span class="h-status">Status</span>
     
    </li>
    
    <c:forEach items="${in}" var="icn" varStatus="status">
    
    <li class="departure">
      <span class="time">${icn.sdtTime}</span>
      <c:choose>
     	 <c:when test="${icn.airport eq null}">
     	  <span class="to">INCHEON</span>
      	</c:when>
      	<c:otherwise>
      		 <span class="to">${icn.airport}</span>
      	</c:otherwise>
      </c:choose>
     <%--  <span class="to">${icn.airport}</span> --%>
     <c:choose>
     	 <c:when test="${icn.arrairport eq null}">
     	  <span class="to">INCHEON</span>
      	</c:when>
      	<c:otherwise>
      		 <span class="dest"><span>${icn.arrairport}</span></span>
      	</c:otherwise>
      </c:choose>
     
     
      <%-- <span class="dest"><span>${icn.arrairport}</span></span> --%>
      
      <span class="airline">${icn.airline}</span>
      <span class="plane">${icn.flightId}</span>
      <c:choose>
       <c:when test="${icn.terminalId eq 'P01'}">
		  <span class="terminal">T1</span>
      </c:when>
	      <c:when test="${icn.terminalId eq 'P02'}">
		  <span class="terminal">B</span>
      </c:when>
	      <c:when test="${icn.terminalId eq 'P03'}">
		  <span class="terminal">T2</span>
      </c:when>
      </c:choose>
      
      
     <%--  <span class="terminal">${icn.terminalId}</span> --%>
      <span class="gate">${icn.gatenumber}</span>
      <span class="expt">${icn.edtTime}</span>
      <span class="status">${icn.remark}</span>
      
     
   	  
    </li>
    </c:forEach> 
	
    <li class="footer">
      <span>Departures</span>
    </li>
  </ul>
 
</div>
    
    </div>
    
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="display:flex; justify-content:center;">
  <div class="board">
  	<ul class="departures">
    <li class="headers">
      <span class="h-time">Time</span>
      <span class="h-to">TO</span>
      <span class="h-dest">Destination</span>
      <span class="h-airline">Airline</span>
 	  <span class="h-plane">Flight</span>
 	  <span class="h-terminal">line</span>
      <span class="h-gate">Gate</span>
      <span class="h-expt">Delayed</span>
      <span class="h-status">Status</span>
     
    </li>
    
    <c:choose>
   		<c:when test="${fn:length(fv)>0}">
    		 <c:forEach items="${fv}" var="fvo" varStatus="status">
			    <c:choose>
			   		 <c:when test="${fvo.boardingEng eq 'GIMPO' or fvo.arrivedEng eq 'GIMPO'}">
			    		<li class="departure">
				      		  <span class="time">${fvo.sdtTime}</span>
					       	  <span class="to">${fvo.boardingEng}</span>
						      <span class="dest"><span>${fvo.arrivedEng}</span></span>
						      <span class="airline">${fvo.airlineEnglish}</span>
						      <span class="plane">${fvo.airFln}</span>
						      <span class="terminal">${fvo.io}</span>
						      <span class="gate">${fvo.gate}</span>
						      <span class="expt">${fvo.edtTime}</span>
						      <span class="status">${fvo.rmkEng}</span>
				    	</li>
			    	</c:when>
				    <c:otherwise>
				   			 <li class="departure">
				    			<span class="test">NO MORE SERVICE</span>
				   			 </li>
				    </c:otherwise>
			    
			    </c:choose>
    
    		</c:forEach>
    	</c:when>
    <c:otherwise>
    	 <li class="no">
			<div class="test" style="ext-align: center;
    color: yellow; font-size: 55px;">NO MORE SERVICE</div>
 		</li>
    </c:otherwise>
    </c:choose>
   
   
    <li class="footer">
      <span>Departures</span>
    </li>
  </ul>
 
</div>
  </div>
  
  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
  <div class="board">
  	<ul class="departures">
    <li class="headers">
      <span class="h-time">Time</span>
      <span class="h-to">TO</span>
      <span class="h-dest">Destination</span>
      <span class="h-airline">Airline</span>
 	  <span class="h-plane">Flight</span>
 	  <span class="h-terminal">line</span>
      <span class="h-gate">Gate</span>
      <span class="h-expt">Delayed</span>
      <span class="h-status">Status</span>
     
    </li>
    
   
    <c:choose>
   		<c:when test="${fn:length(fv)>0}">
    		 <c:forEach items="${fv}" var="fvo" varStatus="status">
			    <c:choose>
			   		 <c:when test="${fvo.boardingEng eq 'GIMHAE' or fvo.arrivedEng eq 'GIMHAE'}">
			    		<li class="departure">
				      		  <span class="time">${fvo.sdtTime}</span>
					       	  <span class="to">${fvo.boardingEng}</span>
						      <span class="dest"><span>${fvo.arrivedEng}</span></span>
						      <span class="airline">${fvo.airlineEnglish}</span>
						      <span class="plane">${fvo.airFln}</span>
						      <span class="terminal">${fvo.io}</span>
						      <span class="gate">${fvo.gate}</span>
						      <span class="expt">${fvo.edtTime}</span>
						      <span class="status">${fvo.rmkEng}</span>
				    	</li>
			    	</c:when>
				    <c:otherwise>
				   			 <li class="departure">
				    			<span >NO MORE SERVICE</span>
				   			 </li>
				    </c:otherwise>
			    
			    </c:choose>
    
    		</c:forEach>
    	</c:when>
    <c:otherwise>
    	 <li class="no">
			<div class="test" style="ext-align: center;
    color: yellow; font-size: 55px;">NO MORE SERVICE</div>
 		</li>
    </c:otherwise>
    </c:choose>
   
   
    <li class="footer">
      <span>Departures/Arrivals</span>
    </li>
  </ul>
 
</div>
  </div>
  
  <div class="tab-pane fade" id="setting" role="tabpanel" aria-labelledby="setting-tab">
  <div class="board">
  	<ul class="departures">
    <li class="headers">
      <span class="h-time">Time</span>
      <span class="h-to">TO</span>
      <span class="h-dest">Destination</span>
      <span class="h-airline">Airline</span>
 	  <span class="h-plane">Flight</span>
 	  <span class="h-terminal">line</span>
      <span class="h-gate">Gate</span>
      <span class="h-expt">Delayed</span>
      <span class="h-status">Status</span>
     
    </li>
    
   
    <c:choose>
   		<c:when test="${fn:length(fv)>0}">
    		 <c:forEach items="${fv}" var="fvo" varStatus="status">
			    <c:choose>
			   		 <c:when test="${fvo.boardingEng eq 'JEJU' or fvo.arrivedEng eq 'JEJU'}">
			    		<li class="departure">
				      		  <span class="time">${fvo.sdtTime}</span>
					       	  <span class="to">${fvo.boardingEng}</span>
						      <span class="dest"><span>${fvo.arrivedEng}</span></span>
						      <span class="airline">${fvo.airlineEnglish}</span>
						      <span class="plane">${fvo.airFln}</span>
						      <span class="terminal">${fvo.io}</span>
						      <span class="gate">${fvo.gate}</span>
						      <span class="expt">${fvo.edtTime}</span>
						      <span class="status">${fvo.rmkEng}</span>
				    	</li>
			    	</c:when>
				    <c:otherwise>
				   			 <li class="departure">
				    			<span class="test">NO MORE SERVICE</span>
				   			 </li>
				    </c:otherwise>
			    
			    </c:choose>
    
    		</c:forEach>
    	</c:when>
    <c:otherwise>
    	 <li class="no">
			<div class="test" style="ext-align: center;
    color: yellow; font-size: 55px;">NO MORE SERVICE</div>
 		</li>
    </c:otherwise>
    </c:choose>
   
   
    <li class="footer">
      <span>Departures</span>
    </li>
  </ul>
 
</div>
  </div>
</div>
</body>
<script>
$("#tile-1 .nav-tabs a").click(function() {
	  var position = $(this).parent().position();
	  var width = $(this).parent().width();
	    $("#tile-1 .slider").css({"left":+ position.left,"width":width});
	});
	var actWidth = $("#tile-1 .nav-tabs").find(".active").parent("li").width();
	var actPosition = $("#tile-1 .nav-tabs .active").position();
	$("#tile-1 .slider").css({"left":+ actPosition.left,"width": actWidth});

	depMessage = document.querySelectorAll('.departure .message');

	// https://developer.mozilla.org/en-US/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements
	// https://developer.mozilla.org/en-US/docs/Web/API/Element/animate

	for (i = 0; i < depMessage.length; i++) {
	  fade_in(depMessage[i]); // fade-in is fine
	  // but text-scroll needs a delay (1s or so) before the first iteration begins.
	  text_scroll(depMessage[i], depMessage[i].scrollWidth*14);
	}

	function text_scroll(el, dur = 1250) {
	  // Scroll the text from right to left
	  el.animate([
	    {transform: 'translateX('+ (el.scrollWidth) +'px)'},
	    {transform: 'translateX(-'+ (el.scrollWidth * 1.05) +'px)'},
	  ], {
	    id: 'text-scroll',
	    // duration: el.scrollWidth * 14,
	    duration: el.scrollWidth * 18,
	    easing: 'linear',
	    iterations: Infinity
	  });
	}

	function fade_in(el, dur = 850) {
	  el.animate(
	    [
	      {opacity: 0},
	      {opacity: 1},
	    ],
	    {
	      id: 'fade-in',
	      duration: dur,
	      easing: 'linear',
	      fill: 'forwards', // == animation-fill-mode: forwards;
	      iterations: 1
	    }
	  );
	}


	// Long destination name handling
	// Not sure how departure boards actually handle it. I think it scrolls to just display the end of the text and then snaps back after a moment. Check 'Worcester Foregate Street' next time I'm at a station.
	// Is there a difference between the larger boards and the platform boards? I think the larger boards just split it onto multiple lines?
	// For scrolling behaviour, add `white-space: nowrap; overflow: hidden;` to .dest. Remove if scrolling is unwanted.
	
	depDest      = document.querySelectorAll('.departure .dest');
	
	
	depDestInner = document.querySelectorAll('.departure .dest span'); // alternative to defining it in the loop as depDest.querySelector('span'). this is perhaps less safe.
	
	// .clientWidth vs. .scrollWidth?
	for (i = 0; i < depDest.length; i++) {
	  console.log('outer width: ' + depDest[i].clientWidth + '   inner width: ' + depDestInner[i].clientWidth);
	  if (depDestInner[i].clientWidth > depDest[i].clientWidth) {
	    text_scroll(depDestInner[i], depDestInner[i].clientWidth*14);
	  }
	}
	
	

	
	//console.log("${in}")
	console.log("${fv}")
	
	</script>
</html>