<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>���ݿ����Ӳ���</title>
</head>
<body>
<%
	try {
		// �������ݿ�������ע�ᵽ����������
		Class.forName("com.mysql.jdbc.Driver");
		// ���ݿ������ַ���
		String url = "jdbc:mysql://localhost:3306/test";
		// ���ݿ��û���
		String username = "root";
		// ���ݿ�����
		String password = "123456";
		// ����Connection����
		Connection conn = DriverManager.getConnection(url,username,password);
		// �ж� ���ݿ������Ƿ�Ϊ��
		if(conn != null){
			// ���������Ϣ
			out.println("���ݿ����ӳɹ���");
			// �ر����ݿ�����
			conn.close();
		}else{
			// ���������Ϣ
			out.println("���ݿ�����ʧ�ܣ�");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>

</body>
</html>