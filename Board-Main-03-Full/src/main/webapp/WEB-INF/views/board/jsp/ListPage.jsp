<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="col-lg-12" id="listPage">
	<div class="panel panel-default">
		<div class="panel-heading" style="margin-bottom: 10px">
			Board List Page
			<button onclick="return OnClickNew()"
				style="float: right; border: none; background-color: #570df6; color: white; border-radius: 4px;">Register
				New Board</button>
		</div>


		<div
			style="float: right; padding-bottom: 5px; padding-right: 16px; font-weight: bold;">

			<div class="Total" style="display: inline;"></div>
			<button onclick="OnDelBtn()" style="border: none;">X</button>
		</div>


		<!-- /.panel-heading -->
		<div class="panel-body">
			<table class="table table-striped table-bordered table-hover"
				style="border-collapse: collapse; text-align: center;">
				<thead>
					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>
				<tbody class="ListPage">
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
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>


			<div style="text-align: center;">
				<ul class="pagination">

				</ul>
			</div>
			<!-- /.table-responsive -->
		</div>
	</div>
	<!-- /.panel -->
</div>