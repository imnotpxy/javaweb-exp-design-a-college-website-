<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!--DOCTYPE html-->
<html>
<head>
<meta charset="UTF-8">
<title>include动作实现网页拼接</title>
</head>
<body>
	<jsp:include page="header.html" flush="true"></jsp:include>
	<jsp:include page="middle.html" flush="true"></jsp:include>
	<jsp:include page="footer.html" flush="true"></jsp:include>
</body>
</html>