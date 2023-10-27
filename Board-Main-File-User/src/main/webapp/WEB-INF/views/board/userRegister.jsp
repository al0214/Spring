<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

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
	padding: 6px 0 0 0px !important;
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

<title>Login Page</title>

<div style="margin: 15%">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board User Register</h1>
		</div>
	</div>
	<!-- row -->
	<div class="col-lg-12" id="modifyPage" style="padding: 0px;">
		<form name="frr" role="form" onSubmit="return Checkform()"
			accept-charset="utf-8">
			<h2 style='margin-top: 10px !important;'>Nick Name</h2>
			<input class="form-control" placeholder="ID" id='bno2'
				style='margin-bottom: 10px;' />
			<h2>ID</h2>
			<input class="form-control" placeholder="Password" id='bno2'
				style='margin-bottom: 10px;' />
			<h2>Password</h2>
			<input class="form-control" placeholder="ID" id='bno2'
				style='margin-bottom: 10px;' />
			<div id="but" style="margin-top: 10px;">
				<button type="button" onclick="return updateData()"
					style="margin-top: 10px; text-align: center; padding: 0; width: 100%; border-bottom-right-radius: 20px; border-bottom-left-radius: 20px; padding: 10px;"
					class="btn btn-sm btn-primary">회원 가입</button>
			</div>
		</form>
	</div>

</div>

