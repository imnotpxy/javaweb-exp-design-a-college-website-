<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>redirect��forward����</title>
</head>
<body>
<%= request.getParameter("username") %>
<h2>����û����������������µ�¼��</h2>
 <form action="redirectForward.jsp" method="post" >
	 �û�����<input type="text" name="username"/><br/><br/>
	���룺<input type="password" name="password"/><br/><br/>
	<input type="submit" value="��¼" /> <input type="reset" value="����"/>
</form>

</body>
</html>