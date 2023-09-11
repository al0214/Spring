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

<!-- Custom Fonts -->


<div style="margin: 5%">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Register</h1>
		</div>
		<!-- col-lg-12 -->
	</div>
	<!-- row -->

	<div class="row">
		<div class="col-lg-12">

			<!-- panel heading -->
			<div class="panel-body">

				<form name="frr" role="form" action="/board/register" method="post"
					onSubmit="return Checkform()" onReset="return Returnform()"
					accept-charset="utf-8">
					<div style="padding: 5px 10px; padding-bottom: 20px;">
						<div style="margin-top: 10px">
							<div class="form-group" style="margin-bottom: 10px">
								<h3>Title</h3>
								<input class="form-control" name="title"
									style="width: 80%; outline: none; border: none; font-size: 20px;"
									placeholder="제목을 입력해 주세요">
							</div>
							<div class="form-group">
								<h3>Text area</h3>
								<textarea name="detail" rows="3" class="form-control"
									style="width: 80%; height : 75px; resize: none; outline: none; border: none; font-size: 20px;"
									placeholder="내용을 입력해 주세요"></textarea>
							</div>
						</div>
						<div style="margin-top: 10px;">
							<button type="submit" class="btn btn-sm btn-primary"
								style="border: none; background-color: #1a73e8; color: white;">Submit</button>
							<button type="reset" class="btn btn-sm btn-primary"
								style="border: none; background-color: #1a73e8; color: white;">Reset
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
	function Checkform() {
		if (frr.title.value == "" & frr.title.value == "&nbsp") {

			frr.title.focus();
			alert("제목을 입력해 주세요");

			return false;
		}
		if (frr.detail.value == "") {

			frr.detail.focus();
			alert("내용을 입력해 주세요");

			return false;
		}
	}

	function Returnform() {
		alert("리셋합니다.")
		frr.title.focus();
	}
</script>

