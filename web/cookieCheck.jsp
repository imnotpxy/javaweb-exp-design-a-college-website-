<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>cookie���¼����</title>
</head>
<body>

<% 
	String un=request.getParameter("username");
	String pw=request.getParameter("password");
	String flag = request.getParameter("nologin");
	
	if(un.equals("rose") && pw.equals("123456")){
				
		session.setAttribute("username", un);  //����¼��Ϣд��session
		session.setAttribute("password", pw);
		
		if("yes".equals(flag)){
			 Cookie nameCookie =new Cookie("testname",un);
			 nameCookie.setMaxAge(60*60*24*3);		//����cookie��Ч��3��
			 Cookie pwdCookie =new Cookie("password",pw);
			 pwdCookie.setMaxAge(60*60*24*3);		//����cookie��Ч��3��
			 response.addCookie(nameCookie);
			 response.addCookie(pwdCookie);  
		}
		
		response.sendRedirect("cookieWelcome.jsp");
	}else{
		response.sendRedirect("cookieExample.jsp");   
	}
	
%>
</body>
</html>