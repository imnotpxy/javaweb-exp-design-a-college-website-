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

		// �ҵ�Ҫɾ����������¼��ɾ��
		int id=Integer.parseInt(request.getParameter("id"));
		String sql="delete from users where id= ? ";  //ע����������д�����Ⱥź��пո񣬣�����û�е�����
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,id);
		int row=ps.executeUpdate();   //���ﲻ��Ҫ����
		if(row>0){
			out.print("<script>alert('���û���ɾ����');window.location='userManagement.jsp';</script>");
		}
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("ɾ����¼ʧ�ܣ�");
	}
%>

</body>
</html>