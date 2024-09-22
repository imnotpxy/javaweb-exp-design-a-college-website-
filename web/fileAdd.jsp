<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文件上传</title>
</head>
<body>
	<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="attachment" multiple="multiple"/><br/><br/>
		<input type="submit" value="上传" />
	</form>
</body>
</html>