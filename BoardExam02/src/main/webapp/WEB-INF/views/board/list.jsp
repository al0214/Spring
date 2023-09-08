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

<title>Board</title>


<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
</head>

<body style="margin: 5%">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Tables</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading" style="margin-bottom: 20px">
					Board List Page
					<button onclick="location='register'"
						style="float: right; border: none;">Register New Board</button>

				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover"
						style="border-collapse: collapse; text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center;">#번호</th>
								<th style="text-align: center;">제목</th>
								<th style="text-align: center;">내용</th> <!-- 상세 페이지 만들기 전 내용 확인 -->
								<th style="text-align: center;">작성일</th>
								<th style="text-align: center;">수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${board.bno}" /></td>
									<td><a href="get"><c:out value="${board.title}" /></a></td>
									<td><c:out value="${board.detail }"/></td> <!-- 상세 페이지 만들기 전 내용 확인 -->
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.createDate}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.changeDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

					<div style="text-align: center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button"><a
									href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""}">
									<a href="${num}"> ${num} </a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage +1}"> Next </a></li>
							</c:if>
						</ul>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
				<form id='actionForm' action="/board/list" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum}'> <input type='hidden'
						name='amount' value='${pageMaker.cri.amount}'>
				</form>
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</body>
<script type="text/javascript">
	$(document).ready(function() {

		var result = '<c:out value="${result}"/>';

		$("#regBtn").on("click", function() {
			self.location = "/board/register";
		});

		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {

			e.preventDefault();

			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();

		})

	})
</script>

</html>