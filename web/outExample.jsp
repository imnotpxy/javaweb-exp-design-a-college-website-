<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>out对象的应用</title>
</head>
<body>
<%

    Calendar rightNow = Calendar.getInstance();
	//out.println(rightNow);
	int dhours = rightNow.get(Calendar.HOUR_OF_DAY);
	int dminutes = rightNow.get(Calendar.MINUTE);
	int dseconds = rightNow.get(Calendar.SECOND);
	out.println("<h3>服务器时间：" + dhours + ":" + dminutes + ":" + dseconds+"</h3>");
%>
<br/>
<%= "<h3>服务器时间：" + dhours + ":" + dminutes + ":" + dseconds+"</h3>"%>
<br/>
<h3>服务器时间：<%= dhours %>:<%= dminutes %>:<%= dseconds %></h3>

</body>
</html>