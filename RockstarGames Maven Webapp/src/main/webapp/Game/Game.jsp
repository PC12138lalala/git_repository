<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.model.Video"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <title>${requestScope.name }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/x-icon" href="CSS/image/small_icon.jpg" />
	
	<link rel="stylesheet" type="text/css" href="CSS/homepage.css" />
	<link rel="stylesheet" type="text/css" href="CSS/gameMainForce.css" />
	<link rel="stylesheet" type="text/css" href="CSS/load_pad.css" />
	<style type="text/css">
	
	#mainForce leftArea
	{
		<%
  			String picturePath="CSS/image/games/"+request.getAttribute("name").toString().replace("%20", " ").replace(":", " ").replace(" ", "_")+".png";
			out.print("background:url("+picturePath+") 100% no-repeat;");
  		 %>
  		 
		background-position:center;
		margin:0 0 2% 0;
		padding:10% 0 0 0;
		height:auto;
		width:48%;
		float:left;
		text-align:center;
	}
	</style>

  </head>
  
  <body onscroll="scroll()">
  <div id="load_pad"><img src="CSS/image/loader.gif" id="load_pic"></div>
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
  			<ul2>
  				${requestScope.loginSigninBlock}
  			</ul2>
  		</div>
  	</div >
  	<div id="mainForce">
  		<leftArea>
  			<picture></picture>
  		</leftArea>
  		<rightArea>
  			<hd>${requestScope.name }</hd>
  			<ul>
  				<li>PCDL</li>
  				<li>Xbox One</li>
  				<li>PS4</li>
  				<li>PC</li>
  				<li>PS3</li>
  				<li>Xbox 360</li>
  			</ul>
  			<content_title>INFORMATION</content_title>
  			<newhr></newhr>
  			<text>${requestScope.game.info }</text>
  			<%
  			
			List<Video> list=(List<Video>)request.getAttribute("video");
			Iterator<Video> iterator=list.iterator();
			if(iterator.hasNext())
			{
				out.print("<content_title>VIDEO</content_title>");
				out.print("<newhr></newhr>");
			}
			int i=0;
			while(iterator.hasNext()&&i<4)
			{
				Video video=iterator.next();
				out.print("<video_block ><a href='video/game="+request.getAttribute("name").toString().replace("%20", " ")+"&video_name="+video.getVideo_name().toString()+"'><img alt='' src='CSS/video/poster/"+request.getAttribute("name").toString().replace("%20", " ").replace(":", " ")+"/"+video.getVideo_name().toString()+".jpg'></a></video_block>");
				i++;
			}
  			 %>	
  			<content_title>SPECIFICATIONS</content_title>
  			<newhr></newhr>
  			<table width="100%">
  				<tr><td width="30%">Developer</td><td style='font-weight:bold;' width="70%">${requestScope.game.developer }</td></tr>
  				<tr><td>Platform</td><td style='font-weight:bold;'>${requestScope.game.platform }</td></tr>
  				<tr><td>Release Date</td><td style='font-weight:bold;'>${requestScope.game.releasedate }</td></tr>
  			</table>
  				
  		</rightArea>
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
  </body>	
  	<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<script src="JavaScript/game.js"></script>
</html>

