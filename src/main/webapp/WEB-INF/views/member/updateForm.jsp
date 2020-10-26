 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>베프마켓 - 친구같은 경매플랫폼</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
<!-- <!-- <link href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css' rel="stylesheet"> -->
<!-- <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel="stylesheet"> --> -->
<link href='${pageContext.request.contextPath}/resources/loginandjoin/loginandjoin.css' rel="stylesheet">
<style>
  .btn  {
    background-color :  #343A40;
    color :  white;
  }
  .btn:hover {
    background: #00BBFF;
    color : #007BFF;
  }
 .py-5  {
   width:100%;
   position:absolute;
   bottom:0;
  text-align: center;
}
.form {
  display: flex;
  height: 100vh;
  justify-content: center;
  align-items: center;
  border: solid 1px gray;
  
 }
.front{
 width: 202px;
 

}
</style>
</head>
<body>
  <!-- 헤더 -->
   <jsp:include page="../inc/top.jsp"/>
  <!-- 헤더 -->
  
  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4">회원정보보기</h1>
        <div class="list-group">
      	  <a href="/member/update" class="list-group-item">회원 수정</a>
          <a href="/member/delete" class="list-group-item">회원 탈퇴</a>
        </div>
      </div>
      <div class="col-lg-9">
	    <fieldset>
	    <legend> 회원정보 수정 </legend>
	    <form action="/member/update" method="post">
	     <span class="front" style="margin-right: 34px;">아이디</span>  <input type="text" name="id" class="form-control" value="${memberVO.id }" style="width:226px;display:inline; text-align: center;" readonly><br>
	     <span class="front" style="margin-right: 17px; ">비밀번호</span>  <input type="password" class="form-control" name="pw" placeholder="비밀번호를 입력하세요" style="width:226px;display:inline; " required> <br>
	     <span class="front" style="margin-right: 50px; "> 이름 </span><input type="text" name="username" class="form-control" value="${memberVO.username }" style="width:226px;display:inline; "> <br>
	      <span class="front" style="margin-right: 34px;" >이메일</span> <input type="text" name="email" class="form-control"  value="${memberVO.email }" style="width:226px;display:inline; "> <br>
	      <span class="front"  style="margin-right: 38px;">연락처</span><input type="text" name="phone"  class="form-control" value="${memberVO.phone}" style="width:226px;display:inline; "><br>
	      <span class="front" style="margin-right: 45px; ">주소: </span><input type="text" name="addr1" class="form-control" value="${memberVO.addr1}" style="width:226px;display:inline; "><br>
	      <span class="front" style="margin-right: 40px; ">주소2:</span><input type="text" name="addr2" class="form-control" value="${memberVO.addr2}" style="width:226px;display:inline; "><br>
	      <span class="front" style="margin-right: 17px; ">가입일자</span> <input type="text" name="reg_date" class="form-control" value="${memberVO.reg_date}" style="width:226px;display:inline; "><br>
	      <input type="submit" class="btn" value="회원수정" style="background-color: #343A40; color:white; " name="commit">          
	    </form>  
	  	</fieldset>
      </div>
    </div>
  </div>

  <!-- 푸터 -->
  <jsp:include page="../inc/bottom.jsp"/>
  <!-- 푸터 -->

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

