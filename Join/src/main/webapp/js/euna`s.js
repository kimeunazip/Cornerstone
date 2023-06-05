
//Floating Menu
$(window).scroll(function() {
    let scrollTop = $(this).scrollTop();
    
    if ( scrollTop < 100 ) {
        scrollTop = 100;
    }
    else if ( scrollTop > 9600 ) {
        scrollTop = 9600;
    }
    let duration = 1000;
    $('#floatingMenu').stop().animate({top:scrollTop}, duration);
    
});

//TOP버튼
	$(document).ready(function($) {
	    $("#top").click(function(event){
	        event.preventDefault();
	        $('html,body').animate({scrollTop:0}, 500);
	    });
	
	});
	

$(document).ready(function($){
		      //형광펜
		      	$(".mark").click(function(){
		      		$(this).css("backgroundColor","yellow");
		      	});
		  	});