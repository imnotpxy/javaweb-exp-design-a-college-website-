<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>ע����Ϣд�����ݿ�</title>
</head>
<body>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		String username = "root";
		String password = "guanyuan";
		Connection conn = DriverManager.getConnection(url,username,password);

		// �ҵ�Ҫ���µ�������¼�����и���
		String sql="update users set username= ?,password= ?,telephonenumber= ? where id= ? ";  //ע����������д�����Ⱥź��пո񣬣�����û�е�����
		PreparedStatement ps=conn.prepareStatement(sql);
		String name=request.getParameter("username");
		String psw=request.getParameter("password");
		String tele=request.getParameter("telephone");
		int id=Integer.parseInt(request.getParameter("id"));
		ps.setString(1,name);
		ps.setString(2,psw);
		ps.setString(3,tele);
		ps.setInt(4,id);
		int row=ps.executeUpdate();   //���ﲻ��Ҫ����
		if(row>0){
			out.print("<script>alert('�û������Ѹ��£�');window.location='userManagement.jsp';</script>");
			//response.sendRedirect("userManagement.jsp");
		}
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("�û����ϸ���ʧ�ܣ�");
	}
%>

</body>
</html>