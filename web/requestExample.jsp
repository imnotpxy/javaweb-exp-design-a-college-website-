<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>request对象的应用</title>
</head>
<body>
 <form action="requestWelcome.jsp" method="post" >
	 姓名：<input type="text" name="name"/><br/><br/>
	 性别：<input type="radio" name="sex" value="male"/>男
		 <input type="radio" name="sex" value="female"/>女<br/><br/>
	 爱好：<input type="checkbox" name="hobby" value="music"/>听音乐
		 <input type="checkbox" name="hobby" value="reading"/>看书
		   <input type="checkbox" name="hobby" value="travelling"/>旅行
		   <input type="checkbox" name="hobby" value="playing basketball"/>打篮球<br/><br/>
   	 <input type="submit" value="提交" /> <input type="reset" value="重置"/>
</form>

</body>
</html>