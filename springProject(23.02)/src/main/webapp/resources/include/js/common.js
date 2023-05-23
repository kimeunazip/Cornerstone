
function chkData(item,msg){
	if($(item).val().replace(/\s/g,"")==""){
		alert("please enter your "+msg);
		$(item).val("");
		$(item).focus("");
		return false;
	}else
		return true;
}

function chkForm(item,msg){
				let message = "";
				if($(item).val().replace(/\s/g,"")==""){
					message = "please enter " +  msg ;
					$(item).attr("placeholder",message);
					return false;
				}else {
					return true;
				}
			}
			
function chkFile(item){
/* 	let fileName = $(item).val();
	let index = filName.lastIndexOF(".")
	let Extension = fileName.substring(index+1,fileName.length); */
	let ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext,['gif','png','jpg']) == -1){
		alert("이미지 파일만 업로드할 수 있습니다.");
		item.val("");
		return false;
	}else{
		return true;
	}
}


/* 함수명: getDateFormat(날자 데이터) 
 * 설명 : dataValue의 값을 년-월-일 형식(예시: 2018-01-01)으로 반환.*/ 
function getDateFormat(dateValue){
	let year = dateValue.getFullYear();
	
	let month = dateValue.getMonth()+1;
	month = (month<10) ? "0"+month : month;
	
	let day = dateValue.getDate();
	day = (day<10) ? "0"+day : day;
	
	let result = year+"-"+month+"-"+day;
	return result;
}


/* 함수명: chkSubmit(유효성 체크 대상, 메시지 내용) 
 * 출력영역: alert으로.
 * 예시 : if(!chkSubmit($('#keyword'),"검색어를")) return;
 * */ 
function chkSubmit(item, msg) {
	if(item.val().replace(/\s/g,"")=="") {
		alert(msg+" 입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}