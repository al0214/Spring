<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<style>
th {
	text-align: center;
}

th, td {
	border: 1px solid black;
}
</style>

<html>

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Get Page</title>

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<style>
th {
	text-align: center;
}
</style>

<body>
	<div style="margin: 5%">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Board Detail</h1>
			</div>
			
		</div>
		<div class="row">
			<div class="col-lg-12">
				<form id="boardForm" name="boardForm">
					<table class="table table-striped table-bordered table-hover"
						style="border-collapse: collapse; text-align: center; bold:none;">

						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tbody id="tbody">
							<tr>
								<th>제목</th>
								<td>${board.title}</td>
								<th>번호</th>
								<td>${board.bno}</td>
							</tr>
							<tr>
								<th>작성 일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.createDate}" /></td>
								<th>수정 일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.changeDate}" /></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan='3'><c:out value="${board.detail}"/></td>
							</tr>
						</tbody>
					</table>
				</form>
				<div style="float: right;">
					<button onclick="location='modify'" class="btn btn-sm btn-primary"
						style="border: none; background-color: #1a73e8; color: white; font-size: 15px;">Modify
						Button</button>
					<button onclick="location='list'" class="btn btn-sm btn-primary"
						style="border: none; background-color: #1a73e8; color: white; font-size: 15px;">Return
						Page</button>
				</div>

			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	
</script>