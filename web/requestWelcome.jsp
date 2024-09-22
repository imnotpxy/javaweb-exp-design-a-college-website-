<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>request对象的应用</title>
</head>
<body>
<h2>
<% 	
   request.setCharacterEncoding("utf-8");
   String name=request.getParameter("name");
   out.print(name);
   String sex=request.getParameter("sex");
   if(sex.equals("male")){
   	   out.print("&nbsp;先生");
   }else if(sex.equals("female")){
	   out.print("&nbsp;女士");
   }
   else{
       out.print("&nbsp;女士/先生");
   }
   out.print("您好！<br/>");
   String[] hobby=request.getParameterValues("hobby");
   if(hobby==null){
	   out.print("您竟然没有爱好");
   }else{
       int number=hobby.length;
	   out.print("您的爱好有：");
	   for(int i=0;i<number;i++)
		   out.print(hobby[i]+"&nbsp&nbsp");
   }
%>
</h2>
</body>
</html>