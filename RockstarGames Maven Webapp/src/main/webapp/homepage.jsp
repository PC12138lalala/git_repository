<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="org.springframework.web.servlet.i18n.SessionLocaleResolver"%>
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
    
    <title>Rockstar Games</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/x-icon" href="CSS/image/small_icon.jpg" />
	<link rel="stylesheet" type="text/css" href="CSS/homepage.css" />
	<link rel="stylesheet" type="text/css" href="CSS/test.css" />
	<link rel="stylesheet" type="text/css" href="video/css/video-js.css" />
	<link rel="stylesheet" type="text/css" href="CSS/jSlider.css" />
	<link rel="stylesheet" type="text/css" href="CSS/load_pad.css" />
	
  </head>
  
  <body onscroll="scroll()" style="position: absolute;z-index: 0">
  	<div id="load_pad"><img src="CSS/image/loader.gif" id="load_pic"></div>
  	<div id="hd">
  		<div id="top_icon"></div>
  		<div id="guide">
  			<ul1>
  				<li><a href=""><spring:message code="HOME"/></a></li>
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
  	<div id="white">
  		<div class="top">
  			<div class="jSlider" id="slider1"  data-loop="true" data-navigation="hover" data-indicator="hover">
  			<div><a href="javascript:void(0)" onclick="sc('GRAND THEFT AUTO V/V-afterhours.mp4')"><div id="play"></div><img src="CSS/video/poster/GRAND THEFT AUTO V/V-afterhours.jpg" alt=""></a></div>
  				<div><a href="javascript:void(0)" onclick="sc('GRAND THEFT AUTO V/V_smugglers_run_trailer.mp4')"><div id="play"></div><img src="CSS/video/poster/GRAND THEFT AUTO V/V_smugglers_run_trailer.jpg" alt=""></a></div>
				<div><a href="javascript:void(0)" onclick="sc('GRAND THEFT AUTO V/V_transform_racers.mp4')"><div id="play"></div><img src="CSS/video/poster/GRAND THEFT AUTO V/V_transform_racers.jpg" alt=""></a></div>
			</div>
  		</div>
	  	<div id="vid">
	  			<script type="text/javascript">
		  			document.write("<video  id='my-video' class='video-js' controls  width='"+ window.innerWidth*0.98 +"' height='"+ window.innerWidth*0.98*0.4 +"' poster='CSS/video/poster/GRAND THEFT AUTO V/V-afterhours.jpg' data-setup='{}' >");
		  		</script>
		  			<source src="CSS/video/video/GRAND THEFT AUTO V/V_transform_racers.mp4" type="video/mp4" id="rs">
				</video>
				<script src="video/js/videojs-ie8.min.js"></script>
				<script src="video/js/video.min.js"></script>	
				<script type="text/javascript">
					var myPlayer = videojs('my-video');
					videojs("my-video").ready(function(){
						var myPlayer = this;
						//myPlayer.play();
					});
				</script>
			</div>
		
		<news>
			<h1 id="nh1">ROCKSTAR WAREHOUSE HALLOWEEN SALE: 30% OFF GTAV, RDR GOTY EDITION, SELECT APPAREL AND MORE</h1>
			<img id="nimg" src="CSS/image/news/news.jpg">
		</news>
		<news>
			<h1 id="nh1">GTA ONLINE: TRANSFORM RACES NOW AVAILABLE TO PLAY</h1>
			<img id="nimg" src="CSS/image/news/news2.gif">
		</news>
		<news>
			<h1 id="nh1">CELEBRATE 4 YEARS OF GTA ONLINE, HALLOWEEN SPECIALS, GTA$400K GIVEAWAY AND MORE</h1>
			<img id="nimg" src="CSS/image/news/news1.jpg">
		</news>
	</div>
		
  	<hr style="width:100%;height:4px;background-color:black;border:0;margin:0 0 0 0;"></hr>
  	<div id="lpad"></div>
  	<div id="foot" style="position: absolute;z-index: 10000;">
  		<div id="bottom_icon"></div>
  		<div id="language">
  			<icon id="l_icon"></icon>
  			<span id="current_language">
  				<%
  					Object now = request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
					if(now==null)
						out.print("");
					else if (now.toString().equals("zh_CN".toString())){
						out.print("中文(简体)");
					}else{
						out.print("ENGLISH");
					}
  				
  				 %>
  			</span>
  		</div>
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
	<script src="video/js/videojs-ie8.min.js"></script>
	<script src="JavaScript/jquery.jSlider.js"></script>
	<script src="JavaScript/homepage.js"> </script>
</html>
