<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Rockstar Manager</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" type="image/x-icon" href="CSS/image/small_icon.jpg" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	<!--
		@import URL(CSS/homepage.css);	
	-->
	
	</style>

	<frameset cols="*" rows="150px,*" frameborder="no">
		<frame src="manager/head" noresize="noresize" scrolling="no" frameborder="0"/>
		<frameset cols="230px,*" rows="*" >
		<frame src="manager/nav" noresize="noresize" frameborder="0"/>
		<frame src="manager/profile?target=profile" frameborder="0" name="view"/>	
	</frameset>
  </head>
</html>
