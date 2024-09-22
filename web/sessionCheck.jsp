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
	String un=request.getParameter("username");
	String pw=request.getParameter("password");
	if(un.equals("rose") && pw.equals("123456")){
				
		session.setAttribute("username", un);  //将登录信息写入session
		session.setAttribute("password", pw);
		
		response.sendRedirect("sessionWelcome.jsp");
	}else{
		response.sendRedirect("sessionExample.jsp");  //用户名密码不对则转到登录页面
	}
	
%>
</body>
</html>