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

<!-- 
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css' rel="stylesheet"> 
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel="stylesheet"> -->
<link href='${pageContext.request.contextPath}/resources/loginandjoin/loginandjoin.css' rel="stylesheet">

<style>
  .btn  {
 
    background:  #007BFF;
    color :  white;
 
  }
  .btn:hover {
    background: #343A40;
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

</style>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">베프마켓</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">홈
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">내경매</a>
          </li>
          <% 
          String id = (String)session.getAttribute("id");
          if(id != null){ %>
          <li class="nav-item">
            <a class="nav-link" href="/member/update"> 마이페이지</a></li>
            |
            <li class="nav-item">
            <a class="nav-link" href="/member/logout"> 로그아웃</a></li>
          
          <% }else{ %>
          <li class="nav-item">
          <a class="nav-link" href="/member/login"> 로그인 | 회원가입</a></li>
          
           <%} %>
          <li class="nav-item">
            <a class="nav-link" href="#">고객센터</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">회원정보보기</h1>
        <div class="list-group">
      	  <a href="/basket/basket" class="list-group-item">좋아요</a>
          <a href="/member/update" class="list-group-item">회원 수정</a>	
          <a href="/member/delete" class="list-group-item">회원 탈퇴</a>
        </div>
      </div>
      
  <!-- /.container -->
<fieldset>
    <legend> 회원탈퇴 </legend>
    <form  method="post" name="form1">
       <span class="front" style="margin-right: 52px;">아이디 </span> <input type="text" name="id" class="form-control" value="${id }" style="width:226px;display:inline;" readonly> <br>
      <span class="front" style="margin-right: 40px;">비밀번호</span><input type="password" class="form-control" name="pw"  style= "width: 226px; display: inline;"  required> <br>
     <input type="submit" class="btn" style="background-color: #343A40; color:white; " value="회원탈퇴"  id="btnDelete"> 
    </form>  
   <c:if test="${msg == false }">
 <p>
 입력한 비밀번호가 잘 못 되었습니다.
 </p>
</c:if>
  
  
  </fieldset>
  <!-- Footer -->
  <footer class="py-5 bg-dark" style="left:0px;">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  


</body>
</html>

