<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CSS.jsp' starting page</title>
    
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
		@import URL(../CSS/game.css);
	-->
	</style>
  </head>
  
  <body>
    <h1>CSS Manager</h1>
    <form action="manage/changeCSS" method="post" enctype="multipart/form-data">
  		<table border="1" id="table1">
  			<tr><td width="200px">SELECT A CSS:</td><td><input type="file" accept=".css" id="css" name="css"></td></tr>
  			<tr><td colspan="2"><input type="submit" id="sub" value="submit"></td></tr>
  		</table>
  	</form>
  </body>
</html>
