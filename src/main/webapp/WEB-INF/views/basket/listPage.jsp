<%@page import="com.bestpricemarket.domain.BasketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${pageContext.request.contextPath}/resources/BasketCSS/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/loginandjoin/loginandjoin.css" rel="stylesheet">
<style type="text/css">
.container{
	width: 100% !important; 
}
.btn {
    border-radius: 4px; 
    background: #212529;
    color: #fff;
    padding: 7px 45px;
    display: inline-block;
    margin-top: 20px;
    border: solid 2px #212529; 
    transition: all 0.5s ease-in-out 0s;
}
.btn:hover, .btn:focus {
    background: transparent;
    color: #212529;
    text-decoration: none;
}
</style>
</head>
<body>
<jsp:include page="../inc/top.jsp"/> 
    <!-- Page Content -->
  <div class="container">
    <div class="row">
    
      <div class="col-lg-3">
        <h1 class="my-4">My Page</h1>
        <div class="list-group">
      	  <a href="/basket/listPage" class="list-group-item">좋아요</a>
          <a href="/member/update" class="list-group-item">회원 수정</a>	
          <a href="/member/delete" class="list-group-item">회원 탈퇴</a>
          <a href="/member/changePw" class="list-group-item">비밀번호 수정</a>
        </div>
      </div>

	<div class="col-lg-9">
     <div class="row"> 
         <div class="col-12">  
          	<!-- <div class="card"> -->
                   <h1 class="my-4" style="text-align: center;">장바구니</h1>   
                    <div class="row p-5" style="top:300px;"  >
                         <div class="col-md-12">
                            <form method="post" role="form">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="border-0 text-uppercase small font-weight-bold">찜한순서</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">상품</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">상품이름</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">경매상태</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">입찰가</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">경매기간</th>
                                   	    <th class="border-0 text-uppercase small font-weight-bold" colspan="2">여부</th>
                                    </tr>
                                </thead>
                                <tbody>
				                       <c:choose>
				                      <c:when test="${basketlist == null }">
				                       <h2>관심 상품이 없습니다 ㅠㅠ</h2>
				                      </c:when>
				                        <c:otherwise>
                                    <c:forEach items="${basketlist }" var="BasketVO">
                                    <tr>
                                        <td>${BasketVO.lno}</td> 
                                        <!-- 업로드 위치 모르겠음 -->
                                        <td><img src="./upload/${BasketVO.f_name}" alt="안뜸"> </td>
                                        <!--  -->
                                        <td><a href="goods/detail?gno=${BasketVO.lno }">${BasketVO.gname }</a></td>
                                        <c:choose>
                                        <c:when test="${BasketVO.actionstatus == -1 }">
                                          <td>입찰실패</td>
                                        </c:when>
                                        <c:when test="${BasketVO.actionstatus == 0 }">
                                          <td>입찰중</td>
                                        </c:when>
                                        <c:when test="${BasketVO.actionstatus == 1 }">
                                          <td>입찰종료</td>
                                        </c:when>
                                        <c:when test="${BasketVO.actionstatus == 2 }">
                                          <td>입찰성공</td>
                                        </c:when>
                                        </c:choose>
                                        <td>${BasketVO.lowestprice }</td>
                                        <td>${BasketVO.enddate }</td>
                                    	<td><a href="/basket/delete?lno=${BasketVO.lno}">삭제</a></td>
                                    	<td><a href="/pay/order">입찰</a></td>
                                    </tr>
                                       </c:forEach>
                                </c:otherwise>
                        </c:choose>
                                </tbody>
                            </table>
							</form>
										<!-- 페이징 처리 -->
										
										<ul class="pagination justify-content-center">
										<c:if test="${page.prev}">
										 <li class="page-item">
										 <a class="page-link" href="/basket/listPage?num=${page.startPageNum - 1}">이전</a>
										 </li>
										</c:if>
										
										<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
										 
										 
										  <c:if test="${select != num}">
										  <li class="page-item"> 
										  <a class="page-link" href="/basket/listPage?num=${num}">${num}</a>
										  </li>
										  </c:if>    
										  
										 <c:if test="${select == num}">
										  <li class="page-item">
										  <b><a class="page-link" href="/basket/listPage?num=${num}">${num}</a></b>
										  </li>
										  </c:if>
										    
										 
										</c:forEach>
										
										<c:if test="${page.next}">
										 <li class="page-item">
										 <a class="page-link" href="/basket/listPage?num=${page.endPageNum + 1}">다음</a>
										 </li>
										</c:if>
									</ul>
									
									</div>
                       
                       
                        
                    </div>
                </div>
            </div> 
      </div>   
      </div>  
    
    
      </div>
<!-- 상품 카테고리 메뉴바 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>   
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
               
$(".btn").on("click",function(){
		alert("삭제 되었습니다");
		formObj.attr("action","/basket/delete");
		formObj.submit();
	});	
});
</script>
</body>