<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="uft-8">
<title>带照片的注册表单</title>
</head>

<body>

 <form action="registerPic.jsp" method="post" enctype="multipart/form-data">
	用户名：<input type="text" name="username"/><br/><br/>
	密码：&nbsp;&nbsp;&nbsp;<input type="password" name="password"/><br/><br/>
	手机号：<input type="text" name="telephone"/><br/><br/>
	请选择一张个人美照：<input type="file" name="pic"/><br/><br/>
	<input type="submit" value="注册" /> <input type="reset" value="重置"/>
</form>

</body>
</html>