<%@page import="com.model.Nav"%>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		<!--
			@import URL(CSS/downloadNav.css);
		-->
	</style>
  </head>
  
  <body>
  <div id="nav">
  	<ul1>
  		<%
  			List<Nav> navList=(List<Nav>)request.getAttribute("nav");
  			if(navList!=null && navList.size()>0)
  			{
	  			for(Nav nav:navList)
	  			{
	  				out.print("<li><a href=\"manager/"+nav.getNavname()+"?target="+nav.getNavname()+"&current=1\" target=\"view\">"+nav.getNavname()+"<span></span></a></li>");
	  			}
  			}
  		
  		 %>
  	
  		<li><a href="manager/profile?target=profile" target="view">profile</a></li>
  	</ul1>
  </div>
  </body>
</html>
