<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<form action="admin_notice_mod2.do" method="POST">
		제목 : <input type="text" name="notice_title" value="${vo.notice_title}"/><br/>
		내용 :<textarea name="notice_content" rows="7" cols="63">${vo.notice_content}</textarea>
		<input type="hidden" name="notice_no" value="${vo.notice_no}"/>
		<input type="submit" value="수정완료"/>
	</form>		
</body>
</html>