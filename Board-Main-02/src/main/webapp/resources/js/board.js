console.log("reply Module......");

var BoardService = (function(){
	
	function getList(param, callback, error){
		
		var page = param.page;
		
		$.getJSON("/board/pages/"+page+".json",
				function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status, err){
			if(error){
				error();
			}
		});
		}
	
	function displayTime(timeValue){
		var dateObj = new Date(timeValue);
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1; // getMonth는 0부터 시작
		var dd = dateObj.getDate();
		
		return [yy, '/', mm + '/', dd].join('');
	};
	
function total(){
		
		
		
		$.getJSON("/board/pages/total.json",
				function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status, err){
			if(error){
				error();
			}
		});
		}
	
	
		return{
			getList : getList,
			displayTime : displayTime,
			total : total
		};
})();
	
