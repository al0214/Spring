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

.pagination>.active>a {
	z-index: 3;
	color: #fff;
	cursor: default;
	background-color: #570df6 !important;
	border-color: #570df6 !important;
}
</style>
<html>

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>List Page</title>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>

<body style="margin: 5%">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board List</h1>
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
						style="float: right; border: none; background-color: #570df6; color: white; border-radius: 4px;">Register
						New Board</button>

				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover"
						style="border-collapse: collapse; text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center;">#번호</th>
								<th style="text-align: center;">제목</th>
								<th style="text-align: center;">작성일</th>
								<th style="text-align: center;">마지막 수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${board.bno}" /></td>
									<td><a class="move"
										href="/board/detail?bno=<c:out value="${board.bno}" />"><c:out
												value="${board.title}" /></a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.createDate}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.changeDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

					<!-- 모달 추가 -->
					<div id="myModal" class="modal fade" id="myModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Modal title</h4>
								</div>
								<div class="modal-body">처리가 완료되었습니다.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal"
										style="border: none; background-color: #1a73e8; color: white; border: none; background-color: #570df6; color: white;">Close</button>
								</div>
							</div>
						</div>
					</div>


					<div style="text-align: center;">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button"><a
									href="${pageMaker.startPage -1}">Prev</a></li>
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
	$(document).ready(
			function() {

				var result = '<c:out value="${result}"/>';

				checkModal(result);
				
				history.replaceState({}, null, null)
							
				function checkModal(result) {

					if (result === '' || history.state	) {
						return;
					}

					if (parseInt(result) > 0) {
						console.log("여기 들어옴")
						$(".modal-body").html(
								"게시글 " + parseInt(result) + " 번이 등록되었습니다,");
					}
					$("#myModal").modal("show");
				};

				$("#regBtn").on("click", function() {
					self.location = "/board/register";
				});

				var actionForm = $("#actionForm");

				$(".paginate_button a").on(
						"click",
						function(e) {

							e.preventDefault();

							console.log('click');
							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							actionForm.submit();

						});

				
			});
	
			
			
			
</script>

</html>