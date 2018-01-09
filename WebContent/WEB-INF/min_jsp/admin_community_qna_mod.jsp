<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<form action="admin_community_qna_mod2.do" method="POST">
		제목 : <input type="text" name="com_qna_title" value="${vo.com_qna_title}"/><br/>
		내용 :<textarea name="com_qna_content" rows="7" cols="63">${vo.com_qna_content}</textarea>
		<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
		<input type="submit" value="수정완료"/>
	</form>		
</body>
</html>