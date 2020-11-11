<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- 버튼 CSS -->
<link href="${pageContext.request.contextPath}/resources/css/button-reg_goods.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
<!-- 버튼 CSS -->
<link href="${pageContext.request.contextPath}/resources/css/button-reg_goods.css" rel="stylesheet">
<!-- 버튼 CSS -->
</head>
<body>
<!-- 헤더 -->
 <jsp:include page="./inc/top.jsp"/>
<!-- 헤더 -->

<!-- Page Content -->
<div class="container">
	<div class="row">

	<!-- 상품 카테고리 메뉴바 -->
	<div class="col-lg-3">
		<c:if test="${memVO.id != null}">
		  <h2 class="my-4">${memVO.username}님<br>환영합니다😀</h2>
		  <a href="/goods/register"><button class="snip1535">내 상품팔기</button></a>
		</c:if>
	
		<c:if test="${memVO.id == null}">
		  <h2 class="my-4">카테고리</h2>
		</c:if>
      
        <div class="list-group">
          <a href="/goods/list?category=컴퓨터" class="list-group-item">컴퓨터</a>
          <a href="/goods/list?category=디지털" class="list-group-item">디지털</a>
          <a href="/goods/list?category=생활가전" class="list-group-item">생활가전</a>
          <a href="/goods/list?category=생활문구" class="list-group-item">생활문구</a>
          <a href="/goods/list?category=생활가구" class="list-group-item">생활가구</a>
          <a href="/goods/list?category=스포츠" class="list-group-item">스포츠</a>
          <a href="/goods/list?category=패션의류" class="list-group-item">패션의류</a>
          <a href="/goods/list?category=패션잡화" class="list-group-item">패션잡화</a>
          <a href="/goods/list?category=화장품" class="list-group-item">화장품</a>
          <a href="/goods/list?category=쥬얼리" class="list-group-item">쥬얼리</a> 
        </div>
	</div> <!-- 상품 카테고리 메뉴바 끝-->

	<div class="col-lg-9">
		<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <!-- 상품 카드 목록(Category) -->
		<div class="row"> 
			<c:forEach var="category" items="${goodsList}" >
				<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
				<a href="/goods/detail?gno=${category.gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}">
					<img src="<c:url value="/imgUpload/${category.thumbnail}"/>" width="410px" height="200px" class="card-img-top"/> 
				</a>
				<div class="card-body">
			  		<h4 class="card-title">
			    		<a href="/goods/detail?gno=${category.gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}">${category.gname}</a>
					</h4>
					
					<h6>현재가(50000)</h6>
					<h6>입찰자 0</h6>
					<h6>${category.endDate}</h6>
			    </div>
			  	</div>
				</div>
			</c:forEach>
        </div>
     	<!-- 상품 카드 목록(Category) 끝-->
        
        <!-- 페이징 하단부 처리(카테고리목록) -->
		<ul class="pagination justify-content-center">
		 	<!-- 이전 -->
			<c:if test="${pm.prev}">
   				<li class="page-item">
   					<a class="page-link" href="/main?page=${pm.startPage-1}">&laquo;</a>
   				</li>
			</c:if>	
   			
			<!-- 페이지 번호 -->	
   		  	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
				<li class="page-item" ${pm.cri.page == idx? 'class=active':''}>
					<a class="page-link" href="/main?page=${idx}">${idx}</a>
				</li>		
		  	</c:forEach>     
   			
   		 	<!-- 다음 -->
   		  	<c:if test="${pm.next && pm.endPage > 0}">	
   				<li class="page-item">
   			  		<a class="page-link" href="/main?page=${pm.endPage+1}">&raquo;</a>
   				</li>
   		  	</c:if>	
   		  	
		</ul>
        <!-- 페이징 하단부 처리(카테고리목록) 끝 -->

      </div><!-- /.col-lg-9 -->
    </div><!-- /.row -->
  </div><!-- /.container -->

<!-- 푸터 -->
<jsp:include page="./inc/bottom.jsp"/>
<!-- 푸터 -->
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

