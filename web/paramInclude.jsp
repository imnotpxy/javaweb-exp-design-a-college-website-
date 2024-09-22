<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSP的param动作举例</title>
</head>
<body>
	<hr/>
	<h3>我是子网页，主网页向我传递了以下信息：</h3>
	<h3>用户名：<%= request.getParameter("username") %></h3>
	<h3>密码：<%= request.getParameter("password") %></h3>
	<hr/>
</body>
</html>