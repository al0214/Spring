<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Modify Page</title>
</head>

<style>
	.t_red{
		color:red;
	}
</style>

<div style="margin: 5%">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"
				style="border: 1px; background-color: #570df6; text-align: center; color: white; border-top-right-radius: 20px; border-top-left-radius: 20px; padding: 5px;">Board
				Modify</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<!-- panel heading -->
			<div class="panel-body" style="margin: 10px;">
				<strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong>
				<div style="padding: 5px 10px; padding-bottom: 20px;">
					<div name="bno">
						<h3>bno</h3>
						<div>1번</div>
					</div>
					<div name="title" class="form-group" style="margin-bottom: 10px">
						<h3>title<span class="t_red">*</span></h3>
						<input style="width: 80%; outline: none; border: none; font-size: 20px;"
								placeholder="제목을 입력해 주세요 ( 한글 기준 최대  30글자 )"/>
					</div>
					<div name="content">
						<h3>content<span class="t_red">*</span></h3>
						<div>1번 제목 테스트</div>
					</div>
					<div name="title">
						<h3>Create Date</h3>
						<div>2023-09-14</div>
						<h3>Change Date</h3>
						<div>2023-09-15</div>
					</div>
					<br>
					<!-- list -> detail로 변경해야 함 -->
					<div>
						<button onclick="javascript:btn('Modify')">Modify</button>
						<button onclick="javascript:btn('Remove')">Remove</button>
						<button onclick="location='list'" class="btn btn-sm btn-primary"
							style="border: none; background-color: #1a73e8; color: white; font-size: 15px;">Return
							Button</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function btn(sample) {
		alert(sample + '가 클릭 되었습니다.');
	}
</script>