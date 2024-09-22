<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSP的param动作举例</title>
</head>
<body>
	<h2>jsp:param动作使用举例，我是主网页！</h2>
	<jsp:include page="paramInclude.jsp" flush="true">
		<jsp:param name="username" value="Jack"/>
		<jsp:param name="password" value="123456"/>
	</jsp:include>
</body>
</html>