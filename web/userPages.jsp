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
<% 

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		String username = "root";
		String password = "guanyuan";
		Connection conn = DriverManager.getConnection(url,username,password);

		int pagesize=5;         //����ÿһҳ��ʾ�ļ�¼����
		int pageid=1;           //���嵱ǰ��ҳ��
		int recordcount=0;      //�����¼����
 		int pagecount=0;        //����ҳ������
 		
		//��ȡ��ǰҳ�ţ�������״δ��û�����ҳ�����Ǵ�����ҳ����ת������ҳ��Ϊ1
		if(request.getParameter("pagenum")==null)
			pageid=1;
		else
			pageid=Integer.parseInt(request.getParameter("pagenum"));    //ע��������Ҫ��������ת��
		
		//ͳ��users���й��ж������û���¼��
		Statement st=conn.createStatement();
		String sql="select * from users";
		ResultSet rs=st.executeQuery(sql);
		if(rs!=null)
		{
			while(rs.next())
			{
				recordcount++;
			}				
		}
		rs.close();
		st.close();
		
		//�����ܼ�¼����ÿҳ��¼��������ҳ��
		if(recordcount%pagesize==0)
			pagecount=recordcount/pagesize;
		else
			pagecount=recordcount/pagesize+1;
		
		// ��users���ݱ��а�ÿҳ��ʾ�ļ�¼������ȡ�û�����
		sql="select * from users limit ?,?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,(pageid-1)*pagesize);
		ps.setInt(2,pagesize);
		rs=ps.executeQuery();
		int i=0;
%>
<table border="1" width="600">
<tr>
		<td>���</td>
		<td>�û���</td>
		<td>�ֻ���</td>
		<td>����</td>
</tr>
<%
		while(rs.next()){			
			i++;
%>
<tr>
		<td><%= (pageid-1)*pagesize+i%></td>     <!-- ע�����������кŵ����Ĵ����� -->
		<td><%= rs.getString("username")%></td>
		<td><%= rs.getString("telephonenumber")%></td>
		<td>
			<a href="deleteItem.jsp?id=<%= rs.getInt("id")%>">ɾ��</a>
			<a href="modifyPage.jsp?id=<%= rs.getInt("id")%>">�޸�</a>
		</td>
<tr>
<%
		}
%>
</table>

��<%=pageid %>ҳ/��<%=pagecount %>ҳ &nbsp;
<%
		if(pageid>1){
			out.print("<a href='userPages.jsp?pagenum=1'>��һҳ</a>&nbsp;");
			out.print("<a href='userPages.jsp?pagenum="+(pageid-1)+"'>��һҳ</a>&nbsp;");
		}
		if(pageid<pagecount){
			out.print("<a href='userPages.jsp?pagenum="+(pageid+1)+"'>��һҳ</a>&nbsp;");
			out.print("<a href='userPages.jsp?pagenum="+pagecount+"'>���һҳ</a>&nbsp;");	
		}
		rs.close();
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("��ȡ�û�����ʧ�ܣ�");
	}
%>
</body>
</html>