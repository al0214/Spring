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
.UserRegTitle {
	margin-top: 10px !important;
}

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
	margin-bottom: 10px;
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

	<!-- row -->
	<div class="col-lg-12" id="loginPage" style="padding: 0px;">
		<h1>Login</h1>
		<h2>
			<c:out value="${error}" />
		</h2>
		<h2>
			<c:out value="${logout}" />
		</h2>
		<form name="frr" role="form" onSubmit="return Checkform()"
			method='post' action='/login'>
			<div>
				<input class="form-control" type='text' name='username'
					value='admin' placeholder="ID">
			</div>

			<div>
				<input class="form-control" type='password' name='password'
					value='admin' placeholder="Password">
			</div>

			<div>
				<input type='checkbox' name='remember-me'>Remember ME <a
					id='userRegister' style='float: right;'>회원 가입</a>
			</div>

			<div>
				<input type='submit' style='margin-top: 10px;'
					class="btn btn-sm btn-primary">
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>
	</div>

</div>

<script type="text/javascript">
	$("#userRegister").on('click', function() {
		location.replace('/userRegister')
	})
</script>
