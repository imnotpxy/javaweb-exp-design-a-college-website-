<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.Files"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="com.jspsmart.upload.File"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文件上传</title>
</head>
<body>
		<% 
			try{ 
				//指定动作 
				SmartUpload smart=new SmartUpload();   //创建对象
				smart.initialize(pageContext);         //初始化，参数固定为pageContext对象
				smart.upload();                        //上传文件
				//把文件保存到同目录的files文件夹中
				smart.save("files");            //保存在指定的路径
				Files files=smart.getFiles();   //得到已上传的文件集合
				File file=null;
				String fileName=null;
				for(int i=0;i<files.getCount();i++){//遍历文件集合中的每个文件   
					file=files.getFile(i);
					fileName=file.getFileName();
					//fileName =new String(fileName.getBytes(),"utf-8");  //处理中文文件名乱码问题
					if(!file.isMissing())
					{
						out.print("<br>文件名:"+fileName);
						out.print("<a href='fileDownload.jsp?filename="+fileName+"'>下载</a><br>");					
					}
				}
			} 
			catch(Exception e){ 
			} 
		 %>
		 <br/>
		<a href="fileAdd.jsp">返回上传页面</a>
</body>
</html>