<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			if('${club_applyVO.etc}'=='ing'){
				$("#clubApply").attr("value","신청 중");
				$("#clubApply").attr("disabled","disabled");
			}else{
				$("#clubApply").attr("type","text");
				$("#clubApply").attr("value",'${club_applyVO.etc}');
				$("#clubApply").attr("disabled","disabled");
			}
			
			if('${flag}'==-1){
				alert("이미 신청하셨습니다.");
			}else if('${flag}'==1){
				alert("신청 되었습니다.");
			}
			
			$("#clubApply").on("click",function(){
				$("#modal").modal();
				$("#modal-btn-Yes").on("click",function(){
					$("#frm").submit();
				});
				$("#modal-btn-No").on("click",function(){
					$("#modal").modal('hide');
				});
			});
			$("#moveCommunity").on("click",function(){
				location.href="club_community.do?club_no="+${vo.club_no}+"&user_id="+'${vo.user_id}';
			});
			
		});
	</script>
</head>
<body>
	<div class="container">
		<h2>모임장/모임신청자 페이지</h2>
		<label>${vo.club_name}</label><br/>
		<label>인원</label><input type="text" value="${vo.user_count}" /><br/>
		<label>소개</label><textarea rows="15" cols="30">소개글 : ${vo.club_title}
내용 : ${vo.club_content}</textarea><br/>
		<input id="clubApply" type="button" value="신청하기"><input id="moveCommunity" type="button" value="모임커뮤니티 가기">
		<br/><br/><br/>
		<h3>모임 장소 추천 페이지(이미지 슬라이딩으로 구현 예정)</h3>
		<table class="table" style="border: 1px solid;">
			<tr style="border: 1px solid;">
				<jl:forEach items="${sVO}" var="vo">
					<td style="border: 1px solid;"><a href="space_detail.do?space_no=${vo.space_no}">${vo.space_thumb_img}</a></td>
				</jl:forEach>
			</tr>
		</table>
		
		
		<!-- modal창 시작 -->
		<form id="frm" action="club_apply.do" method="post">
			<div id="modal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-head" align="center">
							<h4>모임 신청</h4>
						</div>
						<div class="modal-body" align="center"><h3 id="modalbody">
							<textarea name="apply_content" id="apply_content" class='form-control' rows="7"></textarea>
							<input name="user_id" type="hidden"value="admin2"/>
							<input name="club_no" type="hidden"value="${vo.club_no}"/>
						</h3></div>
						<div id="ft" class="modal-footer">
							<button type='button' class='btn btn-default' id='modal-btn-Yes'>등록</button>
							<button type='button' class='btn btn-primary' id='modal-btn-No'>취소</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- modal창 끝 -->
		
	</div>	
</body>
</html>