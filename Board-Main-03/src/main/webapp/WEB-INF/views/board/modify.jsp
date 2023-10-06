<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<div class="col-lg-12" id="modifyPage">

	<!-- panel heading -->
	<div class="panel-body">
		<strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong>


		<form name="frr" role="form" action="/board/modify/update" method="post"
			onSubmit="return Checkform()" accept-charset="utf-8">
			<div style="padding: 5px 10px; padding-bottom: 20px;">
				<div style="margin-top: 10px">
					<div class="form-group" style="margin-bottom: 10px">
						<h3>Bno</h3>
						<input name='bno' class="form-control" id='bno' readonly></input>
					</div>
					<div class="form-group" style="margin-bottom: 10px">
						<h3>
							Title<span class="t_red">*</span>
						</h3>
						<input name="title" id="title" class="form-control" />
					</div>
					<div class="form-group">
						<h3>
							Text area<span class="t_red">*</span>
						</h3>
						<textarea name="detail" id="detail" rows="3" class="form-control"
							style="height: 75px;"
							placeholder="내용을 입력해 주세요 (최대 400 글자까지 적으실 수 있습니다.)"
							maxlength="400" wrap="hard"></textarea>
					</div>
				</div>
				<div style="margin-top: 10px; float: right;">
					<button type="button" onclick="return updateData()"
						class="btn btn-sm btn-primary">Modify</button>
					<button type="button" onclick="return removeData()"
						class="btn btn-sm btn-primary">Remove</button>

					<button type="button" data-oper='list'
						class="btn btn-sm btn-primary" onclick="return detailPage()">Return
						Page</button>
				</div>
			</div>
		</form>

	</div>
	<!-- end panel-body -->
</div>
<!-- end panel-body -->


