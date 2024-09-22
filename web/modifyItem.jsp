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

		// 找到要更新的那条记录并进行更新
		String sql="update users set username= ?,password= ?,telephonenumber= ? where id= ? ";  //注意这条语句的写法，等号后有空格，？外面没有单引号
		PreparedStatement ps=conn.prepareStatement(sql);
		String name=request.getParameter("username");
		String psw=request.getParameter("password");
		String tele=request.getParameter("telephone");
		int id=Integer.parseInt(request.getParameter("id"));
		ps.setString(1,name);
		ps.setString(2,psw);
		ps.setString(3,tele);
		ps.setInt(4,id);
		int row=ps.executeUpdate();   //这里不需要参数
		if(row>0){
			out.print("<script>alert('用户资料已更新！');window.location='userManagement.jsp';</script>");
			//response.sendRedirect("userManagement.jsp");
		}
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("用户资料更新失败！");
	}
%>

</body>
</html>