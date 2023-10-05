<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="row" id="changeLoc">
	<div class="col-lg-12">

		<!-- panel heading -->
		<div class="panel-body">

			<div style="padding: 5px 10px; padding-bottom: 20px;">
				<div style="margin-top: 10px">
					<div class="form-group" style="margin-bottom: 10px">
						<h3 style="margin-top: 10px">Bunho</h3>
						<div class="form-control" id='bno'></div>

						<h3>Title</h3>
						<input name="title" id="title" class="form-control" readonly />

						<h3>Content</h3>
						<textarea name="detail" id="detail" rows="3" class="form-control"
							style="height: 75px;"
							placeholder="내용을 입력해 주세요 (최대 400 글자까지 적으실 수 있습니다.)"
							maxlength="400" wrap="hard" readonly></textarea>

						<h3>작성 일자</h3>
						<div name="createDate" class="form-control" id='creDate'></div>

						<h3>수정 일자</h3>
						<div name="changeDate" class="form-control" id='chanDate'>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${board.changeDate}" />
						</div>
					</div>
				</div>
				<div style="float: right; padding-top: 15px;">
					<button onclick="return changeModify()"
						class="btn btn-sm btn-primary">Modify</button>
					<button onclick="location='list'" class="btn btn-sm btn-primary">Return
						Page</button>
				</div>
			</div>
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel-body -->
</div>
