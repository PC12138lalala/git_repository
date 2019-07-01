<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Sign In</title>
    
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
		@import URL(CSS/LogIn&SignIn.css);
		@import URL(CSS/LogInBody.css);
	-->
	</style>
	
	<script src="JavaScript/submitCheck.js" charset="utf-8"></script>
	
	
  </head>
  <%
  		String url=request.getHeader("Referer");
  		if((!url.equals(request.getScheme()+"//"+request.getServerName()+":"+request.getServerPort()+"/"+request.getContextPath()+"/UserSignIn"))&&(!url.equals(request.getScheme()+"//"+request.getServerName()+":"+request.getServerPort()+"/"+request.getContextPath()+"/SignIn")))
  			session.setAttribute("URL", url);
   %>
  <body onload="SignInload()">
    <form action="UserSignIn" name="f1" method="post" onsubmit="return SignIncheck()">
    	<div id="hd">
	  		<div id="top_icon"></div>
	  		<div id="guide">
	  			<ul1>
	  				
	  			</ul1>
	  		</div>
	  	</div >
	  	<div id="mainForce">
	  		<leftArea>
	  			<content></content>
	  		</leftArea>
	  		<rightArea_Log>	
	  				<table width="100%" style="margin:-50px 0 0 0;">
		  				<thead><th style="font-size:26pt;">Sign In</th></thead>
		  				<tbody>
		  				<tr align="center" class="tr"><td>username:</td></tr>
		  				<tr align="center" class="tr"><td><input type="search" placeholder="8 ~ 20 word" name="username" class="text"></td></tr>
		  				<tr align="center" class="tr"><td>E-mail:</td></tr>
		  				<tr align="center" class="tr"><td><input type="search" placeholder="less than 30 word" name="email" class="text"></td></tr>
		  				<tr align="center" class="tr"><td>password:</td></tr>
		  				<tr align="center" class="tr"><td><input type="password" name="password1" class="text"></td></tr>
		  				<tr align="center" class="tr"><td>re-input password:</td></tr>
		  				<tr align="center" class="tr"><td><input type="password" name="password2" class="text"></td></tr>
		  				<tr align="center" class="tr"><td>phone:</td></tr>
		  				<tr align="center" class="tr"><td><input type="search" placeholder="11 word" name="phone" class="text"></td></tr>
		  				<tr align="center" class="tr"><td><input type="submit" value="submit" id="button"></td></tr>
		  				<tr align="center" class="tr"><td style="color:green; font-size:10pt;" >${sessionScope.errorInfo }</td></tr>
		  				</tbody>
		  			</table>	
	  		</rightArea_Log>
	  	</div>
	  	<hr style="width:100%;height:4px;background-color:black;border:0;margin:0 0 0 0;"></hr>
	  	<div id="foot">
	  		<div id="bottom_icon"></div>
	  		<div id="bottom">
	  			<div id="s_nav">
	  				<ul>
	  					<li><a href="support">support</a></li>
	  					<li><a href="privacy">privacy</a></li>
	  					<li><a href="legal">legal</a></li>
	  				</ul>
	  			</div>
	  		</div>
	  	</div>
    </form>
  </body>
</html>
