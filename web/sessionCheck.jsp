<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>session������</title>
</head>
<body>

<% 
	String un=request.getParameter("username");
	String pw=request.getParameter("password");
	if(un.equals("rose") && pw.equals("123456")){
				
		session.setAttribute("username", un);  //����¼��Ϣд��session
		session.setAttribute("password", pw);
		
		response.sendRedirect("sessionWelcome.jsp");
	}else{
		response.sendRedirect("sessionExample.jsp");  //�û������벻����ת����¼ҳ��
	}
	
%>
</body>
</html>