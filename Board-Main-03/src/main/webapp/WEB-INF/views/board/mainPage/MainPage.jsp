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
<script type="text/javascript" src="/resources/js/checkform.js"></script>
<script type="text/javascript" src="/resources/js/page.js"></script>
<script type="text/javascript" src="/resources/js/board.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		ListPage();
		ListData(1);
		RegisterPage();
		DetailPage();
	});

	var result = '<c:out value="${result}"/>';

	checkModal(result);

	history.replaceState({}, null, null)

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

	// Register 페이지 이동
	function OnClickNew() {
		console.log("click");
		$('.page-header').text("Board Register");
		$('#listPage').attr("style", "display:none;");
		$('#registerPage').removeAttr("style")

	}

	// Register 페이지 Reset 버트
	function Returnform() {
		console.log("Reset");
	}

	// Register 등록
	function OnClickSubmit() {
		check = Checkform(0);
		console.log("확인 " + check);
		if (check == 1) {
			var formm = {
				title : $("#title").val(),
				detail : $("#detail").val()
			}

			console.log(formm);

			$.ajax({
				type : 'POST',
				url : "/register",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(formm),
				success : function() {
					console.log("등록");
					ListData(1);
					rest();
					$('.page-header').text("Board List");
					$("#registerPage").attr("style", "display:none;");
					$("#listPage").removeAttr("style");
				},
				error : function() {
					console.log("등록 페이지 에러")
				}

			})

		} else if (check == 0) {
			alert("오류 다시 시도해주세요!");
			return;
		} else {
			alert("오류 다시 시도해주세요!");
			return;
		}

	};

	var c = 0;

	function rest() {
		$("#title").val("");
		$("#detail").val("");
	}

	// Return 버튼 함수
	function OnClickReturn(c) {
		if (c == 0) {
			$('.page-header').text("Board List");
			$("#registerPage").attr("style", "display:none;");
			$("#detailPage").attr("style", "display:none;");
			$("#listPage").removeAttr("style");
		}
	}

	// 전체 데이터 삭제 함수
	function OnDelBtn() {
		$.ajax({
			type : 'DELETE',
			url : "/remove/all"
		}).done(function() {
			console.log("모든 데이터가 삭제 되었습니다.");
			ListData(1);
		})
	}

	// Detail 페이지 호출
	var a = 0;
	var j = 0;

	function PageDetail(j) {
		$(".page-header").html("Board Detail");
		$("#listPage").attr("style", "display:none;");
		$("#detailPage").removeAttr("style");
		PageData(j);
	};

	function PageData(a) {
		creDateStr = "";
		chanDateStr = "";

		$.ajax({
			type : 'GET',
			url : "/detail/" + a + ".json",
			dataType : "json",
			success : function(list) {
				creDateStr += "<div>"
						+ BoardService.displayTime(list.createDate) + "</div>";

				chanDateStr += "<div>"
						+ BoardService.displayTime(list.changeDate) + "</div>";
				console.log(list.bno, list.title, list.detail)
				$("#bno").attr('value', list.bno);
				$("#title").attr('value', list.title);
				$("#detail").html(list.detail);
				$("#creDate").html(creDateStr);
				$("#chanDate").html(chanDateStr);
				$("#bno2").last().attr('value', list.bno);
				$("#title2").attr('value', list.title);
				$("#detail2").html(list.detail);
			},
			error : function(){
				console.log("에러");
			}
		})

	};

	var b = 0;

	//  Modify 페이지 화면 변경 요청
	function changePage(b) {

		if (b == 0) {
			$(".page-header").html("Board Modify");
			$("#detailPage").attr("style", "display:none");
			$("#modifyPage").removeAttr("style");
			PageData(1);
		} else if (b == 1) {
			$(".page-header").html("Board Detail");
			$("#modifyPage").attr("style", "display:none");
			$("#detailPage").removeAttr("style");
		} else {
			alert("잘못된 접근 입니다.");
		}
	};

	//  테이블 수정 요청 
	function updateData() {
		var formm = {
			bno : $("#bno").val(),
			title : $("#title2").val(),
			detail : $("#detail2").val()
		}

		$.ajax({
			type : 'PUT',
			url : "/modify/update",
			data : JSON.stringify(formm),
			contentType : "application/json; charset=utf-8",
			success : function() {
				$('.page-header').text("Board List");
				$("#modifyPage").attr("style", "display:none;");
				$("#listPage").removeAttr("style");
				ListData(1);
			},
			error : function() {
				alert("요청이 성공하지 못했습니다");
			}
		})
	};

	// 	 테이블 삭제 요청 
	function removeData() {
		$.ajax({
			type : 'DELETE',
			url : "/remove/" + $("#bno").val(),
			contentType : "application/json; charset=utf-8",
			success : function() {
				console.log($("#bno").val() + "번이 삭제되었습니다");
				$('.page-header').text("Board List");
				$("#modifyPage").attr("style", "display:none;");
				$("#listPage").removeAttr("style");
				ListData(1);
			},
			error : function() {
				alert("요청이 성공하지 못했습니다");
			}
		})
	};
</script>


</html>