<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<style>
	
</style>
</head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- 카카오페이 결제모듈 스크립트 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<body>
<!-- 주문자 정보 -->
<form action="/pay/payment" method="post" name="order_form">
<div class="container">
	<div class="row">
        <div class="col-sm-12">
            <legend>BestPrice</legend>
        </div>
        <!-- panel preview1 -->
        <div class="col-sm-5">
            <h4>주문자 정보</h4>
            <div class="panel panel-default">
                <div class="panel-body form-horizontal payment-form">
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">이름</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="username" name="username" value="${memVO.username}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">ID</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="id" name="id" value="${memVO.id}" readonly>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">연락처</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="phone" name="phone" value="${memVO.phone}" readonly>
                        </div>
                    </div>                    
                    <div class="form-group">
                        <label for="date" class="col-sm-3 control-label">주소</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="addr1" name="addr1" value="${memVO.addr1}" readonly><br>
                            <input type="text" class="form-control" id="addr2" name="addr2" value="${memVO.addr2}" readonly>
                        </div>
                    </div>   
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                            <button type="button" class="btn btn-default preview-add-button" onclick="javascript:same_info(document.order_form)">
                                <span class="glyphicon glyphicon-plus"></span> 주문자 정보와 동일하게
                            </button>
                        </div>
                    </div>
                </div>
            </div>            
        </div> <!-- / panel preview1 -->  
        <!-- panel preview2 -->
        <div class="col-sm-5">
            <h4>배송지 정보</h4>
            <div class="panel panel-default">
                <div class="panel-body form-horizontal payment-form">
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">이름</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="re_username" name="re_username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">ID</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="re_id" name="re_id">
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">연락처</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="re_phone" name="re_phone">
                        </div>
                    </div>                    
                    <div class="form-group">
                        <label for="date" class="col-sm-3 control-label">주소</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="re_addr1" name="re_addr1"><br>
                            <input type="text" class="form-control" id="re_addr2" name="re_addr2">
                        </div>
                    </div>                   
                </div>
            </div>            
        </div> <!-- / panel preview2 -->       
	</div>
</div><!-- 주문자 정보 -->

<!-- 상품 정보 -->
<div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">상품 정보</h1>

      <!-- Project One -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt=""> <!-- goods테이블 사진 -->
          </a>
        </div>
    </div>
</div>
<br>
<div class="container">           
  <table class="table">
    <thead>
      <tr>
        <th>상품명</th>
        <th>상품번호</th>
        <th>금액</th>
      </tr>
    </thead>
    <tbody>
      <tr>      	
        <td>${gvo.gname}<!-- goods테이블 상품명 --></td>
        <td>${gvo.gno}<!-- goods테이블 상품번호 --></td>
        <td>${gvo.lowestprice}원<!-- goods테이블 ???? --></td>
      </tr>      
    </tbody>
  </table>
</div><!-- 상품 정보 -->

<br>
<!-- 결제창  -->
<div class="container">
  <h2>최종결제</h2>             
  <table class="table">
    <thead>
      <tr>
        <th>상품명</th>
        <th>결제금액</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${gvo.gname}</td>
        <td>${gvo.lowestprice}원</td>
        <td width="250px;">
        <div style="padding-left: 50px; border: 1px solid red;">
        <input type="hidden" name="gname" value="${gvo.gname}">
      	<input type="hidden" name="gno" value="${gvo.gno}">
      	<input type="hidden" name="lowestprice" value="${gvo.lowestprice}">
        <input type="submit" value="결제하기"> <input type="reset" value="취소하기">
         <!-- <a class="btn btn-primary" href="/pay/order">결제하기</a>&nbsp;<a class="btn btn-primary" href="#">취소하기</a> -->
        </div>
        </td>
      </tr>
     
    </tbody>
  </table>
</div><!-- 결제창  -->
</form>

<script type="text/javascript">
	function same_info(f) {
			f.re_username.value = f.username.value;
			f.re_id.value = f.id.value;
			f.re_phone.value = f.phone.value;
			f.re_addr1.value = f.addr1.value;
			f.re_addr2.value = f.addr2.value;
	}
</script>

</body>
</html>
