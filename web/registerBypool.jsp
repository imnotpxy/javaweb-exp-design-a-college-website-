<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>ע����Ϣд�����ݿ�</title>
</head>
<body>
<%
	try {
		
		javax.naming.Context ctx=new InitialContext();//��ȡ�����Ķ���		 		
		//��JNDI�в���ָ�����ֵ�����Դ
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/DBPool");
		Connection conn = ds.getConnection();  //ͨ������Դ��ȡһ��������

		// ��PreparedStatement���ע����Ϣ
		String sql="insert into users(username,password,telephonenumber)values(?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		String name=request.getParameter("username");
		String psw=request.getParameter("password");
		String tele=request.getParameter("telephone");
		ps.setString(1,name);
		ps.setString(2,psw);
		ps.setString(3,tele);
		int row=ps.executeUpdate();   //���ﲻ��Ҫ����
		if(row>0){
			out.print(name+"������ע��ɹ���");
		}
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("ע��ʧ�ܣ�");
	}
%>

</body>
</html>