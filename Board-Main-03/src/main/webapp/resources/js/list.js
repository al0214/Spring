
// List Page 불러옴
function ListPage() {
	$.ajax({
		type : 'POST',
		url : "/list",
		dataType : "html",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(list) {
			$(".page-header").html("Board List");
			$('#changeLoc').html(list);
		}
	})
};

function ListData(page) {
	$
			.ajax({
				url : "/list/" + page + ".json",
				data : page,
				dataType : "json",
				type : "GET"
			})
			.done(
					function(list) {
						var str = "";
						var strr = "";
						DaTe = list.TableData.data
						if (list == null || list.length == 0) {
							BoardPageUL.html("");
							BoardTotal.html("");

							return;
						}

						// 총 게시물 개수 출력
						$(".Total").html(
								"총 게시물 개수는 : " + list.ListData.total + "개");

						// 테이블 출력
						for (var i = 0, len = DaTe.length || 0; i < len; i++) {
							str += "<tr>"
							str += "<td>" + DaTe[i].bno + "</td>";
							str += "<td><div onclick= 'return PageDetail(" + DaTe[i].bno + ")' >"
									+ DaTe[i].title + "</div></td>";
							str += "<td>"
									+ BoardService
											.displayTime(DaTe[i].createDate)
									+ "</td>";
							str += "<td>"
									+ BoardService
											.displayTime(DaTe[i].changeDate)
									+ "</td>";
							str += "</tr>";
						}

						$(".ListPage").html(str);

						var startPa = (list.ListData.pageDTO.startPage);
						var endPa = (list.ListData.pageDTO.endPage);

						if ((list.ListData.pageDTO.prev) == true) {
							strr += "<li class=paginate_button previous>";
							strr += "<button class='Prev'>Prev</a></li>";
						}

						for (var i = startPa; i <= endPa; i++) {
							var tf = (list.ListData.pageDTO.cri.pageNum == i ? "'paginate_button active'"
									: "paginate_button");
							strr += "<li class=" + tf + ">";
							console.log(i)
							strr += "<button id=" + i + " class='click-btn'>"
									+ i + "</button></li>";
						}

						if ((list.ListData.pageDTO.next) == true) {
							strr += "<li class='paginate_button next' style='float:right'>";
							strr += "<button class='Next'>Next</button></li>"
						}

						$(".pagination").html(strr);

						$(".click-btn").on("click", function(e) {
							a = e.target.id;
							ListData(a)

						});
						$(".Next").on("click", function() {
							a = endPa + 1;
							ListData(a)

						});
						$(".Prev").on("click", function() {
							a = startPa - 1;
							ListData(a)

						});
					});
}
