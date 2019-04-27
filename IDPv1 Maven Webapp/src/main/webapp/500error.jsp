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
    
    <title>500 error</title>
    
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
  				<li><a href="http://www.rockstargames.com.cn/forum/forum">FORUM</a></li>
  				<li><a href="http://www.rockstargames.com.cn/Download/download">DOWNLOAD</a></li>
  				<li><a href="http://www.rockstargames.com">OFFICIAL WEB</a></li>
  			</ul1>
  			<ul2>
  				${requestScope.loginSigninBlock}
  			</ul2>
  		</div>
  	</div >
  	<div id="error">
  		<cent>
  			<h1>LOAD PAGE FAILE</h1>
  			<br><br><br>
  			<h3>There are some problems in this page . <a href="" style="color:black;">Go back to the main page</a>.</h3>
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