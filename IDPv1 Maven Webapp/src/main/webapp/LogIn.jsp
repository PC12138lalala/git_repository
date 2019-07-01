<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <form name="f1" method="post" action="UserLogIn">
  <input type="hidden" name="ReturnURL" id="ReturnURL" value="${requestScope.ReturnURL}" >
  	<div id="hd">
  		<div id="top_icon"></div>
  		<div id="guide">
  			<ul1>
  				<li><a href="${requestScope.ReturnURL}">HOME</a></li>
  				<li>GAMES
  					<pad>
  						<pu>
  							<c:forEach var="game" items="${games }">
  								<pl><a href='http://www.rockstargames.com.cn/Game/<c:out value="${game.key }"></c:out>'><img src='<c:out value="${game.value }"></c:out>.png'></a></pl>
  							</c:forEach>
  						</pu>
  						<wu>
  							<c:forEach var="game" items="${games }">
  								<wl><a href='http://www.rockstargames.com.cn/Game/<c:out value="${game.key }"></c:out>'><c:out value="${game.key }"></c:out></a></wl>
  							</c:forEach>
  						</wu>
  					</pad>
  				</li>
  				<li><a href="http://www.rockstargames.com.cn/forum/forum?n=0&current=1">FORUM</a></li>
  				<li><a href="http://www.rockstargames.com.cn/Download/download">DOWNLOAD</a></li>
  				<li><a href="http://www.rockstargames.com">OFFICIAL WEB</a></li>
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
  					
  				</ul>
  			</div>
  		</div>
  	</div>
  	</form>
  </body>
</html>
