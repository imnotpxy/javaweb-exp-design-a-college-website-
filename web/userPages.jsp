<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import = "java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>用户管理页面</title>
</head>
<body>
<h3>用户管理列表</h3>
<% 

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		String username = "root";
		String password = "guanyuan";
		Connection conn = DriverManager.getConnection(url,username,password);

		int pagesize=5;         //定义每一页显示的记录条数
		int pageid=1;           //定义当前的页码
		int recordcount=0;      //定义记录总数
 		int pagecount=0;        //定义页面总数
 		
		//读取当前页号，如果是首次打开用户管理页而不是从其他页号跳转来，则页号为1
		if(request.getParameter("pagenum")==null)
			pageid=1;
		else
			pageid=Integer.parseInt(request.getParameter("pagenum"));    //注意这里需要进行类型转换
		
		//统计users表中共有多少条用户记录数
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
		
		//根据总记录数和每页记录数计算总页数
		if(recordcount%pagesize==0)
			pagecount=recordcount/pagesize;
		else
			pagecount=recordcount/pagesize+1;
		
		// 从users数据表中按每页显示的记录数量读取用户数据
		sql="select * from users limit ?,?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,(pageid-1)*pagesize);
		ps.setInt(2,pagesize);
		rs=ps.executeQuery();
		int i=0;
%>
<table border="1" width="600">
<tr>
		<td>编号</td>
		<td>用户名</td>
		<td>手机号</td>
		<td>操作</td>
</tr>
<%
		while(rs.next()){			
			i++;
%>
<tr>
		<td><%= (pageid-1)*pagesize+i%></td>     <!-- 注意这里让序列号递增的处理方法 -->
		<td><%= rs.getString("username")%></td>
		<td><%= rs.getString("telephonenumber")%></td>
		<td>
			<a href="deleteItem.jsp?id=<%= rs.getInt("id")%>">删除</a>
			<a href="modifyPage.jsp?id=<%= rs.getInt("id")%>">修改</a>
		</td>
<tr>
<%
		}
%>
</table>

第<%=pageid %>页/共<%=pagecount %>页 &nbsp;
<%
		if(pageid>1){
			out.print("<a href='userPages.jsp?pagenum=1'>第一页</a>&nbsp;");
			out.print("<a href='userPages.jsp?pagenum="+(pageid-1)+"'>上一页</a>&nbsp;");
		}
		if(pageid<pagecount){
			out.print("<a href='userPages.jsp?pagenum="+(pageid+1)+"'>下一页</a>&nbsp;");
			out.print("<a href='userPages.jsp?pagenum="+pagecount+"'>最后一页</a>&nbsp;");	
		}
		rs.close();
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("获取用户数据失败！");
	}
%>
</body>
</html>