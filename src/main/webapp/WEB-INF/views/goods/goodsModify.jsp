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
    <title>상품 수정</title>

    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath}/resources/goods/goods_css/goodsRegister.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/resources/goods/goods_css/goods_optionbar.css" rel="stylesheet">
</head>

<body>
    <div class="page-wrapper bg-dark p-t-100 p-b-50">
        <div class="wrapper wrapper--w900">
            <div class="card card-6">
                <div class="card-heading">
                    <h2 class="title">상품 수정</h2>
                </div>
                
                <div class="card-body">
                    <form method="POST">
                  <div>
                  </div>
                  <div class="form-row">
                            <div class="name">카테고리</div>
                            <select class="bo_w_select">
                      <option value="" selected>카테고리 선택</option>
                      <option value="">가전/디지털</option>
                      <option value="">의류/뷰티</option>
                      <option value="">생활용품</option>
                      <option value="">도서/티켓</option>
                      </select>
                            </div>
                     
                      
                        <div class="form-row">
                            <div class="name">작성자</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="username">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">상품 제목</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="gname">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">상품 상세설명</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="textarea--style-6" name="content" placeholder="상품 상세설명 입력"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">상품 이미지 등록</div>
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

                            </div>
                        </div>
                        
                    </form>
                </div>
                <div class="card-footer">
                    <button class="btn btn--radius-2 btn--blue-2" type="submit">상품 수정</button>
                </div>
            </div>
        </div>
    </div>

   
    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>


    <!-- Main JS-->
    <script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->