<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <style type="text/css">
.container{
 width: 900px !important; 
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
.btn:hover,
.btn:focus {
    background: transparent;
    color: #212529;
    text-decoration: none;
}

</style> 


</head>
<body>

<jsp:include page="../inc/top.jsp"/> 
<!------ Include the above in your HEAD tag ---------->
    
    
 
<div class="container" style="  ">

     <div class="row"> 
         <div class="col-12">  
           <div class="card">  
               <!-- <div class="card-body p-0">
                    <div class="row p-5">
                        <div class="col-md-6">
                            <img src="http://via.placeholder.com/400x90?text=logo">
                        </div>

                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-1">Invoice #550</p>
                            <p class="text-muted">Due to: 4 Dec, 2019</p>
                        </div>
                    </div> -->

                    <!-- <hr class="my-5"> -->
					
                     <!-- </div>  -->
                  
                
                    <div class="row pb-5 p-5"   style="height: 200px;">
                        <div class="col-md-6">
                            <p class="font-weight-bold mb-4">경매 상품</p>
                            <img src="../basket/pineapple.jpg" alt="안뜨노">
                        </div>

                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-4">물건 현황</p>
                            <p class="mb-1"><span class="text-muted">아이디: </span> 1425782</p>
                            <p class="mb-1"><span class="text-muted">카테고리 </span> 10253642</p>
                            <p class="mb-1"><span class="text-muted">상품이름: </span> Root</p>
                            <p class="mb-1"><span class="text-muted">좋아요: </span> John Doe</p>
                        </div>
                    </div>

                    <div class="row p-5" style="top:300px;"  >
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="border-0 text-uppercase small font-weight-bold">아이디</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">상품번호</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">상품이름</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">경매상태</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">입찰가</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">경매기간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Software</td>
                                        <td>LTS Versions</td>
                                        <td>21</td>
                                        <td>$321</td>
                                        <td>$3452</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Software</td>
                                        <td>Support</td>
                                        <td>234</td>
                                        <td>$6356</td>
                                        <td>$23423</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Software</td>
                                        <td>Sofware Collection</td>
                                        <td>4534</td>
                                        <td>$354</td>
                                        <td>$23434</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Software</td>
                                        <td>LTS Versions</td>
                                        <td>21</td>
                                        <td>$321</td>
                                        <td>$3452</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Software</td>
                                        <td>Support</td>
                                        <td>234</td>
                                        <td>$6356</td>
                                        <td>$23423</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Software</td>
                                        <td>Sofware Collection</td>
                                        <td>4534</td>
                                        <td>$354</td>
                                        <td>$23434</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                             
                   
                        <!-- <div class="py-3 px-5 text-right">
                            <div class="mb-2">Grand Total</div>
                            <div class="h2 font-weight-light">$234,234</div>
                        </div>

                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">Discount</div>
                            <div class="h2 font-weight-light">10%</div>
                        </div>

                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">Sub - Total amount</div>
                            <div class="h2 font-weight-light">$32,432</div> -->
                        <button class="btn btn-hover btn-foucs">삭제</button>
                       

                    </div> 
                </div>
            </div> 
      </div>   
      </div>  
    
    <div class="text-light mt-5 mb-5 text-center small">by : <a class="text-light" target="_blank" href="http://totoprayogo.com">totoprayogo.com</a></div>
      
<!-- 상품 카테고리 메뉴바 -->
      <div class="col-lg-3">

        <h1 class="my-4">Shop Name</h1>
        <div class="list-group">
          <a href="#" class="list-group-item">패션의류</a>
          <a href="#" class="list-group-item">뷰티잡화</a>
          <a href="#" class="list-group-item">생활가구</a>
          <a href="#" class="list-group-item">생활가전</a>
          <a href="#" class="list-group-item">디지털</a>
          <a href="#" class="list-group-item">컴퓨터</a>
          <a href="#" class="list-group-item">도서</a>
          <a href="#" class="list-group-item">기타</a>
        </div>
      </div> 
    <!-- 상품 카테고리 메뉴바 -->
    <jsp:include page="../inc/bottom.jsp"/> 


</body>
</html>