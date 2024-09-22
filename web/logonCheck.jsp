<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>登录验证</title>
</head>
<body>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		String username = "root";
		String password = "123456";
		Connection conn = DriverManager.getConnection(url,username,password);

		// 检查数据库表中是否有该用户的注册信息
		String sql="select * from users where username= ? and password= ?";  //注意这条语句的写法，等号后有空格，？外面没有单引号
		PreparedStatement ps=conn.prepareStatement(sql);
		String name=request.getParameter("username");
		String psw=request.getParameter("password");
		ps.setString(1,name);
		ps.setString(2,psw);
		ResultSet rs=ps.executeQuery();     //这里不需要参数
		if(rs.next()){
			out.print(name+"，您已登录成功！");
		}else{
			out.print("<script> alert('您没有注册！');window.location='logonForm.jsp';</script>");
		}
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("登录检测失败！");
	}
%>

</body>
</html>