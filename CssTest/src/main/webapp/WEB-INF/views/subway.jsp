<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 자바스크립트 -->
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.7.1.min.js"></script> 
<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/subway.css">
<html>

<div class = "wrapper pre">
  
</div>

  <div class="container">
    <div class="card tabs">
      <input id="tab-1" type="radio" class="tab tab-selector" checked="checked" name="tab" />
      <label for="tab-1" class="tab tab-primary">INCHEON</label>
      <input id="tab-2" type="radio" class="tab tab-selector" name="tab" />
      <label for="tab-2" class="tab tab-success">GIMPO</label>
      <input id="tab-3" type="radio" class="tab tab-selector" name="tab" />
      <label for="tab-3" class="tab tab-default">GIMHAE</label>
<!--       <input id="tab-4" type="radio" class="tab tab-selector" name="tab" />
      <label for="tab-4" class="tab tab-warning">Published</label> -->
      <div class="tabsShadow"></div>
<!--       <div class="glider"></div> -->
      <section class="content">
        <div class="item" id="content-1">
          <h2 class="tab-title tab-primary">인천공항 공항철도</h2>
          <p>
            <img src="<%=request.getContextPath() %>/resources/img/airport/subway_icn.png">
          </p>
        </div>
        <div class="item" id="content-2">
          <h2 class="tab-title tab-success">지하철 5호선</h2>
          <p>
            <img src="<%=request.getContextPath() %>/resources/img/airport/subway_po5.png">
          </p>
          <h2 class="tab-title tab-success">지하철 9호선</h2>
          <p>
            <img src="<%=request.getContextPath() %>/resources/img/airport/subway_po9.png">
          </p>
            <h2 class="tab-title tab-success">김포공항 공항철도</h2>
          <p>
            <img src="<%=request.getContextPath() %>/resources/img/airport/subway_po_airportsub.png">
          </p>
            <h2 class="tab-title tab-success">김포골드</h2>
          <p>
            <img src="<%=request.getContextPath() %>/resources/img/airport/subway_po_gold.png">
          </p>
		  
        </div>
        <div class="item" id="content-3">
          <h2 class="tab-title tab-default">부산지하철 노선도</h2>
          <p>
            <img src="<%=request.getContextPath() %>/resources/img/airport/subway_busan.png">
		  </p>       
		</div>
        <div class="item" id="content-4">
          <h2 class="tab-title tab-warning">Tab 4</h2>
          <p>
            <span class = "numit">4</span> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
        </div>
      </section>

    </div>
  </div>
</div>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    // 각 탭이 선택되었을 때 content 높이를 조정하는 함수
    function adjustContentHeight() {
      // 선택된 탭의 콘텐츠를 찾음
      const activeContent = document.querySelector(".content .item[style*='visible']");
      
      if (activeContent) {
        const contentContainer = document.querySelector('.content');
        // 선택된 콘텐츠의 높이를 측정
        const contentHeight = activeContent.offsetHeight;
        // content 요소의 높이를 선택된 콘텐츠의 높이로 설정
        contentContainer.style.height = contentHeight + 'px';
      }
    }

    // 각 탭의 클릭 이벤트 리스너 설정
    document.querySelectorAll(".tab-selector").forEach(tab => {
      tab.addEventListener("change", adjustContentHeight);
    });

    // 초기 설정 - 첫 번째 탭의 콘텐츠 높이로 설정
    adjustContentHeight();
  });
</script>
</html>