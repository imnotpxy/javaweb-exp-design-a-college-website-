<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>expressionExample</title>
</head>
<body>
<h3>��ϣ���ҵ����ؿ��Խ���<%= 98-8 %>��</h3>
<h3>��ϣ���ҵ����ؿ��Խ���<% out.print(String.valueOf(98-8)); %>��</h3>

<%= "<h2>�ҵ�ֵ����Ƕ��html�ļ��У�����ֱ������ҳ��������ݣ������㿴�����ҵı�ǩ��</h2>" %>
<% out.print("<h2>��Ҳ����html�ļ���д�����ݣ�������Ҳ�������ҵı�ǩ!</h2>"); %>

<% int a=800; %> 
<img width=<%= a %> height=<%= a/2 %> src="images/cat.jpeg"/>


</body>
</html>