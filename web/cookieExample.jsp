<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>cookie���¼����</title>
</head>
<body>

 <form action="cookieCheck.jsp" method="post" >
	 �û�����<input type="text" name="username" /><br/><br/>
	���룺&nbsp;&nbsp;&nbsp;<input type="password" name="password" /><br/><br/>
	<input type="checkbox" name="nologin" value="yes"/>���������¼<br/><br/>
	<input type="submit" value="��¼" /> <input type="reset" value="����"/>
</form>

</body>
</html>