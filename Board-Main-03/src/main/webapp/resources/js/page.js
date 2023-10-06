function RegisterPage() {
	$.ajax({
		type : 'POST',
		url : "/register/page",
		dataType : "html",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(list) {
			console.log("등록 페이지 호출");
			$('#changeLoc').append(list);
		}
	});
};

function DetailPage() {
	$.ajax({
		type : 'POST',
		url : "/detail/page",
		dataType : "html",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(list) {
			console.log("상세 페이지 호출");
			$('#changeLoc').append(list);
		}
	})
};