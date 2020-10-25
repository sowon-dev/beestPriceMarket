<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<title>글쓰기</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-lg-0"></div>
			<div class="col-lg-12">
				<div class="card shadow">
					<div class="card-body">
						<form action="#" method="post">

							<div class="form-group row">
								<label for="a4" class="col-sm-2 text-sm-right">문의 유형</label>
								<div class="col-sm-8">
									<select class="form-control" id="a4">
										<option value="1">계정 문의</option>
										<option value="2">결제 문의</option>
										<option value="3">배송 문의</option>
										<option value="4">기타 문의</option>
									</select>
								</div>
							</div>

							<hr />

							<div class="form-group row">
								<label for="a1" class="col-sm-2 text-sm-right">문의 제목</label>
								<div class="col-sm-8">
									<input type="text" id="a1" class="form-control" />
								</div>
							</div>

							<hr />

							<div class="form-group row">
								<label for="a2" class="col-sm-2 text-sm-right">글 작성자</label>
								<div class="col-sm-8">
									<input type="password" id="a2" class="form-control" />
								</div>
							</div>

							<hr />
							<div class="form-group row">
								<label for="a1" class="col-sm-2 text-sm-right">문의 내용</label>
								<div class="col-sm-8">
									<textarea id="a3" class="form-control" rows="15"
										style="resize: none"></textarea>
								</div>
							</div>

							<hr />
							<div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-4">
									<button type="button" class="btn btn-primary btn-block">작성하기</button>
								</div>
								<div class="col-lg-4">
									<button type="button" class="btn btn-info btn-block">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-0"></div>
		</div>
	</div>

</body>
</html>