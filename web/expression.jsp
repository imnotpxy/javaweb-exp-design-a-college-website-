<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>expressionExample</title>
</head>
<body>
<h3>我希望我的体重可以降到<%= 98-8 %>斤</h3>
<h3>我希望我的体重可以降到<% out.print(String.valueOf(98-8)); %>斤</h3>

<%= "<h2>我的值是内嵌在html文件中，并非直接往网页上输出内容，所以你看不到我的标签！</h2>" %>
<% out.print("<h2>我也是往html文件中写入内容，所以你也看不到我的标签!</h2>"); %>

<% int a=800; %> 
<img width=<%= a %> height=<%= a/2 %> src="images/cat.jpeg"/>


</body>
</html>