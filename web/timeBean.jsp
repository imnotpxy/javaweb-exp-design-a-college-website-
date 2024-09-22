<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>电子时钟</title>
<style type="text/css">
	#clock{
		width:420px;
		height:80px;
		background:#E0E0E0;
		font-size: 25px;
		font-weight: bold;
		border: solid 5px orange;
		padding: 20px;
	}
	#week{
		padding-top:15px;
		color: #0080FF;
	}
</style>
<meta http-equiv="Refresh" content="1">
</head>
<body>
	<jsp:useBean id="date" class="com.bean.DateBean" scope="application"></jsp:useBean>
	<div align="center">
		<div id="clock">
			<div id="time">
				<jsp:getProperty property="dateTime" name="date"/>
			</div>
			<div id="week">
				<jsp:getProperty property="week" name="date"/>
			</div>
		</div>
	</div>
</body>
</html>