<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>redirect和forward举例</title>
</head>
<body>
<%= request.getParameter("username") %>
<h2>你的用户名密码有误，请重新登录！</h2>
 <form action="redirectForward.jsp" method="post" >
	 用户名：<input type="text" name="username"/><br/><br/>
	密码：<input type="password" name="password"/><br/><br/>
	<input type="submit" value="登录" /> <input type="reset" value="重置"/>
</form>

</body>
</html>