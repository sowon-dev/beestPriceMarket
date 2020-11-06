<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>베프마켓 - 친구같은 경매플랫폼</title>

	<!-- 버튼 CSS -->
	<link href="${pageContext.request.contextPath}/resources/css/button-reg_goods.css" rel="stylesheet">
	<!-- 버튼 CSS -->
	
<style type="text/css">
a {color: #333; !important;}	
</style>

</head>
<body>
<%
	String a = "jewelry";
	String b = "digital";
	
%>
  <!-- 헤더 -->
   <jsp:include page="../inc/top.jsp"/>
  <!-- 헤더 -->
  

  <!-- 본문 -->
   <div class="container">

    <div class="row">
    
    
	<!-- 상품 카테고리 메뉴바 사이드로 inc에 넣기 -->
      <div class="col-lg-3">
      
        <a href="/goods/register"><button class="snip1535">내 상품팔기</button></a>
        
        <div class="list-group">
         <a href="/goods/list?category=<%=a%>" class="list-group-item">컴퓨터</a>
          <a href="/goods/list?category=<%=b%>" class="list-group-item">디지털</a>
          <a href="#" class="list-group-item">생활가전</a>
          <a href="#" class="list-group-item">생활문구</a>
          <a href="#" class="list-group-item">생활가구</a>
          <a href="#" class="list-group-item">스포츠</a>
          <a href="#" class="list-group-item">패션의류</a>
          <a href="#" class="list-group-item">패션잡화</a>
          <a href="#" class="list-group-item">화장품</a>
          <a href="#" class="list-group-item">쥬얼리</a> 
        </div>
      </div> 
   <!-- 상품 카테고리 메뉴바 사이드로 inc에 넣기 -->
   
 	<!-- 상품 목록 -->
        <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
 
	<!-- 상품 카드 목록(All) -->
        <div class="row"> 
        <c:forEach var="list" items="${goodsList }" >
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="/goods/detail?gno=${list.gno}">
              	
                 	 <img class="card-img-top" src="http://placehold.it/700x400" alt="">
                  
               	
               </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="/goods/detail?gno=${list.gno}">${list.gname}</a>
                </h4>
                <h6>현재가(50000)</h6>
                <h6>입찰자 0</h6>
                <h6>${list.endDate}</h6>
               
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
        <!-- 상품 카드 목록(All) -->
        
        <!-- 상품 카드 목록(Category) -->
        <div class="row"> 
        <c:forEach var="list2" items="${category }" >
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="/goods/detail?gno=${list2.gno}">
              	
                 	 <img class="card-img-top" src="http://placehold.it/700x400" alt="">
                  
               	
               </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="/goods/detail?gno=${list2.gno}">${list2.gname}</a>
                </h4>
                <h6>현재가(50000)</h6>
                <h6>입찰자 0</h6>
                <h6>${list2.endDate}</h6>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
        <!-- 상품 카드 목록(Category) -->
       
      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- 상품 목록 -->

  </div>
  </div>
 <!-- 본문 -->

  <!-- 푸터 -->
  <jsp:include page="../inc/bottom.jsp"/>
  <!-- 푸터 -->
</body>

</html>