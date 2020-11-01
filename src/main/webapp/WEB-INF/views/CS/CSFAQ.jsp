<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>베프마켓 - 친구같은 경매플랫폼</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/cs/cs_css/bootstrap.min.css" rel="stylesheet">
<!-- 버튼 CSS -->
<link href="${pageContext.request.contextPath}/resources/cs/cs_css/button-reg_goods.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/cs/cs_css/shop-homepage.css" rel="stylesheet">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp" />
	<!-- 헤더 -->

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- 상품 카테고리 메뉴바 -->
			<div class="col-lg-3">

				<h1 class="my-4">Shop Name</h1>
				<div class="list-group">
					<a href="/CS/CSFAQ" class="list-group-item">FAQ</a>
					<a href="/CS/register" class="list-group-item">1:1 문의</a>
					<a href="/CS/CSBoardListPage?num=1" class="list-group-item">나의 문의 보기</a>

				</div>
			</div>
			<!-- 상품 카테고리 메뉴바 -->

			<div class="col-lg-9">

<pre>
FAQ 모음
경매 :
1. Q) 입찰은 어떻게 하나요?
   A) 상품 상세 페이지에서 금액을 입력하시고 입찰하기 버튼을 클릭하시면 됩니다.

2. Q) 입찰 내역은 어디서 확인하나요?
   A) 마이페이지 -> 나의 경매에서 확인할 수 있습니다.

3. Q) 비회원으로 경매가 가능한가요?
   A) 저희 사이트는 회원제로 운영이 되기 때문에 회원가입을 해주셔야 입찰이 가능합니다.

결제 : 
1. Q)  결제는 어디서 하나요?
   A) 마이페이지 

2. Q) 결제방법은 어떤게 있나요?
   A) 결제는 카카오페이로 가능하십니다.

나의 정보 : 
1. Q) 정보수정은 어떻게 하나요?
   A) 마이페이지 -> 정보수정에서 할 수 있습니다.

2. Q) 회원 탈퇴는 어떻게 하나요?
   A) 마이페이지 -> 회원탈퇴에서 할 수 있습니다.

3. Q) 회원 등급은 없나요?
   A) 아직 회원 등급제는 없습니다.

4. Q) 마일리지 적립은 없나요?
   A) 아직 마일리지 제도는 없습니다.

5) Q) 1:1문의글은 저만 볼 수 있나요?
   A) 네 1:1문의글은 로그인 하신 아이디로만 볼 수 있습니다.
   </pre>
			</div>

			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- 푸터 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터 -->
	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>