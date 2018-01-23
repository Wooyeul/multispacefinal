<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="common.js"></script>
	<link rel="stylesheet" href="http://70.12.113.229:8088/msspace_01/mypage_css/Myclub.css">	
	<script>
	$(document).ready(function(){
		
		$(".s_msg_no").on("click",function(e){
			$("#i_msg_no").attr("value",$(this).attr("i"));
			msg_no = $("#i_msg_no").val();
			
			location.href="mypage_moveMypageSendMessageRead.do?msg_no=" + msg_no;		
		});
		
		});

	</script>
</head>
<body>
	<table>
		<tr>
			<th width="100">받는사람</th>
			<th width="200">내용</th>
			<th width="200">날짜</th>
		</tr>
		<jl:forEach var="SendMessage" items="${sendMessage}">
			<tr>
				<td>${SendMessage.receive_user_id}</td>
				<td>
				<a href="mypage_moveMypageSendMessageRead.do?msg_no=${SendMessage.msg_no}">${SendMessage.msg_content}
				<%-- <span class="s_msg_no" i="${SendMessage.msg_no}" >${SendMessage.msg_content}</span>
					<input id="i_msg_no" type="hidden" name="msg_no" />--%>
					</a> 
				</td>
				<td>${SendMessage.the_time}</td>
			</tr>
		</jl:forEach>
	</table>
	
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="mypage_moveMypageSendMessagePage.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="mypage_moveMypageSendMessagePage.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="mypage_moveMypageSendMessagePage.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="mypage_moveMypageSendMessagePage.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="mypage_moveMypageSendMessagePage.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="mypage_moveMypageSendMessagePage.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	
</body>
</html>