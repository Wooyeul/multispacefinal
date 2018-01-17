<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	.jumbotron{
		text-align:center;
	}
	.commask{
		text-align:center;
	}
	th, td {
		text-align: center;
	}
	</style>
	<script src="common.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<div id="i" class="jumbotron panel-primary">
		<h1>QnA</h1>
	</div>
	
	<div class="commask">
   		<input class="btn btn-primary btn-lg" type="button" value="�۾���" id="write" xyz="${user_id}" />
   	</div>
   	
	<jl:if test="${user_id ne ''}">
	${user_id} �� ȯ���մϴ�
     <a href="community_qna_mytext.do"> <input type="button" value="My QnA" class="btn btn-primary btn-sm"/></a>
	</jl:if>
	
	<form id="paging_frm" action="community_qna_list.do">
		<select name="comm_search_option"> 
		<option value="0" >�������ּ���</option>
		<option value="1" >����</option>
		<option value="2" >����</option>
		<option value="3" >����+����</option>
		<option value="4" >�ۼ���</option>
		</select>
		�˻� : <input type="text" name="comm_search_content"> 
		<input id="cur_page" type="hidden" name="cur_page" value="${board_pz.curPagination }">
		<input type="submit" value="�˻�">
	</form>
	
	
	<table class="table table-hover">
		<tr>
			<th width="40">NO</th>
			<th width="200">TITLE</th>
			<th>TIME</th>
			<th>ID</th>
			<th>VIEW</th>
		</tr>
		<jl:forEach var="vo" items="${qna_list}">
			<tr>
				<td>${vo.com_qna_no}</td>
				<td><a href="community_qna_read.do?com_qna_no=${vo.com_qna_no}">${vo.com_qna_title}</a></td>
				<td>${vo.the_time}</td>
				<td>${vo.user_id}</td>
				<td>${vo.view_count}</td>
			</tr>
		</jl:forEach>
	</table>
	<!-- ����¡ -->
	<div align="center">
		<ul class="pagination pagination-sm">
			<!-- ���� �������� �̵� : 10������ ��������(��� �̵�) -->
			<jl:if test="${board_pz.hasPrevPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationStart-1}')">&lt;</a></li>
			</jl:if>
			<!-- ���� �������� �̵� : �������� �������� -->
			<jl:if test="${board_pz.hasPrevPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination-1 }')">&lt;</a></li>
			</jl:if>
				<!-- ������ ��ȣ ����� -->
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
			<!-- ���� �������� �̵� : �������� �̵� -->
			<jl:if test="${board_pz.hasNextPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination+1}')">&gt;</a></li>
			</jl:if>
			<!-- ���� �������� �̵� : 10������ ���ķ�(��� �̵�) -->
			<jl:if test="${board_pz.hasNextPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationEnd+1 }')">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>
	<!-- ����¡ -->		
	
		
	<!-- ����� -->
    <div class="modal fade" id="addwrite" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">
                  <span aria-hidden="true">��</span> <span class="sr-only">Close</span>
               </button>
               <h4 class="modal-title" id="myModalLabel">�˸�</h4>
            </div>
            <div class="modal-body">�α����� ���� ���ּ���</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
               <button type="button" class="btn btn-primary" id="success">Ȯ��</button>
            </div>
         </div>
      </div>
   </div>

</body>

</html>