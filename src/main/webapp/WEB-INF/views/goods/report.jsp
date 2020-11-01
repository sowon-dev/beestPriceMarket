<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
 <!-- 헤더 -->
  <jsp:include page="../inc/top.jsp"/>
 <!-- 헤더 -->
 
 <!-- Page Content -->
 <div class="container">
   <div class="row">
     <div class="col-lg-3">
       <h1 class="my-4">신고하기</h1>
       <div class="list-group">
       </div>
     </div>
     <div class="col-lg-9">
		<fieldset>
			<legend>신고하기</legend>
			<form method="post" action="/goods/report">
			신고물품: <input type="text" value="${reportVO.gname }" readonly>	<br>
			판매자: <input type="text" value="${reportVO.g_m_id }" readonly>	<br>
			신고자: <input type="text" value="${id }" readonly>	<br>
			<b>여러사유에 해당되는 경우, 대표적인 사유 1개를 선택해주세요.</b><br>
			<input type="radio" name="radio" id="r1" value="1" checked> 위법성 상품 <br>
			<input type="radio" name="radio" id="r2" value="0"> 반복적인 상품게시(도배)<br>
			<input type="radio" name="radio" id="r3" value="-1"> 기타<br>
			<div>
		 		<textarea cols="30" rows="10" name="text" disabled></textarea>
			</div>
			<input type="submit">
			</form>
		</fieldset>
	</div>
<script type="text/javascript">
$(document).ready(function(){
	 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=radio]").click(function(){
    	if($("input[name=radio]:checked").val() == "1"){
            $("textarea[name=text]").attr("disabled",true);
            // radio 버튼의 value 값이 1이라면 활성화
        }else if($("input[name=radio]:checked").val() == "0"){
              $("textarea[name=text]").attr("disabled",true);
            // radio 버튼의 value 값이 0이라면 비활성화
        }else if($("input[name=radio]:checked").val() == "-1"){
              $("textarea[name=text]").attr("disabled",false);
	            // radio 버튼의 value 값이 0이라면 비활성화
    });
});
</script>


</body>
</html>