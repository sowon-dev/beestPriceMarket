<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<!-- 본문 CSS -->
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
  <link href="${pageContext.request.contextPath}/resources/goods/goods_css/goodsDetail.css" rel="stylesheet">
<!-- 본문 CSS -->

<!-- 본문 JS  -->
 <script src='${pageContext.request.contextPath}/resources/goods/goods_js/goodsDetail.js'></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- 본문 JS  -->

<!-- 수정/삭제 아이콘 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 수정/삭제 아이콘 -->

<script type="text/javascript">
 	<!-- 수정/삭제 이동 --> 
		$(document).ready(function(){

			var gno = $('#gno').val();
					
			$(document).on("click","#modify",function(){
				location.href = '/goods/modify?gno='+gno;
			});

			$(document).on("click","#delete",function(){
				var con = confirm("정말로 삭제하시겠습니까?");
				if(con){
					location.href = '/goods/delete?gno='+gno;
				}	
			});
		});
	  <!-- 수정/삭제 이동 -->
</script>



</head>

<body>

  <!-- 헤더 -->
   <jsp:include page="../inc/top.jsp"/>
  <!-- 헤더 -->
  
  <!-- 본문 -->
  <div class="pd-wrap">
		<div class="container">
	        <div class="heading-section">
	        </div>
	        <div class="row">
	       	<div class="col-md-6">
	      <!--  	<div class="form-group" style="border: 1px solid #dbdbdb;">  -->
					<c:forEach var="file" items="${file}">
					 <img src="<c:url value="/imgUpload/${file.f_name}"/>" width="500px" height="500px"/>
					</c:forEach> 
				<!-- </div> -->
			<!-- </div> -->
			
	       	
	        	</div> 
	        	<div class="col-md-6">
	        		<div class="product-dtl">
        				
		        		<br><br>
		     
		     <!-- 경매정보 테이블 -->  
		     		
		       <table>
		         <tr>
		         	<th colspan="2" style="font-size:40px;">${goods.gname}  </th>
		         </tr>
		          <tr>
    				<th>카테고리</th>
    				<td>${goods.category}</td>
 				 </tr>
  				 <tr>
    				<th>현재입찰가</th>
    				<td></td>
 				 </tr>
  				 <tr>
    				<th>입찰시작가</th>
    				<td>${goods.lowestprice}원</td>
  				 </tr>
  				
  				 <tr>
    				<th>경매기간</th>
    				<td>${goods.regDate}  ~  ${goods.endDate}</td>
  				 </tr>
  				 <tr>
     			    <th>남은시간</th>
    				<td></td>
  				</tr>
  				<tr>
     				<th>입찰수</th>
    				<td>       <button>입찰기록</button></td>
  				</tr>
  				<tr>
     				<th>판매자</th>
    				<td>${goods.g_m_id}</td>
  				</tr>
  				
			</table>
			<!-- 경매정보 테이블 --> 

			<!-- 입찰하기/관심상품(구매자들만 보이기) -->
			<c:if test="${ id != goods.g_m_id}">
		        <form action="#" class="display-flex">
	        			<div class="product-count">
	        				  <a href="#" class="round-black-btn" style="margin-right:20px;">입찰하기</a>
	        				  <a href="#" class="round-black-btn">관심상품</a>
	        				  <a href="${path}/goods/report">신고하기</a>
	        			</div>
	        	</form>
	        </c:if>		
	        <!-- 입찰하기/관심상품(구매자들만 보이기) -->
	        				
	      <!-- 수정/삭제(상품 올린 사람만 보이기) -->
	      <c:if test="${ id == goods.g_m_id}">
			<form action="" role="form">
	        	<div class="product-count" >
	        		<input type="hidden" name="gno" id="gno" value="${goods.gno}">
	        		<input type="button"  id="modify" value="수정" class="round-black-btn" style="margin-right:20px;">
	        		<input type="button"  id="delete" value="삭제" class="round-black-btn" >
	        	</div>
	        </form>
	       </c:if> 
	       <!-- 수정/삭제(상품 올린 사람만 보이기) -->
	        

	        		</div>
	        	</div>
	        </div>
	        
	        
	        
	        <!-- 상품 정보, 상품 문의 탭 -->
	        <div class="product-info-tabs">
		        <ul class="nav nav-tabs" id="myTab" role="tablist">
				  	<li class="nav-item">
				    	<a href="#description" class="nav-link active" id="description-tab" data-toggle="tab"  role="tab" aria-controls="description" aria-selected="true" >상품정보</a>
				  	</li>
				  	<li class="nav-item">
				    	<a href="#review" class="nav-link" id="review-tab" data-toggle="tab"  role="tab" aria-controls="review" aria-selected="false" >상품문의</a>
				  	</li>
				</ul>
			<!-- 상품 정보, 상품 문의 탭 -->
		
			
			
				<div class="tab-content" id="myTabContent">
				
				<!-- 상품정보 -->
				${goods.content}
				
					
				  <%-- 	<div class="form-group" style="border: 1px solid #dbdbdb;">
					<c:forEach var="file" items="${file}">
					 <img src="<c:url value="/imgUpload/${file.f_name}"/>"/>
					<a href="#" onclick="fn_fileDown('${file.f_name}'); return false;">${file.f_oname}</a>(${file.f_size}kb)<br>
					</c:forEach> --%>
				</div>
	
				<!-- 상품정보 -->	
				
<!-- /******************************************************************************************************************************************** -->
				
				<!-- 상품문의 -->  	
				  	<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
				  		<div class="review-heading">REVIEWS</div>
				  		<form class="review-form">
		        			<div class="form-group">
			        			<label>문의내용</label>
			        			<textarea class="form-control" rows="10"></textarea>
			        		</div>
			        		<div class="row">
				        		<div class="col-md-6">
				        			<div class="form-group">
					        			<input type="text" name="" class="form-control" placeholder="Name*">
					        		</div>
					        	</div>
				        		<div class="col-md-6">
				        			<div class="form-group">
					        			<input type="text" name="" class="form-control" placeholder="Email Id*">
					        		</div>
					        	</div>
					        </div>
					        <button class="round-black-btn">문의하기</button>
			        	</form>
			        	
			        	<br>
			        				  	
				  	<!-- 상품문의 목록 -->
				  	<table class="comment-tbl">
  					  <tr>
    					<th class="comment-tbl-th">번호</th>
    					<th class="comment-tbl-th" id="comment-sub">제목</th>
    					<th class="comment-tbl-th">작성자</th>
    					<th class="comment-tbl-th">등록일시</th>
    					<th class="comment-tbl-th"></th>
  					  </tr>
  					  <tr>
    					<td>번호</td>
    					<td>제목</td>
    					<td>작성자</td>
    					<td>등록일시</td>
    					<td>답변</td>
  						</tr>
					</table>
				  	<!-- 상품문의 목록 -->
				  	</div>
				 <!-- 상품문의 -->	 	
				 <!-- /******************************************************************************************************************************************** -->
				</div>
			</div>
		</div>
	</div>
  <!-- 본문 -->
  
  

  <!-- 푸터 -->
  <jsp:include page="../inc/bottom.jsp"/>
  <!-- 푸터 -->

  
  
  
  

</body>

</html>