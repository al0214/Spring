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
</style>

<title>Register Page</title>

<div style="margin: 5%">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"
				style="border: 1px; background-color: #570df6; text-align: center; color: white; border-top-right-radius: 20px; border-top-left-radius: 20px; padding: 5px;">Board
				Register</h1>
		</div>
	</div>
	<!-- row -->

	<div class="row" >
		<div class="col-lg-12">

			<!-- panel heading -->
			<div class="panel-body" style="margin: 10px;">
				<strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong>
				<form name="frr" role="form" action="/board/register" method="post"
					onSubmit="return Checkform()" onReset="return Returnform()"
					accept-charset="utf-8">
					<div style="padding: 5px 10px; padding-bottom: 20px;">
						<div style="margin-top: 10px">
							<div class="form-group" style="margin-bottom: 10px">
								<h3>
									Title<span class="t_red">*</span>
								</h3>
								<input name="title" class="form-control" maxlength='30'
									style="width: 80%; outline: none; border: none; font-size: 20px;"
									placeholder="제목을 입력해 주세요 (최대 30 글자까지 적으실 수 있습니다.)">
							</div>
							<div class="form-group">
								<h3>
									Text area<span class="t_red">*</span>
								</h3>
								<textarea name="detail" rows="3" class="form-control"
									style="width: 80%; height: 75px; resize: none; outline: none; border: none; font-size: 20px;"
									placeholder="내용을 입력해 주세요 (최대 400 글자까지 적으실 수 있습니다.)"
									maxlength="400" wrap="hard"></textarea>
							</div>
						</div>
						<div style="margin-top: 10px; float: right;">
							<button type="submit" class="btn btn-sm btn-primary"
								style="border: none; background-color: #570df6; color: white; font-size: 15px;">Submit
								Button</button>
							<button type="reset" class="btn btn-sm btn-primary"
								style="border: none; background-color: #570df6; color: white; font-size: 15px;">Reset
								Button</button>
							<button type="button" onclick="location='list'"
								class="btn btn-sm btn-primary"
								style="border: none; background-color: #570df6; color: white; font-size: 15px;">Return
								Button</button>
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
	function checkSpace(str) {
		if (str.search(/\s/) != -1) {
			return true;
		} else {
			return false;
		}
	}

	function Returnform() {
		alert("리셋합니다.")
		frr.title.focus();
	}

	function Checkform() {

		title = frr.title.value;
		detail = frr.detail.value;

		if (title == "" & detail == "") {
			frr.title.focus();
			alert("제목과 내용을 입력해주세요");

			return false;
		}

		if (frr.title.value == "" || frr.title.value == "&nbsp") {

			frr.title.focus();
			alert("제목을 입력해주세요");

			return false;
		}
		if (frr.detail.value == "") {

			frr.detail.focus();
			alert("내용을 입력해주세요");

			return false;
		}

		title = title.trim();
		detail = detail.trim();

		if (title == "" || detail == "") {
			alert("공백 문자는 입력할 수 없습니다.")
			return false;
		}

	}
</script>

