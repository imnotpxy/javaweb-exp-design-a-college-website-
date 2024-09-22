<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册信息写入Javabean</title>
</head>
<body>

	<jsp:useBean id="user" class="com.bean.UserBean" scope="request"></jsp:useBean>
	<jsp:setProperty name="user" property="*" />
	<h3>您的用户名为：<jsp:getProperty property="username" name="user"/></h3>
	<h3>密码为：<jsp:getProperty property="password" name="user"/></h3>
	<h3>手机号码为：<jsp:getProperty property="telephone" name="user"/></h3>
	
<%
	//String name=request.getParameter("username");
	//String psw=request.getParameter("password");
	//String tele=request.getParameter("telephone");
	
	//useBean user=new useBean();
	//user.setUsername(name);
	//user.setPassword(psw);
	//user.setTelephone(tele);
	
	try {	  
	  
		javax.naming.Context ctx=new InitialContext();//获取上下文对象		 		
		//在JNDI中查找指定名字的数据源
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/DBPool");
		Connection conn = ds.getConnection();  //通过数据源获取一个池连接

		// 用PreparedStatement添加注册信息
		String sql="insert into users(username,password,telephonenumber)values(?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);

		ps.setString(1,user.getUsername());
		ps.setString(2,user.getPassword());
		ps.setString(3,user.getTelephone());
		int row=ps.executeUpdate();   //这里不需要参数
		if(row>0){
		  out.print("您已注册成功！");
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