<%@page import="com.model.Userset"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File" %>
<%@taglib prefix= "spring" uri= "http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>User Photo Change</title>
    
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
		@import URL(CSS/profile.css);
	-->
	</style>
	
	<script src="JavaScript/changeCheck.js" charset="utf-8"></script>
	
  </head>
  <body>
  	<%
  		String url=request.getHeader("Referer");
  		if(!url.equals(request.getScheme()+"//"+request.getServerName()+":"+request.getServerPort()+"/"+request.getContextPath()+"/change"))
  			session.setAttribute("URL", url);
   	%>
   	
  	<form method="post" name="f1" action="ChangePhoto" enctype="multipart/form-data"  >
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
  				<li><a href="news/news"><spring:message code="newswire"/></a></li>
  				<li><a href="forum/forum?current=1"><spring:message code="FORUM"/></a></li>
  				<li><a href="Download/download"><spring:message code="DOWNLOAD"/></a></li>
  				<li><a href="http://www.rockstargames.com"><spring:message code="OFFICIAL WEB"/></a></li>
  			</ul1>
  		</div>
  	</div>
  	<div id="mainforce">
  		<table width="50%" border=1>
  			<thead >
  				<th colspan=4>User Info</th>
  			</thead>
		  	<tbody align="center">
		  		<%
		  			Userset userset=(Userset)request.getAttribute("userset");
		  			String savePath=application.getRealPath(request.getRequestURI());
					savePath=savePath.substring(0,savePath.lastIndexOf("\\change.jsp"));
					savePath+="\\CSS\\image\\userPhoto\\"+session.getAttribute("userid")+"BHP.png";
					File userPhoto=new File(savePath);
					if(userPhoto.exists())
					{
						out.print("<tr><td style='width:120px;height:120px;' rowspan=3><img src='CSS/image/userPhoto/"+session.getAttribute("userid")+"BHP.png'></td><td >Username</td><td id='1' colspan=2>"+userset.getUsername()+"</td></tr>");
					}
					else
					{
						out.print("<tr><td style='width:120px;height:120px;' rowspan=3><img src='CSS/image/userPhoto/none.png'></td><td>Username</td><td id='1' colspan=2>"+userset.getUsername()+"</td></tr>");
					}
					out.print("<tr><td>phone</td><td id='2' colspan=2>"+userset.getPhone()+"</td></tr>");
					out.print("<tr><td>email</td><td id='3' colspan=2>"+userset.getEmail()+"</td></tr>");	
					out.print("<tr><td id='hp'><a href='javascript:void(0)' onclick='change(1)' id='5' >change</a></td><td>password</td><td id='10' colspan=2>**********</td></tr>");
					out.print("<tr><td colspan=2>sign in date</td><td colspan=2>"+userset.getSignDate()+"</td></tr>");
					out.print("<tr><td colspan=2>last sign in date</td><td colspan=2>"+userset.getLastSign()+"</td></tr>");
			   		
			   	 %>    	 
			   	 
			   	 <tr><td colspan=2><input type="reset" value="reset" id="reset" disabled="true"></td><td><input type="submit" name="submit" id="submit" value="submit" disabled="true" ></td><td><a href="Logout">log out</a></td></tr>	  	
		  	</tbody>
		</table>	
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
