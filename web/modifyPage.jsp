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

		// �ҵ�Ҫ�޸ĵ�������¼����ʾ����
		int id=Integer.parseInt(request.getParameter("id"));
		String sql="select * from users where id= ? "; 
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery(); 
		rs.next();
%>

<form action="modifyItem.jsp"  method="post" >
	�û�����<input type="text" name="username" value="<%= rs.getString(2)%>"/><br/><br/>
	���룺&nbsp;&nbsp;&nbsp;<input type="password" name="password" value="<%= rs.getString(3)%>"/><br/><br/>
	�ֻ��ţ�<input type="text" name="telephone" value="<%= rs.getString(4)%>"/><br/><br/>
	<input type="hidden" name="id" value="<%= id%>"/>
	<input type="submit" value="�޸�"/> <input type="reset" value="����"/>
</form>

<%
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("������Ϣʧ�ܣ�");
	}
%>

</body>
</html>