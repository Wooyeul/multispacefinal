<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

		


<!DOCTYPE html>
<html>
<head></head>
<body>	
		<form method="POST" action="event_mod.do"  enctype="multipart/form-data">
			���� :<input type="text" name="eve_title" value="${text.eve_title}" readonly /><br/>
			���� :<textarea name="eve_content" rows="7" cols="40" readonly >${text.eve_content}</textarea><br/>
				<input type="hidden" name="eve_no" value="${text.eve_no}" />
			����� ���ε�: <input type="file" name="eve_thumb_img" /> <br/>
			<input type="submit" value="����"/>
			<input type="button" value="����" onclick= "window.location.href='event_dle2.do'">
			<input type="button" value="���" onclick= "window.location.href='event_list.do'">
		</form>
</body>
</html>