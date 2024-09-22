<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>注册信息写入数据库</title>
</head>
<body>
<%
	try {
		
		javax.naming.Context ctx=new InitialContext();//获取上下文对象		 		
		//在JNDI中查找指定名字的数据源
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/DBPool");
		Connection conn = ds.getConnection();  //通过数据源获取一个池连接

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
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("注册失败！");
	}
%>

</body>
</html>