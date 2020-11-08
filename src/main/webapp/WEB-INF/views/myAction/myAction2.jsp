<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">


</head>
<body>
 
  
  <jsp:include page="../inc/top.jsp"/>
  
   <div class="col-lg-3">
        <h1 class="my-4">My Page</h1>
        <div class="list-group">
      	  <a href="/basket/listPage" class="list-group-item">좋아요</a>
          <a href="/member/update" class="list-group-item">회원 수정</a>	
          <a href="/member/delete" class="list-group-item">회원 탈퇴</a>
          <a href="/member/changePw" class="list-group-item">비밀번호 수정</a>
        </div>
      </div>
  <div class="tea"
  style="margin-top: 50px; width: 1300px; margin-left: 500px; margin-bottom: 600px;"
  >
  
   
				   <h1>내 경매 현황</h1><br>
				  <table class="table" border="1">
				  	<h3>내 낙찰 현황</h3>
				  	<thead>
				  		<tr>
				  			
				  			<th>상품명</th>
				  			<th>상품사진</th>
				  			<th>상품번호</th>
				  			<th>판매자</th>
				  			<th>입찰현황</th>
				  			<th>경매 마감</th>
				  			<th>결제현황</th>
				  			<th>배송현황</th>
				  		</tr>
				  	</thead>
				  	    <c:choose>
				                      <c:when test="${paylist == null }">
				                       <h2>낙찰 상품이 없습니다 ㅠㅠ</h2>
				                      </c:when>
				                        <c:otherwise>
                                    <c:forEach items="${ paylist }" var="paylist">
                                    <tr>
                                        <td>${paylist.gname}</td> 
                                        <td><img src="<c:url value="/imgUpload/${paylist.f_name}"/>" width="100px" height="100px"/></td>
                                        <!--  -->
                                        <td>${paylist.a_g_gno }</td>
                                        <td>${paylist.a_m_id }</td>
                                        
                                        <c:choose>
                                        <c:when test="${paylist.a_g_actionstatus == -1 }">
                                          <td>입찰실패</td>
                                        </c:when>
                                        <c:when test="${paylist.a_g_actionstatus == 0 }">
                                          <td>입찰중</td>
                                        </c:when>
                                        <c:when test="${paylist.a_g_actionstatus == 1 }">
                                          <td>입찰종료</td>
                                        </c:when>
                                        <c:when test="${paylist.a_g_actionstatus == 2 }">
                                          <td>입찰성공</td>
                                        </c:when>
                                        </c:choose>
                                        
                                        <td>${paylist.a_g_enddate }</td>
										 
										 <c:choose>
                                        <c:when test="${paylist.paystatus == -1 }">
                                          <td>결제실패</td>
                                        </c:when>
                                        <c:when test="${paylist.paystatus == 0 }">
                                          <td>결제전</td>
                                        </c:when>
                                        <c:when test="${paylist.paystatus == 1 }">
                                          <td>결제성공</td>
                                        </c:when>
                                        </c:choose>                                  
                                        <c:choose>
                                        <c:when test="${paylist.deliverystatus == -1 }">
                                          <td>배송실패</td>
                                        </c:when>
                                        <c:when test="${paylist.deliverystatus == 0 }">
                                          <td>배송전</td>
                                        </c:when>
                                        <c:when test="${paylist.deliverystatus == 1 }">
                                          <td>배송중</td>
                                        </c:when>
                                        <c:when test="${paylist.deliverystatus == 2 }">
                                          <td>배송성공</td>
                                        </c:when>
                                    	</c:choose>
                                    </tr>
                                       </c:forEach>
                                </c:otherwise>
                        </c:choose>
					  </table>
					  <div class="text-center">
							<ul class="pagination justify-content-center">
										<c:if test="${page.prev}">
										 <li class="page-item">
										 <a class="page-link" href="/myAction2/paylist?num=${page.startPageNum - 1}">이전</a>
										 </li>
										</c:if>
										
										<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
										 
										 
										  <c:if test="${select != num}">
										  <li class="page-item"> 
										  <a class="page-link" href="/myAction2/paylist?num=${num}">${num}</a>
										  </li>
										  </c:if>    
										  
										 <c:if test="${select == num}">
										  <li class="page-item">
										  <b><a class="page-link" href="/myAction2/paylist?num=${num}">${num}</a></b>
										  </li>
										  </c:if>
										    
										 
										</c:forEach>
										
										<c:if test="${page.next}">
										 <li class="page-item">
										 <a class="page-link" href="/myAction2/paylist?num=${page.endPageNum + 1}">다음</a>
										 </li>
										</c:if>
									</ul>
						</div>
					   
						</div>
	<jsp:include page="../inc/bottom.jsp"/>
</body>
</html>