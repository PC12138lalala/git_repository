<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix= "spring" uri= "http://www.springframework.org/tags" %>
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
	</head>
	<body>
	<div id="hd">
  		<div id="top_icon"></div>
  		<div id="guide">
  			<ul1>
  				<li><a href="/homepage" target="_top"><spring:message code="HOME"/></a></li>
  				<li><a href="news/news" target="_top"><spring:message code="newswire"/></a></li>
  				<li><a href="forum/forum?current=1" target="_top"><spring:message code="FORUM"/></a></li>
  				<li><a href="Download/download" target="_top"><spring:message code="DOWNLOAD"/></a></li>
  				<li><a href="http://www.rockstargames.com" target="_top"><spring:message code="OFFICIAL WEB"/></a></li>
  			</ul1>
  			<ul2>
  				${requestScope.loginSigninBlock}
  			</ul2>
  		</div>
  	</div>
  	</body>
</html>