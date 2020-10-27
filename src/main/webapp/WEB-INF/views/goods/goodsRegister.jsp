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

	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		  $('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		  });
	});
	</script> 
	
    <!-- 섬머노트 에디터 -->
    
    <!-- 유효성 체크 -->
	<script type="text/javascript">

	function goods_register(){

		var category = document.fr.category.value;
		var gname = document.fr.gname.value;
		var content = document.fr.content.value;
		var lowestprice = document.fr.lowestprice.value;
		var endDate = document.fr.endDate.value;
		
		if(category == ""){
			alert("물품분류를 선택하세요.");
			document.fr.category.focus();
			return false;
		}

		if(gname == ""){
			alert("물품제목을 입력하세요.");
			document.fr.gname.focus();
			return false;
		}

		if(content == ""){
			alert("물품설명을 입력하세요.");
			document.fr.content.focus();
			return false;
		}

		if(lowestprice == ""){
			alert("물품의 하한가를 입력하세요.");
			document.fr.lowestprice.focus();
			return false;
		}

		if(endDate == ""){
			alert("물품의 마감날짜를 입력하세요.");
			document.fr.endDate.focus();
			return false;
		}
	}
	</script>    
    <!-- 유효성 체크 -->
    
</head>
<body>

    <div class="page-wrapper bg-dark p-t-100 p-b-50">
        <div class="wrapper wrapper--w900">
            <div class="card card-6">
                <div class="card-heading">
                    <h2 class="title">상품 등록</h2>
                </div>
                
                <div class="card-body">
                    <form action ="" method="post" enctype="multipart/form-data"  name="fr">
                    <input type="hidden" name="gno">
                  <div>
                  </div>
                  <div class="form-row">
                     <div class="name">물품분류</div>
                        <select class="bo_w_select" name="category">
                      		<option value="" selected>카테고리 선택</option>
                      		<option value="ddd">가전/디지털</option>
                      		<option value="aaa">의류/뷰티</option>
                      		<option value="ccc">생활용품</option>
                      		<option value="ee">도서/티켓</option>
                      	</select>
                    </div>
                    <div class="form-row">
                      <div class="name">판매자</div>
                         <div class="value">
                             <input class="input--style-6" type="text" name="g_m_id">
                         </div>
                    </div>
                      
                    <div class="form-row">
                       <div class="name">물품제목</div>
                          <div class="value">
                             <input class="input--style-6" type="text" name="gname" >
                          </div>
                       </div>
                        
                    <div class="form-row">
                       <div class="name">물품설명</div>
                           <div class="value"> 
                             <div class="input-group"> 
                                 <!-- <div id="summernote" name="content"> -->
                                      <textarea rows="30" cols="400" name="content" id="summernote"></textarea> 
                                <!--  </div>   -->  
                             </div>  
                           </div>
                       </div>
                    <div class="form-row">
                       <div class="name">첨부 이미지 등록</div>
                          <!-- <div class="value">
                              <div class="input-group js-input-file">
                                    <input class="input-file" type="file" name="file_cv" id="file"> 
                                    <label class="label--file" for="file">파일 선택</label> 
                                   <span class="input-file__info">선택된 파일이 없습니다</span>
                              </div>
                          <div class="label--desc">상품 이미지를 업로드 해주세요. 파일 크기 최대 50M</div>
                       </div> -->
						





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
                     <!--   <div class="name">입찰 일자</div>
                         <div class="value">
                            <input class="input--style-6" type="datetime-local" name="regDate">
                         </div>
                          <script>
                            document.getElementById('regDate').value= new Date().toISOString().slice(0, -1);
                         </script>  -->
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
                             <!-- 콤마 -->
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
                             <!-- 콤마 -->   
                           </div>
                      </div>
                      <div class="card-footer">
                    	<input type="submit" value="물품 등록" onclick="return goods_register()" class="btn btn--radius-2 btn--blue-2" > 
                    	
                      </div>
                  </form>
                </div>
            </div>
        </div>
    </div>

 
   




</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->