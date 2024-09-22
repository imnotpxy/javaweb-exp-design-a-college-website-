<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册信息写入数据库</title>
</head>
<body>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		String username = "root";
		String password = "guanyuan";
		Connection conn = DriverManager.getConnection(url,username,password);
		
		//用Statement添加注册信息
		Statement stmt=conn.createStatement();
		
		String name=request.getParameter("username");
		String psw=request.getParameter("password");
		String tele=request.getParameter("telephone");
		String sql="insert into users(username,password,telephonenumber)values('"+name+"','"+psw+"','"+tele+"')";
		int row=stmt.executeUpdate(sql);
		if(row>0){
			out.print(name+"，您已注册成功！");
		}
		stmt.close();
		
		
/*
		// 用PreparedStatement添加注册信息
		String sql="insert into users(username,password,telephonenumber)values(?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		String name=request.getParameter("username");
		String psw=request.getParameter("password");
		String tele=request.getParameter("telephone");
		ps.setString(1,name);
		ps.setString(2,psw);
		ps.setString(3,tele);
		int row=ps.executeUpdate();   //这里不需要参数
		if(row>0){
			out.print(name+"，您已注册成功！");
		}
		ps.close();
*/	
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("注册失败！");
	}
%>

</body>
</html>