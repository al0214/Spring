<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="col-lg-12" id="registerPage" style="display:none;">
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
						<input id="title" name="title" class="form-control" maxlength='30'
							style="height: 40px !important;"
							placeholder="제목을 입력해 주세요 (최대 30 글자까지 적으실 수 있습니다.)">
					</div>
					<div class="form-group">
						<h3>
							Text area<span class="t_red">*</span>
						</h3>
						<textarea id="detail" name="detail" rows="3" class="form-control"
							placeholder="내용을 입력해 주세요 (최대 400 글자까지 적으실 수 있습니다.)"
							maxlength="400" wrap="hard"></textarea>
					</div>
				</div>
				<div style="margin-top: 10px; float: right;">
					<button type="button" class="btn btn-sm btn-primary" onclick="return OnClickSubmit()">Submit
					</button>
					<button type="button" onclickk="return reset()" class="btn btn-sm btn-primary">Reset
					</button>
					<button type="button" onclick="return OnClickReturn(0)"
						class="btn btn-sm btn-primary">Return Page</button>
				</div>
			</div>
		</form>

	</div>
	<!-- end panel-body -->
</div>
