<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<!-- 본문 CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Include the above in your HEAD tag -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<link href="${pageContext.request.contextPath}/resources/goods/goods_css/goodsDetail.css" rel="stylesheet">
<!-- 본문 JS  -->
<script src='${pageContext.request.contextPath}/resources/goods/goods_js/goodsDetail.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- 본문 JS  -->

<!-- 상세페이지 섬네일 슬라이드 -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/goods/goods_css/goodsDetailSlide.css">
<script src='${pageContext.request.contextPath}/resources/goods/goods_js/goodsDetailSlide.js'></script>
<!-- 상세페이지 섬네일 슬라이드 -->

<style type="text/css">

.slide_wrap { position: relative; width: 500px; margin: auto; padding-bottom: 30px; }
.slide_box { width: 100%; margin: auto; overflow-x: hidden; }
.slide_content { display: table; float: left; width: 400px; height: 400px; }

</style>

<style>
	*{margin:0; padding:0;}
a.button{display:inline-block; padding: 10px 20px; text-decoration:none; color:#fff; background:#000; margin:20px;}
#modal{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}
.modal-con{
 width: 1050px;
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 60%;
  min-height: 30%;
  background:#fff;
}
.modal-con .title{
  font-size:20px; 
  padding: 20px; 
  background : #212529;
  color: white; 
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px;
}
.modal-con .close{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#000; font-size:20px; font-weight: bold;
  right:10px; top:10px;
  background-color: white;
}

table#tablList {
  border-collapse: collapse;
  width: 100%;
}

.mo1 th, .mo1 td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  
}
#ppap th, .mo2 th, .mo2 td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  
}

tr:hover {background-color:#f5f5f5;}

.btn_bidding {
  background-color: #212529;
  font: bold;
  color: white;
  transition-duration: 0.4s;
  border: 2px solid;
  border-radius: 5px;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.btn_bidding:hover {
  background-color: white; /* Green */
  color: black;
}

</style>

<script type="text/javascript">
// 수정/삭제 이동  
$(document).ready(function(){

	var gno = $('#gno').val();
			
	$(document).on("click","#modify",function(){
		location.href = '/goods/modify?gno='+gno;
	});

	$(document).on("click","#delete",function(){
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con){
			location.href = '/goods/delete?gno='+gno;
		}	
	});
});
// 수정/삭제 이동 

// 파일 다운로드

function fn_fileDown(fno){
	//alert("파일다운로드 클릭");
	var formObj = $("form[name='form']");
	alert(formObj);
	//$("#fno").attr("value",fno);
	alert(fno);
	//formObj.attr("action", "/goods/fileDown");
	location.href='/goods/fileDown?fno='+fno;
	//formObj.submit();
}

// 파일 다운로드

</script>

</head>
<body>

<!-- 헤더 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더 -->
  
<!-- 본문 -->
<div class="pd-wrap">
	<div class="container">
		<div class="heading-section">경매상품 상세정보</div>   
		<div class="row">
			<!-- 경매정보 이미지 -->   
			<div class="col-md-6">
			<!-- 슬라이드 추가 -->
			<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
				<ol class="carousel-indicators">
            	<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            	<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            	<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          		</ol>
				<div class="carousel-inner" role="listbox">
            	<div class="carousel-item active">
					<img src="<c:url value="/imgUpload/${file[0].f_name}"/>"  style="width:600px; height:400px; !important" class="d-block img-fluid"/>
				</div>
				 <div class="carousel-item">	
					<img src="<c:url value="/imgUpload/${file[1].f_name}"/>" style="width:600px; height:400px; !important" class="d-block img-fluid"/>
				</div>
				<div class="carousel-item">	
					<img src="<c:url value="/imgUpload/${file[2].f_name}"/>" style="width:600px; height:400px; !important" class="d-block img-fluid"/>
				</div>
				</div>
				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
            		<span class="sr-only">Previous</span>
          		 </a>
          		 <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            		<span class="carousel-control-next-icon" aria-hidden="true"></span>
            		<span class="sr-only">Next</span>
          		 </a>
        		</div>	
				
				<c:forEach var="file" items="${file}">
						<%-- <a href="#" onclick="fn_fileDown('${file.fno}'); return false;">${file.f_oname}</a><br> --%>
						<a href="#" onclick="fn_fileDown('${file.fno}'); return false;">저장하기</a><br>
					</c:forEach>
				
				 
			<!-- 슬라이드 추가 끝 -->	
			</div>
			<!-- 경매정보 이미지 끝-->
			<!-- 경매정보 테이블 -->  
			<div class="col-md-6">
				<div class="product-dtl">
				<br><br>
			       <table>
			         <tr>
			         	<th colspan="2" style="font-size:40px;">${goods.gname}  </th>
			         </tr>
			          <tr>
	    				<th>카테고리</th>
	    				<td>${goods.category}</td>
	 				 </tr>
	  				 <tr>
	    				<th>현재입찰가</th>
	    				<td></td>
	 				 </tr>
	  				 <tr>
	    				<th>입찰시작가</th>
	    				<td>${goods.lowestprice}원</td>
	  				 </tr>
	  				
	  				 <tr>
	    				<th>경매기간</th>
	    				<td>${goods.regDate}  ~  ${goods.endDate}</td>
	  				 </tr>
	  				 <tr>
	     			    <th>남은시간</th>
	    				<td></td>
	  				</tr>
	  				<tr>
	     				<th>입찰수</th>
	    				<td><button>입찰기록</button></td>
	  				</tr>
	  				<tr>
	     				<th>판매자</th>
	    				<td>${goods.g_m_id}</td>
	  				</tr>
				</table>
				<!-- 경매정보 테이블 끝--> 
	
<!--************************************************* *입찰하기/관심상품(구매자들만 보이기) 끝 *********************************************************-->
				<c:if test="${ id != goods.g_m_id}">
			        <form action="#" class="display-flex">
		        			<div class="product-count">
		        				  <div id="wrap">
  <a href="javascript:openModal('modal1');" class="button modal-open">입찰하기</a>
</div>
	<div id="modal"></div>
  <div class="modal-con modal1">
    <a href="javascript:;" class="close">X</a>
    <p class="title">입찰현황</p>
    <div class="con">
      <table id="tablList">
      	<thead>
			<tr id="ppap">
				<td class="mo1">입찰한 시간</td>
				<td class="mo1">아이디</td>
				<td class="mo1">입찰가</td>				
			</tr>
			<c:forEach items="${bidList}" var="blist">
			<tr class="mo2">
			    <td class="mo2">${blist.timelog}</td>
			    <td class="mo2">${blist.pm_m_userid}</td>			    
			    <td class="mo2">${blist.pm_g_bidprice}</td>
  			</tr> 
  			</c:forEach>
  					
		</thead>
      </table>     
      <br>
      <input type="number" id="bidprice_input" class="btn_bidding" placeholder="숫자만 입력가능" step="1000"><br>
      <input type="button" id="bidding" class="btn_bidding" value="입찰하기">
    </div>
  </div>
		        				  <a href="#" class="round-black-btn">관심상품</a>
		        				  <a href="${path}/goods/report">신고하기</a>
		        			</div>
		        	</form>
		        </c:if>		
<!--************************************************* *입찰하기/관심상품(구매자들만 보이기) 끝 *********************************************************-->
		        				
				<!-- 수정/삭제(상품 올린 사람만 보이기) -->
				<c:if test="${ id == goods.g_m_id}">
				<form action="" role="form" name="form">
				      	<div class="product-count" >
				      		<input type="hidden" name="gno" id="gno" value="${goods.gno}">
				      		<input type="hidden" id="fno" name="fno" value=""> 
				 		<input type="button"  id="modify" value="수정" class="round-black-btn" style="margin-right:20px;">
				 		<input type="button"  id="delete" value="삭제" class="round-black-btn" >
				 	</div>
				 </form>
				</c:if> 
				<!-- 수정/삭제(상품 올린 사람만 보이기) 끝 -->
		       
	   			</div>
	   		</div>
		</div><!-- row끝-->
	        
	        <!-- 상품 정보, 상품 문의 탭 -->
	        <div class="product-info-tabs">
		        <ul class="nav nav-tabs" id="myTab" role="tablist">
				  	<li class="nav-item">
				    	<a href="#description" class="nav-link active" id="description-tab" data-toggle="tab"  role="tab" aria-controls="description" aria-selected="true" >상품정보</a>
				  	</li>
				  	<li class="nav-item">
				    	<a href="#review" class="nav-link" id="review-tab" data-toggle="tab"  role="tab" aria-controls="review" aria-selected="false" >상품문의</a>
				  	</li>
				</ul>
			
				<!-- 상품정보 -->
				<div class="tab-content" id="myTabContent">
					${goods.content}
				</div>
				<!-- 상품정보 끝-->	
				
<!-- /************************************************************************************************************* -->
			<section class="comment">
			  	<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">  	
			  		<div class="review-heading">문의하기</div>
			  		<form name="frCmt" id="frCmt" method="post">
						<div class="row">
				        	<div class="col-md-6">
				        		<div class="form-group">
								<% 
								String id = (String) session.getAttribute("id"); 
								%>
								<input type="hidden" name="c_g_gno" value="${goods.gno }"/>
								<label>작성자</label>
			       					<input class="form-control" name="c_m_id" value="<%=id %>" readonly>
					        	</div>
					        </div>
						</div>
			       		<label>문의내용</label>
			       	 	<textarea name="c_content" id="c_content" class="form-control" rows="5" placeholder="욕설, 비방 등 적절하지 않은 문의는 삭제될 수 있습니다."></textarea>
					</form>
			       	<button class="round-black-btn" id="cmtBtn">문의하기</button> 
			     	
					<!-- 댓글리스트 -->
					<%@ include file="../goods/comment.jsp" %>
					<!-- 댓글리스트 끝 -->
				</div>
			</section>	  
				
		</div><!-- 상품 정보, 상품 문의 탭 끝 -->
	</div><!-- container 끝 -->
</div><!-- pd-wrap끝 -->
  
<!-- 푸터 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 -->

 <script type="text/javascript">
 
  
 function fillZeros(n, digits) {  
     var zero = '';  
     n = n.toString();  

     if (n.length < digits) {  
         for (i = 0; i < digits - n.length; i++)  
             zero += '0';  
     }  
     return zero + n;  
 }  
   
 function getNowTimeStamp() {  
     var d = new Date();  

     var s = fillZeros(d.getFullYear(), 4) + '-' +  
             fillZeros(d.getMonth() + 1, 2) + '-' +  
             fillZeros(d.getDate(), 2) + ' ' +  
       
             fillZeros(d.getHours(), 2) + ':' +  
             fillZeros(d.getMinutes(), 2) + ':' +  
             fillZeros(d.getSeconds(), 2);  

     return s;  
 } 

 
 function openModal(modalname){
	  document.get
	  $("#modal").fadeIn(300);
	  $("."+modalname).fadeIn(300,function(){
		var list = new Array();		
		<c:forEach items="${addList}" var="alist">
			list.push('${alist.timelog}');
			list.push('${alist.pm_m_userid}');
			list.push('${alist.pm_g_bidprice}');
		</c:forEach>
		});
	}

	$("#modal, .close").on('click',function(){
	  $("#modal").fadeOut(300);
	  $(".modal-con").fadeOut(300);	  
	});
	
	$(document).ready(function(){
		$("#bidding").click(function(){	
			var stack = document.getElementById('bidprice_input').value;
			if((stack%10) != 0){ // 최소 입찰가 단위 10원부터 배팅가능 (1~9원 배팅 X)
				alert("10단위 적어주세요");
				document.getElementById('bidprice_input').focus();
				return false;	
			}
			var info = {"pm_g_gno":${goods.gno},/* 입찰시간 */"pm_m_userid": '${id}'/* 현재 로그인되어있는 아이디(세션) */,"pm_g_bidprice": document.getElementById('bidprice_input').value /* 입찰가 */,"timelog": getNowTimeStamp()/* 입찰한 시간 */};
			var check = confirm("입찰하시겠습니까?");
			if(check){				
				$.ajax({
					url: '/goods/bidding',
					type: 'POST',				
					data: info,					
					success: function(data){															
						if(data.pm_g_bidprice == undefined){
							alert("현재 물품의 최대입찰가 보다 낮습니다.");
							document.getElementById('bidprice_input').focus();
							return;
						}
						/* if(data["pm_g_bidprice"] > info.pm_g_bidprice) */							
						/* alert(info.timelog); */	
						/* $('#ppap').before("<tr><td>"+ date.timelog + "</td><td>" + data["pm_m_userid"] + "</td><td>" + data.pm_g_bidprice +"</td></tr>"); */																
						$('#ppap').after("<tr><td>"+ (info.timelog+".0") + "</td><td>" + info.pm_m_userid + "</td><td>" + info.pm_g_bidprice +"</td></tr>");																
						// alert(data[0].pm_g_gno); 데이터 받아오는 코드					
					},
					error: function(data){
						alert("입찰가를 입력해주세요!");	
						document.getElementById('bidprice_input').focus();				
					}
				});
			} 
			/* alert("입찰테스트"); */			
		});				
	});

	function getExit(){
		location.reload(true);
	}
	
 </script>
 
</body>
</html>