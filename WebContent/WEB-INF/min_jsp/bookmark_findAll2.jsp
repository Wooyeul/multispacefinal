<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

	<script type="text/javascript" src="common.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var flag = 0;
			$("#del").on("click",function(){
				var arr = [];
				
				$("input[name=check]:checked").each(function(i){
					arr.push($(this).val());
				});
				
				if(arr!=""){
					var url = "bookmark_del.do?check="+arr;
					ajaxGet(url,function(rt){
						location.reload();
					});
				}
			});
			$("#modal").modal("show");
		});
	</script>
</head>
<body>
	<h3>즐겨찾기</h3>
	<form name="frm">
		<table border="1">
			<jl:forEach var="ab" items="${rl}" varStatus="i" begin="0">
			<jl:if test="${(i.count-1) % 3 eq 0}">
				<tr>
			</jl:if>
				<td>	
				${ab.space_no}
				<input type="checkbox" class="space_no" name="check" value="${ab.space_no}" abc="${ab.space_no}"/><br/>
				<img src="img/${ab.space_thumb_img}" width="100px"/><br/>
				<a href="space_detail.do?space_no=${ab.space_no}">${ab.space_title}</a><br/>
				</td>
			</jl:forEach>
		</table>
		<input type="button" value="삭제하기" id="del" />
	</form>
	
	<div id="modal" class="modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<label id="lblContent">qwew</label>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>