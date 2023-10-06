function Checkform() {

		title = frr.title.value;
		detail = frr.detail.value;

		if (title == "" & detail == "") {
			frr.title.focus();
			alert("제목을 입력해 주세요");

			return 0;
		}

		else if (frr.title.value == "" || frr.title.value == "&nbsp") {

			frr.title.focus();
			alert("제목을 입력해 주세요");

			return 0;
		} else if (frr.detail.value == "") {

			frr.detail.focus();
			alert("내용을 입력해 주세요");

			return 0;
		}

		title = title.trim();
		detail = detail.trim();

		if (title == "" || detail == "") {
			alert("공백 문자는 허용하지 않습니다.")
			return 0;
		}
		
		return 1;
	}