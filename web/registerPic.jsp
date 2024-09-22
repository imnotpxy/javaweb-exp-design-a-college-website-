<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.Files"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>带照片的注册</title>
</head>
<body>
<%
	try {
		//通过数据库连接池与数据库建立连接
		javax.naming.Context ctx=new InitialContext();//获取上下文对象
		//在JNDI中查找指定名字的数据源
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/DBPool");
		Connection conn = ds.getConnection();  //通过数据源获取一个池连接
			
		//保存图片并获取图片文件的名称和路径信息
		SmartUpload smart=new SmartUpload();   //创建对象
		smart.initialize(pageContext);         //初始化，参数固定为pageContext对象
		smart.upload();  

		//上传文件，并把文件保存到同目录的images文件夹中
		smart.save("files");   
		File myPic = smart.getFiles().getFile(0); //只上传了一个文件
		String fileName=myPic.getFileName();
		String picPath="files/"+fileName;       //生成图片文件的保存路径
		
		//通过multipart/form-data格式提交的字符串信息不能直接用传统方法获取值，必须通过smartupload组件提供的功能提取信息
		smart.service(request,response);
		String name=smart.getRequest().getParameter("username");
		String psw=smart.getRequest().getParameter("password");
		String tele=smart.getRequest().getParameter("telephone");

		// 用PreparedStatement添加注册信息
		String sql="insert into users(username,password,telephonenumber,picture)values(?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,name);
		ps.setString(2,psw);
		ps.setString(3,tele);
		ps.setString(4,picPath);
		int row=ps.executeUpdate();   //这里不需要参数
		if(row>0){
			out.print(name+"，您已注册成功！下面是您的照片：<br/>");
			out.print("<img src="+picPath+" width=230 height=300>");
		}
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("注册失败！");
	}
%>

</body>
</html>