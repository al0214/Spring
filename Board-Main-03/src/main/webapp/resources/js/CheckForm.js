function Checkform() {

		title = frr.title.value;
		detail = frr.detail.value;

		if (title == "" & detail == "") {
			frr.title.focus();
			alert("������ �Է��� �ּ���");

			return 0;
		}

		else if (frr.title.value == "" || frr.title.value == "&nbsp") {

			frr.title.focus();
			alert("������ �Է��� �ּ���");

			return 0;
		} else if (frr.detail.value == "") {

			frr.detail.focus();
			alert("������ �Է��� �ּ���");

			return 0;
		}

		title = title.trim();
		detail = detail.trim();

		if (title == "" || detail == "") {
			alert("���� ���ڴ� ������� �ʽ��ϴ�.")
			return 0;
		}
		
		return 1;
	}