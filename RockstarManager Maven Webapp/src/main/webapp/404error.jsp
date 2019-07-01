<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>404 error</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" type="image/x-icon" href="CSS/image/small_icon.jpg" />
	
	<style type="text/css">
	<!--
		@import URL(CSS/homepage.css);
		@import URL(CSS/text.css);
	-->
	</style>

  </head>
  
  <body>
  	<div id="hd">
  		<div id="top_icon"></div>
  		<div id="guide">
  			<ul1>
  				
  			</ul1>
  			<ul2>
  				${requestScope.loginSigninBlock}
  			</ul2>
  		</div>
  	</div >
  	<div id="error">
  		<cent>
  			<h1>PAGE NOT FOUND</h1>
  			<br><br><br>
  			<h3>The page you requested does not exist. <a href="" style="color:black;">Go back to the main page</a>.</h3>
  		</cent>
  	</div>
  	<hr style="width:100%;height:4px;background-color:black;border:0;margin:0 0 0 0;"></hr>
  	<div id="foot">
  		<div id="bottom_icon"></div>
  		<div id="bottom">
  			<div id="s_nav">
  				<ul>
  					<li>support</li>
  					<li><a href="privacy">privacy</a></li>
  					<li><a href="legal">legal</a></li>
  				</ul>
  			</div>
  		</div>
  	</div>
  </body>
</html>
