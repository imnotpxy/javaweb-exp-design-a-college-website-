<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>session检查举例</title>
</head>
<body>

<% 
	//String un = (String)session.getAttribute("username");   //检查session中有没有之前写入的登录信息
	//if(un != null){
%>
		
	<h3 align="center"><%--= un --%>欢迎访问本系统，请先欣赏一组图片！</h3>
	<jsp:include page="jQueryExample.html"/>
				
<% 
	//}
	//else
	//{
	//	response.sendRedirect("sessionExample.jsp");
	//}
%>

</body>
</html>