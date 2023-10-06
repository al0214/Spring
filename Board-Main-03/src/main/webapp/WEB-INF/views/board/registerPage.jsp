<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="col-lg-12" id="registerPage">
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
						<input name="title" class="form-control" maxlength='30'
							style="height: 40px !important;"
							placeholder="제목을 입력해 주세요 (최대 30 글자까지 적으실 수 있습니다.)">
					</div>
					<div class="form-group">
						<h3>
							Text area<span class="t_red">*</span>
						</h3>
						<textarea name="detail" rows="3" class="form-control"
							placeholder="내용을 입력해 주세요 (최대 400 글자까지 적으실 수 있습니다.)"
							maxlength="400" wrap="hard"></textarea>
					</div>
				</div>
				<div style="margin-top: 10px; float: right;">
					<button type="button" class="btn btn-sm btn-primary" id='submit'>Submit
					</button>
					<button type="reset" class="btn btn-sm btn-primary">Reset
					</button>
					<button type="button" onclick="location='list'"
						class="btn btn-sm btn-primary">Return Page</button>
				</div>
			</div>
		</form>

	</div>
	<!-- end panel-body -->
</div>
