<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	community_qna_add.jsp
	<form action="community_qna_add2.do" method="POST">
		���� : <input type="text" name="com_qna_title"/><br/>
		���� : <textarea name="com_qna_content" rows="7" cols="63"></textarea>
		<br/><input type="submit" value="�ۼ�"/>
	</form>
	
	<form action="community_qna_list.do" method="POST">
		<input type="submit" value="���"/>
	</form>
</body>
</html>