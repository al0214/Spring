<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<style>
.t_red {
	color: red;
}

.panel-body {
	padding: 0px;
}

.page-header {
	margin: 40px 0px 0px;
	border: 1px;
	background-color: #570df6 !important;
	text-align: center;
	color: white;
	border-top-right-radius: 20px;
	border-top-left-radius: 20px;
	padding: 5px;
}

.form-control {
	
	width: 100%;
	resize: none;
	outline: none;
	border: none;
	font-size: 20px;
	background-color: #d9d9d9cc !important;
	height: 40px;
}

.btn {
	border: none;
	background-color: #570df6;
	color: white;
	font-size: 20px;
}
</style>

<title>Detail Page</title>

<div style="margin: 5%">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Detail</h1>
		</div>
	</div>
	<!-- row -->

	<div class="row">
		<div class="col-lg-12">

			<!-- panel heading -->
			<div class="panel-body">

				<div style="padding: 5px 10px; padding-bottom: 20px;">
					<div style="margin-top: 10px">
						<div class="form-group" style="margin-bottom: 10px">
							<h3 style="margin-top: 10px">Bunho</h3>
							<div class="form-control" id='form-control-css'>${board.bno}번
							</div>

							<h3>Title</h3>
							<div class="form-control" id='form-control-css'>${board.title}
							</div>

							<h3>Content</h3>
							<textarea name="detail" id="detail" rows="3" class="form-control"
								style="height: 75px;"
								placeholder="내용을 입력해 주세요 (최대 400 글자까지 적으실 수 있습니다.)"
								maxlength="400" wrap="hard" readonly>${board.detail}</textarea>

							<h3>작성 일자</h3>
							<div name="createDate" class="form-control">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${board.createDate}" />
							</div>

							<h3>수정 일자</h3>
							<div name="changeDate" class="form-control">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${board.changeDate}" />
							</div>
						</div>
					</div>
					<div style="float: right; padding-top: 15px;">
						<button onclick="location='modify?bno=${board.bno}'"
							class="btn btn-sm btn-primary">Modify</button>
						<button onclick="location='list'" class="btn btn-sm btn-primary">Return
							Page</button>
					</div>
				</div>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- row -->

