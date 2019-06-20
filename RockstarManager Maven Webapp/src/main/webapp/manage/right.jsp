<%@page import="com.model.Nav"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<style type="text/css">
	<!--
		@IMPORT url("../CSS/role.css");
	-->
	</style>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/jquery-1.4.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/right.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/PromptBox.js"></script>
  
  </head>
  
  <body>
    <h1>Right Info</h1>
    <form action="manage/addNav" method="post" onsubmit="return check()">
  		<table border="1" id="table1">
  			<tr><td width="60px">Name:</td><td><input type="search" id="name" name="name" placeholder="name"></td></tr>
  			<tr><td>INFO:</td><td><textarea id="info" name="info"></textarea></td></tr>
  			<tr><td colspan="2"><input type="submit" id="sub" value="submit"></td></tr>
  		</table>
  	</form>
  	<%
    	List<Nav> nav=(List<Nav>)request.getAttribute("nav");
    	if(nav!=null)
    	{
    		out.print("<table border=\"1\" id=\"table2\">");
    		out.print("<thead><th></th><th width=\"100px\">RoleName</th><th>Info</th></thead>");
    		for(Nav n:nav)
    		{
    			out.print("<tr id=\""+n.getNavid()+"\"><td width=\"53px\"><input type=\"button\" onclick=\"del('"+n.getNavid()+"')\" value=\"delete\"></td><td>"+n.getNavname()+"</td><td>"+n.getInfo()+"</td></tr>");
    		}
    		out.print("</table>");
    	}
    
     %>
  </body>
</html>
