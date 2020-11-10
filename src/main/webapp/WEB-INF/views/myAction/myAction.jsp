<%@page import="com.bestpricemarket.domain.BasketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${pageContext.request.contextPath}/resources/BasketCSS/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/loginandjoin/loginandjoin.css" rel="stylesheet">
<style type="text/css">
.container{
	width: 100% !important; 
}
.delete_btn {
    border-radius: 4px !important; 
    background: #DC3545 !important;
    color: #fff !important;
    padding: 7px 7px !important;
    display: inline-block !important;
    margin-top: 20px !important;
    border: solid 2px #DC3545 !important; 
    transition: all 0.5s ease-in-out 0s !important;
}
.delete_btn:hover,
.delete_btn:focus {
    background: transparent !important;
    color: #DC3545 !important;
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
												<th class="border-0 text-uppercase small font-weight-bold">
												 <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
												</th>
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
															<c:if test="${actionlist.a_g_actionstatus != 2 }">
															<tr>
																<td><input type="checkbox" name="chBox" class="chBox" data-cartNum="${actionlist.ano}" /></td>
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
																<td><fmt:formatDate value="${actionlist.a_g_enddate }" pattern="yyyy-MM-dd"/></td>
															</tr>
														</c:if>
														</c:forEach>
													</c:otherwise>
												</c:choose>
										</tbody>
									</table>
								     <button type="button" class="delete_btn">선택 삭제</button> 
								</form>
								<div class="text-center">
									<ul class="pagination justify-content-center">
							               
							         <c:if test="${prev}">
							         <li class="page-item">
							          <a class="page-link" href="/myAction/actionlist?num=${startPageNum - 1}">Previous</a>
							          </li>
							         </c:if>
							            <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
							                          
							                 <c:if test="${select!=num}">
							                    <li class="page-item">
							                     <a class="page-link" href="/myAction/actionlist?num=${num}">${num}</a>
							                     </li>
							                 </c:if>    
							                 
							                 <c:if test="${select==num}">
							                 <a class="page-link" href="/myAction/actionlist?num=${num}">${num}</a>
							                 </c:if>
							                
							         </c:forEach>
							
							         <c:if test="${next}">
							             <li class="page-item"><a class="page-link" href="/myAction/actionlist?num=${endPageNum + 1}">Next</a>
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
 <jsp:include page="../inc/bottom.jsp"/> 
	<!-- 상품 카테고리 메뉴바 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>   
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$("#allCheck").click(function(){
 var chk = $("#allCheck").prop("checked");
 if(chk) {
  $(".chBox").prop("checked", true);
 } else {
  $(".chBox").prop("checked", false);
 }
});
</script>

<script>
 $(".chBox").click(function(){
  $("#allCheck").prop("checked", false);
 });
</script>
 
 <script>
 $(".delete_btn").click(function(){
  var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  if(confirm_val) {
   var checkArr = new Array();
   
   $("input[class='chBox']:checked").each(function(){
    checkArr.push($(this).attr("data-cartNum"));
   });
    
   $.ajax({
    url : "/myAction/delete",
    type : "post",
    data : { chbox : checkArr },
    success : function(result){
     if(result == 1){   
     location.href = "/myAction/actionlist";
      }else{
			alert("삭제 실패");
          }
     }
   });
  } 
 });
</script>


               

</body>