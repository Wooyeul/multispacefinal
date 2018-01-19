<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<form action="admin_notice_add2.do" method="POST">
		<label>공지사항 제목</label><br/><br/>
		<input type="text" name="notice_title" style="width:400px;" class="form-control"/><br/><br/>
		
		<label>공지사항 내용</label>
		<pre><textarea name="notice_content" rows="25" cols="60"class="form-control"></textarea></pre>
		<button class="btn btn-primary" type="submit">작성</button>
	</form>
</body>
</html>