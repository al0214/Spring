<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>List Page</title>

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	
</script>


<style>
th {
	text-align: center !important;
}

th, td {
	border: 1px solid black;
}

.pagination>.active>button {
	z-index: 3;
	color: #fff !important;
	cursor: default;
	background-color: #570df6 !important;
	border-color: #570df6 !important;
}

.pagination>li>a {
	border: none;
	background-color: white;
	color: 570df6;
	border: none;
}

#NEO {
	position: relative;
	float: left;
	padding: 6px 12px;
	margin-left: -1px;
	line-height: 1.42857143;
	color: #337ab7;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #ddd;
}

.click-btn {
	border: none;
	background-color: white;
	color: 570df6;
	border: none;
}

.Next {
	border: none !important;
	background-color: white;
	color: 570df6;
	border: none;
}

.Prev {
	border: none !important;
	background-color: white;
	color: 570df6;
	border: none;
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
</style>

</head>
<body>
	<div style="margin: 5%">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"></h1>
			</div>
		</div>
		<div class="row" id="changeLoc"></div>
	</div>
</body>
<script type="text/javascript" src="/resources/js/board.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		ListPage();
		showList(1);
	});
	function ListPage() {
		$.ajax({
			type : 'POST',
			url : "/list",
			dataType : "html",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(list) {
				$(".page-header").html("Board List");
				$('#changeLoc').html(list);
			}
		})
	};

	var result = '<c:out value="${result}"/>';

	checkModal(result);

	history.replaceState({}, null, null)

	var BoardPageUL = $(".ListPage");
	var BoardTotal = $(".Total");
	var BoardPaging = $(".pagination")
	

	function showList(page) {
		BoardService
				.getList(
						{
							page : page
						},
						function(list) {
							var str = "";
							var strr = "";
							DaTe = list.TableData.data
							if (list == null || list.length == 0) {

								BoardPageUL.html("");
								BoardTotal.html("");

								return;
							}

							// 총 게시물 개수 출력
							BoardTotal.html("총 게시물 개수는 : "
									+ list.ListData.total + "")

							// 테이블 출력
							for (var i = 0, len = DaTe.length || 0; i < len; i++) {
								str += "<tr>"
								str += "<td>" + DaTe[i].bno + "</td>";
								str += "<td><a href='detail/" + DaTe[i].bno +"'>"
										+ DaTe[i].title + "</a></td>";
								str += "<td>"
										+ BoardService
												.displayTime(DaTe[i].createDate)
										+ "</td>";
								str += "<td>"
										+ BoardService
												.displayTime(DaTe[i].changeDate)
										+ "</td>";
								str += "</tr>";
							}

							BoardPageUL.html(str);

							var startPa = (list.ListData.pageDTO.startPage);
							var endPa = (list.ListData.pageDTO.endPage);

							if ((list.ListData.pageDTO.prev) == true) {
								strr += "<li class=paginate_button previous>";
								strr += "<button class='Prev'>Prev</a></li>";
							}

							for (var i = startPa; i <= endPa; i++) {
								var tf = (list.ListData.pageDTO.cri.pageNum == i ? "'paginate_button active'"
										: "paginate_button");
								strr += "<li class="+ tf +">";
								console.log(i)
								strr += "<button id="+ i +" class='click-btn'>"
										+ i + "</button></li>";
							}

							if ((list.ListData.pageDTO.next) == true) {
								strr += "<li class='paginate_button next' style='float:right'>";
								strr += "<button class='Next'>Next</button></li>"
							}

							BoardPaging.html(strr);

							$(".click-btn").on("click", function(e) {
								a = e.target.id;
								showList(a)

							});
							$(".Next").on("click", function() {
								a = endPa + 1;
								showList(a)

							});
							$(".Prev").on("click", function() {
								a = startPa - 1;
								showList(a)

							});
						});
	}

	function checkModal(result) {

		if (result === '' || history.state) {
			return;
		}

		if (parseInt(result) > 0) {
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다,");
		}
		$("#myModal").modal("show");
	};

	$("#regBtn").on("click", function() {
		self.location = "/register";
	});

	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e) {

		e.preventDefault();

		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();

	});

	$(".btn_N").on("click", function() {
		console.log("등록 페이지 이동")
		location.href = 'register'
	});

	function OnDelBtn() {
		$.ajax({
			type : 'DELETE',
			url : "list"
		}).done(function() {
			console.log("모든 데이터가 삭제 되었습니다.");
			showList(1);
		})
	}
</script>


</html>