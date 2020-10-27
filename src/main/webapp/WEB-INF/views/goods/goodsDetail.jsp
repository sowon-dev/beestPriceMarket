<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

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
	        		<div id="slider" class="owl-carousel product-slider">
						<div class="item">
						  	<img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80" />
						</div>
						<div class="item">
						  	<img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
						</div>
						<div class="item">
						  	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
						</div>
						<div class="item">
						  	<img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
						</div>
						<div class="item">
						  	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
						</div>
						<div class="item">
						  	<img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
						</div>
						<div class="item">
						  	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
						</div>
					</div>
					<div id="thumb" class="owl-carousel product-thumb">
						<div class="item">
						  	<img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80" />
						</div>
						<div class="item">
						  	<img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
						</div>
						<div class="item">
						  	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
						</div>
						<div class="item">
						  	<img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
						</div>
						<div class="item">
						  	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
						</div>
						<div class="item">
						  	<img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" />
						</div>
						<div class="item">
						  	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
						</div>
					</div>
	        	</div>
	        	<div class="col-md-6">
	        		<div class="product-dtl">
        				
		        		<br><br>
		     <!-- 경매정보 테이블 -->   		
		       <table>
		         <tr>
		         	<th colspan="2">${goods.gname}</th>
		         </tr>
  				 <tr>
    				<th>현재입찰가</th>
    				<td>50000원</td>
 				 </tr>
  				 <tr>
    				<th>입찰시작가</th>
    				<td>${goods.lowestprice}</td>
  				 </tr>
  				 <tr>
    				<th>경매기간</th>
    				<td>${goods.regDate} - ${goods.endDate}</td>
  				 </tr>
  				 <tr>
     			    <th>남은시간</th>
    				<td>-----</td>
  				</tr>
  				<tr>
     				<th>입찰수</th>
    				<td>10명       <button>입찰기록</button></td>
  				</tr>
  				<tr>
     				<th>배송정보</th>
    				<td>직거래</td>
  				</tr>
  				
			</table>
			<!-- 경매정보 테이블 --> 

		        
	        			<div class="product-count">
	        				<form action="#" class="display-flex">
	        				  <a href="#" class="round-black-btn">입찰하기</a>
	        				  <a href="#" class="round-black-btn">관심상품</a>
							</form>
							
	        			</div>
	        		</div>
	        	</div>
	        </div>
	        
	        <!-- 상품 정보, 상품 문의 탭 -->
	        <div class="product-info-tabs">
		        <ul class="nav nav-tabs" id="myTab" role="tablist">
				  	<li class="nav-item">
				    	<a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">상품정보</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">상품문의(0)</a>
				  	</li>
				</ul>
			<!-- 상품 정보, 상품 문의 탭 -->
			
			
				<div class="tab-content" id="myTabContent">
				<!-- 상품정보 -->	
				  	<div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
				  	상품 설명란
				  	</div>
				<!-- 상품정보 -->	
				
				<!-- 상품문의 -->  	
				
				<section class="commentForm">
				  	<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
				  		<div class="review-heading">REVIEWS</div>
				  		<div id="reply">

                        <c:if test="${member == null }">
                         <p>문의를 남기시려면 <a href="/member/login">로그인</a>해주세요</p>
                          </c:if>
 
                        <c:if test="${member != null}">
                        <section class="commentForm">
                        <form role="form" method="post" autocomplete="off">
                         <div class="input_area">
                         <textarea name="repCon" id="repCon"></textarea>
                         </div>
   
                
                         </form>
                         </section>
                           </c:if>
 
				  		<form class="review-form">
				  		<div class="row">
				        		<div class="col-md-6">
				        			<div class="form-group">
					        			<input type="text" name="" class="form-control" placeholder="Name*">
					        		</div>
					        	</div>
				        		
					        </div>
				  		
		        			<div class="form-group">
		        			
			        			<label>문의내용</label>
			        			<input type="hidden" name="c_g_gno" id="c_g_gno">
			        			<textarea class="form-control" rows="10" name="c_content" id="c_content"></textarea>
			        		</div>
			        		
					        <button class="round-black-btn" id="comment_btn">문의하기</button>
					        
					        <script>
					        $("#comment_btn").click(function(){
					        	  
					        	  var commentForm = $(".commentForm form[role='form']");
					        	  var c_g_gno = $("#c_g_gno").val();
					        	  var c_content = $("#c_content").val()
					        	  
					        	  var data = {
					        	    c_g_gno : c_g_gno,
					        	    c_content : c_content
					        	    };
					        	  
					        	  $.ajax({
					        	   url : "/comment",
					        	   type : "post",
					        	   data : data,
					        	   success : function(){
					        	    commentList();
					        	   }
					        	  });
					        	 });

					        </script>
			        	</form>
			        	
			        	</div>
			        	<br>
			        				  	
				  	<!-- 상품문의 목록 -->
				  	<table class="comment-tbl">
  					  <tr>
    					<th class="comment-tbl-th">번호</th>
    					<th class="comment-tbl-th">작성자</th>
    					<th class="comment-tbl-th">내용</th>
    					<th class="comment-tbl-th">등록일자</th>
  					  </tr>
  					  <tr>
    					<td>${comment.c_num}</td>
    					<td>${comment.c_m_id}</td>
    					<td>${comment.c_content}</td>
    					<td>${comment.c_regdate}</td>
  						</tr>
					</table>
				  	<!-- 상품문의 목록 -->
				  	</div>
				  	</section>
				  	
				 <!-- 상품문의 -->	 	
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