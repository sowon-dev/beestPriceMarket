<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>상품 등록</title>

    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath}/resources/goods/goods_css/goodsRegister.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/resources/goods/goods_css/goods_optionbar.css" rel="stylesheet">
    
      <!-- Jquery JS-->
  <!--   <script src="vendor/jquery/jquery.min.js"></script> -->
    <script src='${pageContext.request.contextPath}/resources/goods/goods_js/jquery.min.js'></script>

    <!-- Main JS-->
    <script src='${pageContext.request.contextPath}/resources/goods/goods_js/global.js'></script>
    <!-- <script src="js/global.js"></script> -->
    
    
    <!-- 섬머노트 에디터 -->
    <!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		  $('#summernote').summernote();
		});
	</script>
    <!-- 섬머노트 에디터 -->
    
    
    
</head>

<body>
    <div class="page-wrapper bg-dark p-t-100 p-b-50">
        <div class="wrapper wrapper--w900">
            <div class="card card-6">
                <div class="card-heading">
                    <h2 class="title">상품 등록</h2>
                </div>
                
                <div class="card-body">
                    <form action ="/goods/register" method="POST">
                  <div>
                  </div>
                  <div class="form-row">
                            <div class="name">물품분류</div>
                            <select class="bo_w_select">
                      <option value="" selected>카테고리 선택</option>
                      <option value="">가전/디지털</option>
                      <option value="">의류/뷰티</option>
                      <option value="">생활용품</option>
                      <option value="">도서/티켓</option>
                      </select>
                            </div>
                            
                            
                     <div class="form-row">
                            <div class="name">판매자</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="username">
                            </div>
                        </div>
                      
                        <div class="form-row">
                            <div class="name">물품제목</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="gname">
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">물품설명</div>
                            <div class="value">
                             
                                <div class="input-group">
                                 <div id="summernote">
                                 </div>   
                              </div>  
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">첨부 이미지 등록</div>
                            <div class="value">
                                <div class="input-group js-input-file">
                                    <input class="input-file" type="file" name="file_cv" id="file">
                                    <label class="label--file" for="file">파일 선택</label>
                                    <span class="input-file__info">선택된 파일이 없습니다</span>
                                </div>
                                <div class="label--desc">상품 이미지를 업로드 해주세요. 파일 크기 최대 50M</div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">첨부 이미지 미리보기</div>
                            <div class="value">
                               <!--  <div class="input-group js-input-file">
                                    <input class="input-file" type="file" name="file_cv" id="file">
                                    <label class="label--file" for="file">파일 선택</label>
                                    <span class="input-file__info">선택된 파일이 없습니다</span>
                                </div> -->
                                <div class="label--desc">상품 이미지를 업로드 해주세요. 파일 크기 최대 50M</div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">입찰 일자</div>
                            
                           <div class="value">
                                <input class="input--style-6" type="datetime-local" name="regDate">
                            </div>
                           <script>
              document.getElementById('regDate').value= new Date().toISOString().slice(0, -1);
                              </script>
                            
                        </div>
                        <div class="form-row">
                            <div class="name">마감 일자</div>
                            <div class="value">
                                <input class="input--style-6" type="datetime-local" name="endDate">
                            </div>
                            
                            
                            
                           
                            </div>
                        </div>
                         <div class="card-footer">
                    	<!-- <button class="btn btn--radius-2 btn--blue-2" type="submit">상품 등록</button> -->
                    	<input type="submit" value="물품 등록" class="btn btn--radius-2 btn--blue-2">
                </div>
                    </form>
                </div>
               
            </div>
        </div>
    </div>

   
    
                            <script>
              document.getElementById('endDate').value= new Date().toISOString().slice(0, -1);
                              </script>
                        </div>
                        <div class="form-row">
                            <div class="name">경매 시작가</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="lowestprice" id="input">
                                 <script type="text/javascript">
                                $(function() {
                                	  var $input = $("#input");
                                	  $input.on('keyup', function() {
                                	    // 입력 값 알아내기
                                	    var _this = this;
                                	    numberFormat(_this)
                                	  })

                                	});

                                	// 콤마 찍기
                                	function comma(str) {
                                	  str = String(str);
                                	  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
                                	}

                                	// 콤마 풀기
                                	function uncomma(str) {
                                	  str = String(str);
                                	  return str.replace(/[^\d]+/g, '');
                                	}

                                	function numberFormat(obj) {
                                	  obj.value = comma(uncomma(obj.value));
                                	}
                                
                                
                                </script>
   
  

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->