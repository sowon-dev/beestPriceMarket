<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<!-- 본문 CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<link href="${pageContext.request.contextPath}/resources/goods/goods_css/goodsDetail.css" rel="stylesheet">
<!-- 본문 JS  -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src='${pageContext.request.contextPath}/resources/goods/goods_js/goodsDetail.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- 수정/삭제 아이콘 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<!-- 상품문의 댓글리스트 -->
<hr>
<div class="review-heading">문의내역</div>
<table id="cmtList">
	<thead>
	<tr>
		<th>순번</th>
		<th>아이디</th>
		<th>문의내용</th>
		<th>작성일</th>
	</tr>
	<c:forEach items="${cmtList}" var="cmt">
		<tr>
			<td>${cmt.c_num}</td>
			<td>${cmt.c_m_id}</td>
			<td>${cmt.c_content}</td>
			<td>${cmt.c_regdate}</td>
		</tr> 
	</c:forEach>
	</thead>
</table>

<script type="text/javascript">	
//댓글쓰기 버튼 클릭시
$("#cmtBtn").click(function(){
	  $.ajax({
		  type: "post", //데이터를 보낼 방식
		  url: "/detail/comment/insert", //데이터를 보낼 url
		  data: {
			c_m_id: document.frCmt.c_m_id.value,
			c_g_gno: document.frCmt.c_g_gno.value,
			c_content: document.frCmt.c_content.value
			  },
	  	  success: function(data){//데이터를 보내는 것이 성공했을 시 출력되는 메시지
	  		  if(data){
				alert("성공적으로 댓글이 작성되었습니다.");
				$("#c_content").val("");
				showCmtList(data);
	          }else{
				alert("댓글작성이 실패했습니다. 다시 시도하세요.")
		      }
	       },
	       error:function(request,status,error){
		       alert("예상치 못한 에러가 발생했습니다. 다시 시도하세요");
	       }
	  });
});//end of 댓글쓰기버튼

//페이지 로딩시 댓글 목록 출력 
$(document).ready(function(){
	showCmtList(); 
});

function showCmtList(){
	$.ajax({
	       type: 'post',
	       url: "/detail/comment/commentListEach",
	       data: {
		       gno: ${goods.gno},
	       },
	       success: function(data) {
		      $('#cmtList').append("<tr><td>"+data.c_num + "</td><td>" + data.c_m_id + "</td><td>" + data.c_content + "</td><td>" + data.c_regdate + "</td></tr>");	
	       }
	});	// Ajax end
}





</script>
</body>