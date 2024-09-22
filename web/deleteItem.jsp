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

		// 找到要删除的那条记录并删除
		int id=Integer.parseInt(request.getParameter("id"));
		String sql="delete from users where id= ? ";  //注意这条语句的写法，等号后有空格，？外面没有单引号
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,id);
		int row=ps.executeUpdate();   //这里不需要参数
		if(row>0){
			out.print("<script>alert('该用户已删除！');window.location='userManagement.jsp';</script>");
		}
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("删除记录失败！");
	}
%>

</body>
</html>