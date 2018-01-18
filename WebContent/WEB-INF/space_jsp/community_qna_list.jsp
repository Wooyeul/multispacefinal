<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
		
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	<style type="text/css">

		.commask{
			margin-top:5px;
			text-align: center;
			float:left;
		}
		th, td {
			text-align: center;
		}
		.selectdiv1{
			vertical-align : middle;
			width: 1000px;
			float: left;
		}
		
		.selectdiv2{
			margin-top:5px;
			width: 150px;
			float: left;
		}
		
		 .selectdiv3 {
		 	width: 400px;
			padding : 5px;
			float: left;
		}
		 .selectdiv4 {
			padding : 5px;
			float: left;
		}
		.selectdiv5 {
			width: 300px;
			margin-top:5px;
			float: left;
		}
		.selecdiv0 {
			width: 600px;
			margin:0 auto;
		}
	</style>
	<script>
	  $(document).ready(function(){
	      $("#write").on("click",function(){
	         var user_id = $(this).attr("xyz");
	         if(user_id != ""){
	            location.href="community_qna_add.do";
	         } else{
	         $("#addwrite").modal("show");
	            
	         }
	      });
	      
	      $("#success").on("click",function(){
	         parent.location.href="home_moveLoginPage.do";
	      });
	  });
	  function board_list(page){
		  $("#cur_page").attr("value",page);
		  $("#paging_frm").submit();
	  }
	</script>
</head>
<body>
	<table class="table table-hover">
		<tr>
			<th width="40"></th>
			<th width="1000">제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회</th>
		</tr>
		<jl:forEach var="vo" items="${qna_list}">
			<tr>
				<td>${vo.com_qna_no}</td>
				<td><a href="community_qna_read.do?com_qna_no=${vo.com_qna_no}">${vo.com_qna_title}</a></td>
				<td>${vo.user_id}</td>
				<td>${vo.the_time}</td>
				<td>${vo.view_count}</td>
			</tr>
		</jl:forEach>
	</table>
	
	<!-- 페이징 -->
	<div align="center">
		<ul class="pagination pagination-sm">
			<!-- 이전 페이지로 이동 : 10페이지 이전으로(블록 이동) -->
			<jl:if test="${board_pz.hasPrevPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationStart-1}')">&lt;</a></li>
			</jl:if>
			<!-- 이전 페이지로 이동 : 한페이지 이전으로 -->
			<jl:if test="${board_pz.hasPrevPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination-1 }')">&lt;</a></li>
			</jl:if>
				<!-- 페이지 번호 만들기 -->
				<jl:forEach begin="${board_pz.paginationStart }" end="${board_pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=board_pz.curPagination }">
							<li><a class="page" href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
			<!-- 다음 페이지로 이동 : 한페이지 이동 -->
			<jl:if test="${board_pz.hasNextPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination+1}')">&gt;</a></li>
			</jl:if>
			<!-- 다음 페이지로 이동 : 10페이지 이후로(블록 이동) -->
			<jl:if test="${board_pz.hasNextPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationEnd+1 }')">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>
	<!-- 페이징 -->		
	
	<div class="wrapper">
			<form action="community_qna_list.do" id="paging_frm" >
				<div class="selecdiv0">
					<div class="selectdiv1">
						<div class="selectdiv2">
							<select class="form-control" name="comm_search_option">
								<option value="0">선택해주세요</option>
								<option value="1">제목</option>
								<option value="2">내용</option>
								<option value="3">제목+내용</option>
								<option value="4">작성자</option>
							</select>
						</div>
						<div class="selectdiv3">
							<input class="form-control" type="text" name="comm_search_content" placeholder="카테고리 선택 -> 내용 입력" />
							<input id="cur_page" type="hidden" name="cur_page" value="${board_pz.curPagination }">
						</div>
						<div class="selectdiv4">
							<input type="submit" class="btn btn-primary" value="검색"/>				
						</div>
						<div class="selectdiv5">
							<jl:if test="${user_id ne ''}">
								<a href="community_qna_mytext.do"> <input type="button" class="btn btn-primary" value="My QnA보기" /></a>
							</jl:if>
						</div>
						<!-- 글쓰기 버튼-->
						<div class="commask">
							<input class="btn btn-primary btn" type="button" value="글쓰기" id="write" xyz="${user_id}" />
						</div>
					</div>
				</div>
			</form>
		</div>
		
	<!-- 모달폼 -->
    <div class="modal fade" id="addwrite" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">
                  <span aria-hidden="true">×</span> <span class="sr-only">Close</span>
               </button>
               <h4 class="modal-title" id="myModalLabel">알림</h4>
            </div>
            <div class="modal-body">로그인을 먼저 해주세요</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
               <button type="button" class="btn btn-primary" id="success">확인</button>
            </div>
         </div>
      </div>
   </div>

</body>

</html>