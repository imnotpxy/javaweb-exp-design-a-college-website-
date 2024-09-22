<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "java.sql.*"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文件下载</title>
</head>
<body>
<%

	String filename=request.getParameter("filename");    //获取文件名
	//String filename = new String(request.getParameter("filename").getBytes(),"utf-8");
	out.print(filename);
	String pathFilename="/files/"+filename;              //获取文件的下载路径
	SmartUpload smart=new SmartUpload();
	smart.initialize(pageContext);
	smart.setContentDisposition(null);          //出现提示保存框，而不是打开文件
	smart.downloadFile(pathFilename);           //下载
	//解决下载中OutputString字节流和JSP中out对象JSPWriter字符流的冲突，否则将出现异常
	out.clear();
	out=pageContext.pushBody();
%>
</body>
</html>