<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>登录举例表单</title>
</head>
<body>

 <form action="logonCheck.jsp" method="post" >
	用户名：<input type="text" name="username" /><br/><br/>
	密码：&nbsp;&nbsp;&nbsp;<input type="password" name="password" /><br/><br/>
	<input type="submit" value="登录" /> <input type="reset" value="重置"/>
</form>

</body>
</html>