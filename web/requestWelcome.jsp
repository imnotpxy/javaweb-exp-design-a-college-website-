<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>request�����Ӧ��</title>
</head>
<body>
<h2>
<% 	
   request.setCharacterEncoding("utf-8");
   String name=request.getParameter("name");
   out.print(name);
   String sex=request.getParameter("sex");
   if(sex.equals("male")){
   	   out.print("&nbsp;����");
   }else if(sex.equals("female")){
	   out.print("&nbsp;Ůʿ");
   }
   else{
       out.print("&nbsp;Ůʿ/����");
   }
   out.print("���ã�<br/>");
   String[] hobby=request.getParameterValues("hobby");
   if(hobby==null){
	   out.print("����Ȼû�а���");
   }else{
       int number=hobby.length;
	   out.print("���İ����У�");
	   for(int i=0;i<number;i++)
		   out.print(hobby[i]+"&nbsp&nbsp");
   }
%>
</h2>
</body>
</html>