<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>session������</title>
</head>
<body>

<% 
	//String un = (String)session.getAttribute("username");   //���session����û��֮ǰд��ĵ�¼��Ϣ
	//if(un != null){
%>
		
	<h3 align="center"><%--= un --%>��ӭ���ʱ�ϵͳ����������һ��ͼƬ��</h3>
	<jsp:include page="jQueryExample.html"/>
				
<% 
	//}
	//else
	//{
	//	response.sendRedirect("sessionExample.jsp");
	//}
%>

</body>
</html>