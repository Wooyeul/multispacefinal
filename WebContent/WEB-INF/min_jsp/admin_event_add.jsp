<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
table {
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>

</head>
<body>	
		<form method="POST" action="admin_event_add2.do"  enctype="multipart/form-data">
			���� :<input type="text" name="eve_title" value=""/><br/>
			���� :<textarea name="eve_content" rows="7" cols="40" ></textarea><br/>
		    ����� ���ε�: <input type="file" name="eve_thumb_img" /> <br/>
		<input type="submit" value="���"/>
		<input type="button" value="���" onclick= "window.history.back()">
		</form>
</body>
</html>