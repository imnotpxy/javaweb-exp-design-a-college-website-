<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>数据库连接测试</title>
</head>
<body>
<%
	try {
		// 加载数据库驱动，注册到驱动管理器
		Class.forName("com.mysql.jdbc.Driver");
		// 数据库连接字符串
		String url = "jdbc:mysql://localhost:3306/test";
		// 数据库用户名
		String username = "root";
		// 数据库密码
		String password = "123456";
		// 创建Connection连接
		Connection conn = DriverManager.getConnection(url,username,password);
		// 判断 数据库连接是否为空
		if(conn != null){
			// 输出连接信息
			out.println("数据库连接成功！");
			// 关闭数据库连接
			conn.close();
		}else{
			// 输出连接信息
			out.println("数据库连接失败！");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>

</body>
</html>