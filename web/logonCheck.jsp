<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>��¼��֤</title>
</head>
<body>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		String username = "root";
		String password = "123456";
		Connection conn = DriverManager.getConnection(url,username,password);

		// ������ݿ�����Ƿ��и��û���ע����Ϣ
		String sql="select * from users where username= ? and password= ?";  //ע����������д�����Ⱥź��пո񣬣�����û�е�����
		PreparedStatement ps=conn.prepareStatement(sql);
		String name=request.getParameter("username");
		String psw=request.getParameter("password");
		ps.setString(1,name);
		ps.setString(2,psw);
		ResultSet rs=ps.executeQuery();     //���ﲻ��Ҫ����
		if(rs.next()){
			out.print(name+"�����ѵ�¼�ɹ���");
		}else{
			out.print("<script> alert('��û��ע�ᣡ');window.location='logonForm.jsp';</script>");
		}
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("��¼���ʧ�ܣ�");
	}
%>

</body>
</html>