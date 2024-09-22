<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import = "java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>用户管理页面</title>
</head>
<body>
<h3>用户管理列表</h3>
<table border="1" width="600">
<tr>
		<td>编号</td>
		<td>用户名</td>
		<td>手机号</td>
		<td>操作</td>
</tr>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/newsinfo";
		String username = "root";
		String password = "xyp123456";
		Connection conn = DriverManager.getConnection(url,username,password);
	
		// 从users数据表中读取用户数据
		String sql="select * from users";
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		
		int i=0;     //对应“编号”
		while(rs.next()){			
			i++;
%>
<tr>
		<td><%= i%></td>
		<td><%= rs.getString("username")%></td>
		<td><%= rs.getString("telephonenumber")%></td>
		<td>
			<a href="deleteItem.jsp?id=<%= rs.getInt("id")%>">删除</a>
			<a href="modifyPage.jsp?id=<%= rs.getInt("id")%>">修改</a>
		</td>
<tr>
<%
		}
		rs.close();
		st.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("获取用户数据失败！");
	}
%>
</table>
</body>
</html>