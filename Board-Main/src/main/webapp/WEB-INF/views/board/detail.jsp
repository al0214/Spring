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

<title>Detail Page</title>

<div style="margin: 5%">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"
				style="border: 1px; background-color: #570df6; text-align: center; color: white; border-top-right-radius: 20px; border-top-left-radius: 20px; padding: 5px;">Board
				Detail</h1>
		</div>
	</div>
	<!-- row -->

	<div class="row">
		<div class="col-lg-12">

			<!-- panel heading -->
			<div class="panel-body" style="margin: 10px;">

				<div style="padding: 5px 10px; padding-bottom: 20px;">
					<div style="margin-top: 10px">
						<div class="form-group" style="margin-bottom: 10px">
							<h3 style="margin-top: 10px">Bunho</h3>
							<div class="form-control"
								style="width: 80%; height: auto; font-size: 20px;">${board.bno}번
							</div>

							<h3>Title</h3>
							<div class="form-control"
								style="width: 80%; height: auto; font-size: 20px;">${board.title}
							</div>

							<h3>Content</h3>
							<div name="detail" class="form-control"
								style="width: 80%; resize: none; height: auto; font-size: 20px; white-space: pre-line;">
								${board.detail}</div>

							<h3>작성 일자</h3>
							<div name="detail" class="form-control"
								style="width: 80%; resize: none; font-size: 20px;">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${board.createDate}" />
							</div>

							<h3>수정 일자</h3>
							<div name="detail" class="form-control"
								style="width: 80%; resize: none; font-size: 20px;">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${board.changeDate}" />
							</div>
						</div>
					</div>
					<div style="float: right;">
						<button onclick="location='modify?bno=${board.bno}'" class="btn btn-sm btn-primary"
							style="border: none; background-color: #570df6; color: white; font-size: 15px;">Modify
						</button>
						<button onclick="location='list'" class="btn btn-sm btn-primary"
							style="border: none; background-color: #570df6; color: white; font-size: 15px;">Return
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

<script type="text/javascript">
	function Checkform() {
		if (frr.title.value == "" || frr.title.value == "&nbsp") {

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

