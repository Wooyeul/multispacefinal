$(document).ready(function(){
	
	$("#frm").submit();
	$("#btn").on("click",function(){
		location.href="club_add_page.do";
	});
	$("#submitBtn").on("click",function(){
		$("#frm").submit();
	});
});