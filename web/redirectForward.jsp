<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>redirect和forward举例</title>
</head>
<body>
<% 
	String un=request.getParameter("username");
	String pw=request.getParameter("password");
	if(un.equals("rose") && pw.equals("123456")){
		out.println("<h3>Welcome " + un + "!</h3>");
	}else
	{
		//response.sendRedirect("relogin.jsp");
%>
	<%--jsp:forward page="relogin.jsp"></jsp:forward--%>
	
	<%--这个地方不用加param动作，也可以把request中的信息带入重定向的网页中 --%>
	<jsp:forward page="relogin.jsp">
		<jsp:param name="username" value="<%=request.getParameter(\"username\")%>" />
	</jsp:forward>
<%
	}
%>

</body>
</html>