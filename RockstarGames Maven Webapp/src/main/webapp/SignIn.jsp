<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix= "spring" uri= "http://www.springframework.org/tags" %>
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
		@import URL(CSS/homepage.css);
		@import URL(CSS/LogInBody.css);
	-->
	</style>
	<script type="text/javascript" src="JavaScript/jquery-1.4.js"></script>
	<script src="JavaScript/submitCheck.js" charset="utf-8"></script>
	<script type="text/javascript" src="JavaScript/PromptBox.js"></script>
	
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
	  				<li><a href="/homepage"><spring:message code="HOME"/></a></li>
  				<li><spring:message code="GAMES"/>
  					<pad>
  						<pu>
  							<c:forEach var="game" items="${games }">
  								<pl><a href='Game/<c:out value="${game.key }"></c:out>'><img src='<c:out value="${game.value }"></c:out>.png'></a></pl>
  							</c:forEach>
  						</pu>
  						<wu>
  							<c:forEach var="game" items="${games }">
  								<wl><a href='Game/<c:out value="${game.key }"></c:out>'><c:out value="${game.key }"></c:out></a></wl>
  							</c:forEach>
  						</wu>
  					</pad>
  				</li>
  				<li><a href="forum/forum?current=1"><spring:message code="FORUM"/></a></li>
  				<li><a href="Download/download"><spring:message code="DOWNLOAD"/></a></li>
  				<li><a href="http://www.rockstargames.com"><spring:message code="OFFICIAL WEB"/></a></li>
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
	  					<li><a href="support"><spring:message code="support"/></a></li>
	  					<li><a href="privacy"><spring:message code="privacy"/></a></li>
	  					<li><a href="legal"><spring:message code="legal"/></a></li>
	  				</ul>
	  			</div>
	  		</div>
	  	</div>
    </form>
  </body>
</html>
