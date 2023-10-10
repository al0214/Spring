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

.panel-body {
	padding: 6px 0 0 0px !important;
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
	font-size: 18px;
}
</style>

<title>Register Page</title>

<div style="margin: 5%">

	<div class="col-lg-12" style="padding: 0px">
		<h1 class="page-header">Board Register</h1>
	</div>

	<!-- row -->

	<div class="row">
		<div class="col-lg-12">

			<!-- panel heading -->
			<div class="panel-body">
				<strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong>
				<form name="frr" role="form" action="/board/register" id='form'
					enctype="application/json" method="post"
					onReset="return Returnform()">
					<div style="padding: 5px 10px; padding-bottom: 20px;">
						<div style="margin-top: 10px">
							<div class="form-group" style="margin-bottom: 10px">
								<h3>
									Title<span class="t_red">*</span>
								</h3>
								<input name="title" class="form-control" maxlength='30'
									style="height: 40px !important;"
									placeholder="제목을 입력해 주세요 (최대 30 글자까지 적으실 수 있습니다.)">
							</div>
							<div class="form-group">
								<h3>
									Text area<span class="t_red">*</span>
								</h3>
								<textarea name="detail" rows="3" class="form-control"
									placeholder="내용을 입력해 주세요 (최대 400 글자까지 적으실 수 있습니다.)"
									maxlength="400" wrap="hard"></textarea>
							</div>
							<div class="form-group">
								<h3>Attachment</h3>
								<input type='file' name='files'>
							</div>
						</div>
						<div style="margin-top: 10px; float: right;">
							<button type="button" class="btn btn-sm btn-primary" id='submit'>Submit
							</button>
							<button type="reset" class="btn btn-sm btn-primary">Reset
							</button>
							<button type="button" onclick="location='list'"
								class="btn btn-sm btn-primary">Return Page</button>
						</div>
					</div>
				</form>

			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- row -->

<script type="text/javascript">
	$(function() {
		$('#submit').on("click", function() {
			if (Checkform() == 1) {
				var formm = {
					title : frr.title.value,
					detail : frr.detail.value
				}
				
				console.log(frr.files.value);
				console.log(formm);

				$.ajax({
					type : 'POST',
					url : "/register",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify(formm)
				}).done(function() {
					console.log("등록");
				// 	location.href = 'list';
				})
			} else {
				return;
			}

		})
	});
	function checkSpace(str) {
		if (str.search(/\s/) != -1) {
			return true;
		} else {
			return false;
		}
	};

	function Returnform() {
		alert("리셋합니다.")
		frr.title.focus();
	};

	function Checkform() {

		title = frr.title.value;
		detail = frr.detail.value;

		if (title == "" & detail == "") {
			frr.title.focus();
			alert("제목을 입력해 주세요");

			return 0;
		}

		else if (frr.title.value == "" || frr.title.value == "&nbsp") {

			frr.title.focus();
			alert("제목을 입력해 주세요");

			return 0;
		} else if (frr.detail.value == "") {

			frr.detail.focus();
			alert("내용을 입력해 주세요");

			return 0;
		}

		title = title.trim();
		detail = detail.trim();

		if (title == "" || detail == "") {
			alert("공백 문자는 허용하지 않습니다.")
			return 0;
		}

		return 1;
	}
</script>

