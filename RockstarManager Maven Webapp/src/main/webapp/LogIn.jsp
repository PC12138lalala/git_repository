<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Log In</title>
    
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
	<script type="text/javascript">
		function load()
		{
			document.f1.account.focus();
		}
	</script>
  </head>
  
  <body onload="load()">
  <%
	ResourceBundle res = ResourceBundle.getBundle("IDPv1");
	response.sendRedirect(res.getString("URL")+":"+res.getString("PORT")+"/LogIn?ReturnURL="+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort());
   %>
  <form name="f1" method="post" action="UserLogIn">
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
  				<table width="100%">
	  				<thead><th style="font-size:26pt;">Log In</th></thead>
		  			<tbody>
	  				<tr align="center" class="tr"><td>user account:</td></tr>
	  				<tr align="center" class="tr"><td><input type="search" placeholder="phone number or email" name="account" class="text"></td></tr>
	  				<tr align="center" class="tr"><td>password:</td></tr>
	  				<tr align="center" class="tr"><td><input type="password" name="pwd" class="text"></td></tr>
	  				<tr align="center"><td id="err" style="color:green; font-size:10pt;">${requestScope.errorInfo }</td></tr>
	  				<tr align="center" class="tr"><td><input type="submit" value="submit" name="submit" id="button"></td></tr>
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
