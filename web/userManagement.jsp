<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import = "java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>�û�����ҳ��</title>
</head>
<body>
<h3>�û������б�</h3>
<table border="1" width="600">
<tr>
		<td>���</td>
		<td>�û���</td>
		<td>�ֻ���</td>
		<td>����</td>
</tr>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/newsinfo";
		String username = "root";
		String password = "xyp123456";
		Connection conn = DriverManager.getConnection(url,username,password);
	
		// ��users���ݱ��ж�ȡ�û�����
		String sql="select * from users";
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		
		int i=0;     //��Ӧ����š�
		while(rs.next()){			
			i++;
%>
<tr>
		<td><%= i%></td>
		<td><%= rs.getString("username")%></td>
		<td><%= rs.getString("telephonenumber")%></td>
		<td>
			<a href="deleteItem.jsp?id=<%= rs.getInt("id")%>">ɾ��</a>
			<a href="modifyPage.jsp?id=<%= rs.getInt("id")%>">�޸�</a>
		</td>
<tr>
<%
		}
		rs.close();
		st.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("��ȡ�û�����ʧ�ܣ�");
	}
%>
</table>
</body>
</html>