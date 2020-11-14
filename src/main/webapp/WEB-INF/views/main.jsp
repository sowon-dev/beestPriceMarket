<%-- <%@ page session="false" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- 버튼 CSS -->
<link href="${pageContext.request.contextPath}/resources/css/button-reg_goods.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
<!-- 옵션바 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/optionBar.css">
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
		  <c:if test="${memVO.block == 0}">
		  	<a href="/goods/register"><button class="snip1535">내 상품팔기</button></a>
		  </c:if>
		</c:if>
		
		<!-- 재원 -->
		<div>검색</div>
	
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

          <!-- 슬라이드(입찰수기준) -->
          <div class="carousel-inner" role="listbox" style="height:350px;background-color:gainsboro;">
            <div class="carousel-item active">
            	<a href="/goods/detail?gno=${top3goods[0].gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}">
					<img class="d-block img-fluid" src="<c:url value="/imgUpload/${top3goods[0].thumbnail}"/>" style="margin:0 auto;object-fit: contain;" alt="First slide"/> 
				</a>
              <!-- <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide"> -->
            </div>
   		    <div class="carousel-item">
   		        <a href="/goods/detail?gno=${top3goods[1].gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}">
					<img class="d-block img-fluid" src="<c:url value="/imgUpload/${top3goods[1].thumbnail}"/>" style="margin:0 auto;object-fit: contain;" alt="Second slide"/> 
				</a>
            </div>
            <div class="carousel-item">
               	<a href="/goods/detail?gno=${top3goods[2].gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}">
					<img class="d-block img-fluid" src="<c:url value="/imgUpload/${top3goods[2].thumbnail}"/>" style="margin:0 auto;object-fit: contain;" alt="Third slide"/> 
				</a>
            </div>
            
            
          </div>
          
          
          
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" style="color:black;">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only" style="color:black;">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        
        <br>
        
 
 <!-- 옵션바 -->       
 <div class="tabset">
  <!-- Tab 1 -->
  <input type="radio" name="tabset" id="tab1" aria-controls="marzen" checked>
  <label for="tab1">신규등록순</label>
  <!-- Tab 2 -->
  <input type="radio" name="tabset" id="tab2" aria-controls="rauchbier">
  <label for="tab2">마감임박순</label>
  <!-- Tab 3 -->
  <input type="radio" name="tabset" id="tab3" aria-controls="dunkles">
  <label for="tab3">인기경매순</label>
  
  <!-- 옵션바 신규등록순-->
 <div class="tab-panels" >
    <section id="marzen" class="tab-panel">
  <div class="row" >
   <c:forEach var="orderbynew" items="${orderbyNew}">    
	<div class="row" style="position:absolute ; right:0;"> </div>
	<div class="col-lg-4 col-md-6 mb-4" >
	<div class="card h-100" style="margin-left:30px;"> 
		<a href="/goods/detail?gno=${orderbynew.gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}"> 
		<img src="<c:url value="/imgUpload/${orderbynew.thumbnail}"/>" width="410px" height="200px" class="card-img-top"/> 
		</a>
		<div class="card-body" >
			<h4 class="card-title">
			<a href="/goods/detail?gno=${orderbynew.gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}">${orderbynew.gname}</a>  
		</h4>
	     <c:choose>
			<c:when test="${orderbynew.finalprice > 0}">
			<h6>현재가 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${orderbynew.finalprice}" /></b>원</h6>
			</c:when>
			<c:otherwise>
			<h6>현재가 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${orderbynew.lowestprice}" /></b>원</h6>
			</c:otherwise>
			</c:choose>
				<h6>입찰수 ${orderbynew.numofbid}</h6>
				<h6>경매마감일 ${orderbynew.endDate}</h6>
      </div>
    </div>
  </div>
  </c:forEach>   
</div>
</section>
  
  
  <!-- 옵션바 마감임박순-->
 <section id="rauchbier" class="tab-panel">
  <div class="row">
   <c:forEach var="duedate" items="${orderbyDuedate}">    
			          <div class="row" style="position:absolute ; right:0;"> </div>
				<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100" style="margin-left:30px;">
				 <a href="/goods/detail?gno=${duedate.gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}"> 
					<img src="<c:url value="/imgUpload/${duedate.thumbnail}"/>" width="410px" height="200px" class="card-img-top"/> 
				</a>
				<div class="card-body">
			  		<h4 class="card-title">
			    	<a href="/goods/detail?gno=${duedate.gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}">${duedate.gname}</a>  
					</h4>
	                <c:choose>
					    <c:when test="${duedate.finalprice > 0}">
					        <h6>현재가 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${duedate.finalprice}" /></b>원</h6>
					    </c:when>
					    <c:otherwise>
					        <h6>현재가 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${duedate.lowestprice}" /></b>원</h6>
					    </c:otherwise>
					</c:choose>
					<h6>입찰수 ${duedate.numofbid}</h6>
					<h6>경매마감일 ${duedate.endDate}</h6>
			</div>
		</div>
	</div>
     </c:forEach>      
</div>      
</section>

  <!-- 옵션바 인기경매순 -->  
  <section id="dunkles" class="tab-panel">
   <div class="row">
 <c:forEach var="best" items="${orderbyBest}">    
			          <div class="row" style="position:absolute ; right:0;"> </div>
				<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100" style="margin-left:30px;">
				 <a href="/goods/detail?gno=${best.gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}"> 
					<img src="<c:url value="/imgUpload/${best.thumbnail}"/>" width="410px" height="200px" class="card-img-top"/> 
				</a>
				<div class="card-body" style="display:inline;">
			  		<h4 class="card-title">
			    	<a href="/goods/detail?gno=${best.gno}&page=${pm.cri.page}&pageSize=${pm.cri.pageSize}">${best.gname}</a>  
					</h4>
	                <c:choose>
					    <c:when test="${best.finalprice > 0}">
					        <h6>현재가 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${best.finalprice}" /></b>원</h6>
					    </c:when>
					    <c:otherwise>
					        <h6>현재가 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${best.lowestprice}" /></b>원</h6>
					    </c:otherwise>
					</c:choose>
					<h6>입찰수 ${best.numofbid}</h6>
					<h6>경매마감일 ${best.endDate}</h6>
		</div>
	</div>
</div>
</c:forEach>   
</div>
</section>
</div>
</div>
<!-- 옵션바 --> 


 
        <!-- 상품 카드 목록(Category) -->
		<%-- <div class="row"> 
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
	                <c:choose>
					    <c:when test="${category.finalprice > 0}">
					        <h6>현재가 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${category.finalprice}" /></b>원</h6>
					    </c:when>
					    <c:otherwise>
					        <h6>현재가 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${category.lowestprice}" /></b>원</h6>
					    </c:otherwise>
					</c:choose>
					<h6>입찰수 ${category.numofbid}</h6>
					<h6>경매마감일 ${category.endDate}</h6>
			    </div>
			  	</div>
				</div>
			</c:forEach>
        </div> --%>
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

