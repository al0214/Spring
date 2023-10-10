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
}

.btn {
	border: none;
	background-color: #570df6;
	color: white;
	font-size: 20px;
}
</style>

<title>Detail Page</title>

<div style="margin: 5%">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"></h1>
		</div>
	</div>
	<!-- row -->

	<div class="row" id="changeLoc"></div>
	<!-- end panel -->
</div>
<!-- row -->
<script type="text/javascript" src="/resources/js/board.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// Detail&Modify 페이지 호출
		DetailPage();
		// 데이터 불러옴
		PageData(0);

	});

	// Detail 페이지 호출
	function DetailPage() {
		$.ajax({
			type : 'POST',
			url : "/detail/page",
			dataType : "html",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(list) {
				$('#changeLoc').html(list);
			}
		})
	}
	var a = 0;
	
	function PageData(a) {
		creDateStr = "";
		chanDateStr = "";

		$.ajax({
			type : 'GET',
			url : "/detail/${bno}.json",
			dataType : "json"
		}).done(
				function(list) {

					creDateStr += "<div>"
							+ BoardService.displayTime(list.createDate)
							+ "</div>";
					chanDateStr += "<div>"
							+ BoardService.displayTime(list.changeDate)
							+ "</div>";
					if (a == 0){
						
						console.log("지나감");
						$(".page-header").html("Board Detail");
						$("#bno").attr('value', list.bno);
						$("#title").attr('value', list.title);
						$("#detail").html(list.detail);
						$("#creDate").html(creDateStr);
						$("#chanDate").html(chanDateStr);
					} else if (a == 1){
						console.log("밑으로 지나감");
						$(".page-header").html("Board Modify");
						$("#bno2").last().attr('value', list.bno);
						$("#title2").attr('value', list.title);
						$("#detail2").html(list.detail);
					} else {
						alert("잘못된 접근 입니다.");
					}

				})
	};
	
	var b = 0;
	//  테이블 Modify 변경 요청 
	function changePage(b) {
		
		if (b == 0){
			$("#detailPage").attr("style", "display:none");
			$("#modifyPage").removeAttr("style");
			PageData(1);
		} else if(b == 1){
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
			title : frr.title.value,
			detail : frr.detail.value
		}

		$.ajax({
			type : 'PUT',
			url : "/modify/update",
			data : JSON.stringify(formm),
			contentType : "application/json; charset=utf-8",
			success : function() {
				console.log("수정");
				location.replace('/list');
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
			url : "/modify/delete/" + $("#bno").val(),
			contentType : "application/json; charset=utf-8",
			success : function() {
				console.log($("#bno").val() + "번이 삭제되었습니다");
				location.replace('/list');
			},
			error : function() {
				alert("요청이 성공하지 못했습니다");
			}
		})
	};
</script>

