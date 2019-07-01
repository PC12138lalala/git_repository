<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Download</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" type="image/x-icon" href="CSS/image/small_icon.jpg" />
	
	<style type="text/css">
	<!--
		@import URL(CSS/homepage.css);	
	-->
	
	</style>

	<frameset cols="*" rows="170px,*" frameborder="no" framespacing="0">
		<frame src="Download/head" noresize="noresize" scrolling="no" frameborder="0"/>
		<frameset cols="200px,*" rows="*">
		<frame src="Download/nav" noresize="noresize" frameborder="0"/>
		<frame src="Download/content?target=video" frameborder="0" name="view"/>	
	</frameset>
  </head>
</html>

