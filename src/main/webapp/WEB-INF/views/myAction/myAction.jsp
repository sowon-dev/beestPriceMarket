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
    border-radius: 4px !important; 
    background: #212529 !important;
    color: #fff !important;
    padding: 7px 7px !important;
    display: inline-block !important;
    margin-top: 20px !important;
    border: solid 2px #212529 !important; 
    transition: all 0.5s ease-in-out 0s !important;
}
.btn:hover,
.btn:focus {
    background: transparent !important;
    color: #212529 !important;
    text-decoration: none !important;
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
					<a href="/myAction/actionlist" class="list-group-item">입찰</a> <a
						href="/myAction/paylist" class="list-group-item">낙찰</a>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-12">
						<!-- <div class="card"> -->
						<h1 class="my-4" style="text-align: center;">입찰 목록</h1>
						<div class="row p-5" style="top: 300px; width: 996px;">
							<div class="col-md-12">
								<form method="post" role="form">
									<table class="table">
										<thead>
											<tr>
												<th class="border-0 text-uppercase small font-weight-bold">상품명</th>
												<th class="border-0 text-uppercase small font-weight-bold">상품사진</th>
												<th class="border-0 text-uppercase small font-weight-bold">상품번호</th>
												<th class="border-0 text-uppercase small font-weight-bold">판매자</th>
												<th class="border-0 text-uppercase small font-weight-bold">입찰현황</th>
												<th class="border-0 text-uppercase small font-weight-bold">경매마감</th>

											</tr>
										</thead>
										<tbody>
											<tr>
												<c:choose>
													<c:when test="${actionlist == null }">
														<h2>입찰 상품이 없습니다 ㅠㅠ</h2>
													</c:when>
													<c:otherwise>
														<c:forEach items="${actionlist }" var="actionlist">
															<tr>
																<td>${actionlist.gname}</td>
																<td><img
																	src="<c:url value="/imgUpload/${actionlist.f_name}"/>"
																	width="100px" height="100px" /></td>
																<!--  -->
																<td>${actionlist.a_g_gno }</td>
																<td>${actionlist.a_m_id }</td>
																<c:choose>
																	<c:when test="${actionlist.a_g_actionstatus == -1 }">
																		<td>입찰실패</td>
																	</c:when>
																	<c:when test="${actionlist.a_g_actionstatus == 0 }">
																		<td>입찰중</td>
																	</c:when>
																	<c:when test="${actionlist.a_g_actionstatus == 1 }">
																		<td>입찰종료</td>
																	</c:when>
																	<c:when test="${actionlist.a_g_actionstatus == 2 }">
																		<td>입찰성공</td>
																	</c:when>
																</c:choose>
																<td>${actionlist.a_g_enddate }</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
										</tbody>
									</table>
								</form>
								<div class="text-center">
									<ul class="pagination justify-content-center">
										<c:if test="${page.prev}">
											<li class="page-item"><a class="page-link"
												href="/myAction/actionlist?num=${page.startPageNum - 1}">이전</a>
											</li>
										</c:if>

										<c:forEach begin="${page.startPageNum}"
											end="${page.endPageNum}" var="num">


											<c:if test="${select != num}">
												<li class="page-item"><a class="page-link"
													href="/myAction/actionlist?num=${num}">${num}</a></li>
											</c:if>

											<c:if test="${select == num}">
												<li class="page-item"><b><a class="page-link"
														href="/myAction/actionlist?num=${num}">${num}</a></b></li>
											</c:if>


										</c:forEach>

										<c:if test="${page.next}">
											<li class="page-item"><a class="page-link"
												href="/myAction/actionlist?num=${page.endPageNum + 1}">다음</a>
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
	</div>

	<!-- 상품 카테고리 메뉴바 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>   
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

function fun1(l_g_gno){
	var con = confirm("입찰하러 가시겠습니까?");
	if(con){
	location.href="/goods/detail?gno="+l_g_gno;
	}
}


$(document).ready(function(){
	var formObj = $("form[role='form']");
               
$("#delete_btn").on("click",function(){
		var con = confirm("삭제 하시겠습니까?");
		if(con){
		alert("삭제 되었습니다");
		formObj.attr("action","/basket/delete");
		formObj.submit();
		}
		});	
});
</script>
</body>