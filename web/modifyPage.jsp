<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
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

		// 找到要修改的那条记录并显示出来
		int id=Integer.parseInt(request.getParameter("id"));
		String sql="select * from users where id= ? "; 
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery(); 
		rs.next();
%>

<form action="modifyItem.jsp"  method="post" >
	用户名：<input type="text" name="username" value="<%= rs.getString(2)%>"/><br/><br/>
	密码：&nbsp;&nbsp;&nbsp;<input type="password" name="password" value="<%= rs.getString(3)%>"/><br/><br/>
	手机号：<input type="text" name="telephone" value="<%= rs.getString(4)%>"/><br/><br/>
	<input type="hidden" name="id" value="<%= id%>"/>
	<input type="submit" value="修改"/> <input type="reset" value="重置"/>
</form>

<%
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("加载信息失败！");
	}
%>

</body>
</html>