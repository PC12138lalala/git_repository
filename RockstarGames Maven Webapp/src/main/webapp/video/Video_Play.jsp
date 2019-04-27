<%@page import="com.model.Video_comment"%>
<%@page import="com.model.Video"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix= "spring" uri= "http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><%=request.getAttribute("videoName") %></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/x-icon" href="CSS/image/small_icon.jpg" />
	
	<link rel="stylesheet" type="text/css" href="CSS/homepage.css" />
	<link rel="stylesheet" type="text/css" href="CSS/Video_Play.css" />
	<link rel="stylesheet" type="text/css" href="video/css/video-js.css" />
	<link rel="stylesheet" type="text/css" href="CSS/load_pad.css" />
		
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
  	<div id="mainforce">
  		<leftArea>
  			<div id="vid">
		  		<script type="text/javascript">
		  			document.write("<video id='my-video' class='video-js' controls preload='preload' width='"+ window.innerWidth*0.6 +"' height='"+ window.innerWidth*0.6*0.4 +"' poster='CSS/video/poster/<%=request.getAttribute("game").toString().replace("%20", " ").replace(":", " ")%>/<%=request.getAttribute("videoName").toString().replace("%20", " ").replace(":", " ")%>.jpg' data-setup='{}' >");
		  		</script>
					<%		
						String s="<source src='CSS/video/video/"+request.getAttribute("game").toString().replace("%20", " ").replace(":", " ")+"/"+request.getAttribute("videoName")+".mp4' type='video/mp4'>";
						out.print(s);	
					 %>
				</video>
				<script src="video/js/videojs-ie8.min.js"></script>
				<script src="video/js/video.min.js"></script>	
				<script type="text/javascript">
					var myPlayer = videojs('my-video');
					videojs("my-video").ready(function(){
						var myPlayer = this;
						//myPlayer.play();
					});
					
					it=window.setInterval(function() {
						if(!videojs("my-video").paused())
						{
							var str="<%=request.getAttribute("videoName") %>";
							window.clearInterval(it);
							UpdateVideoViewTime(str);
						}
					}, 500)
				</script>
			</div>
			<div id="uploader">
				<table style="margin:0 0 0 5%;width:50%;" >
					<tbody>
						<tr><td colspan=3 style="font-size:15pt;font-family: Courier New;font-weight:bold;position:relative;">${requestScope.videoName }</td></tr>
						<tr><td rowspan=2 style="width:auto;" align="center"><img src="CSS/image/userPhoto/${requestScope.videoInfo.userset.userid }HP.png" onerror="this.src='CSS/image/userPhoto/none_s.png'"></td><td align="right"><img src="CSS/image/male.png"></td><td height="40px">${requestScope.videoInfo.userset.username }</td></tr>
						<tr><td></td><td align='right' style='font-size:18pt;' id='viewtime'><img src="CSS/image/play_time.png">&nbsp;&nbsp;<span >${requestScope.videoInfo.view_time } views</span></td></tr>
				 	</tbody>
				 </table>
			</div>
			<h3><spring:message code="comments"/> :</h3>
			
				<form action="video/comment_submit" methdo="post" onsubmit="return check(${sessionScope.userid})">
					<input type="hidden" name="game" value="<%=request.getAttribute("game") %>">
					<input type="hidden" name="videoName" value="<%=request.getAttribute("videoName")%>">
					<table width="70%" >
						<tbody>
							<tr><td><textarea name="newcontent" id="newcontent"></textarea></td></tr>
							<tr align="right"><td><input type="submit" value="submit" id="button"></td></tr>
						</tbody>
					</table>
				</form>
				<br><br><br>
				<%	
				List<Video_comment> list2=(List<Video_comment>)request.getAttribute("comment");
				if(list2.size()>0)
				{
					out.print("<table width='70%' style='border:solid 1px gray;'><tbody>");
					for(Video_comment v:list2)
					{
						out.print("<tr style='height:80px;'><td width='40px'><img src='CSS/image/userPhoto/"+v.getUserset().getUserid()+"HP.png' style='height:40px;width:40px;' onerror=this.src='CSS/image/userPhoto/none_s.png'></td><td> :"+v.getContent()+"</td></tr>");
						out.print("<tr align='right'><td colspan=2 ><p>"+v.getUserset().getUsername()+" | "+v.getCdate()+" | <a href='javascript:void(0)' onclick=\"UpdateCommentLike('"+v.getSeq()+"')\" id='"+v.getSeq()+"'>"+v.getLikes()+" likes</a></p></td></tr>");
						out.print("<tr><td colspan=2><hr style='width:100%;height:2px;background-color:gray;border:0;margin:0 0 0 0;'></hr></td></tr>");
					}
				}
				out.print("</tbody></table>");
			 %>
			</leftArea>
			<rightArea>
  			<h3><spring:message code="Related video"/>:</h3>
  			<%
  				List<Video> list1=(List<Video>)request.getAttribute("hotvideo");
  				for(Video v :list1)
  				{
  					out.print("<hr style='width:100%;height:2px;background-color:gray;border:0;margin:0 0 0 0;'></hr>");
					out.print("<table style='padding:3% 0;'>");
					out.print("<tr><td rowspan=3 style='width:50%;height:27%;'><a href='video/game="+request.getAttribute("game")+"&video_name="+v.getVideo_name().toString()+"'><img style='width:100%;heigth:100%;' src='CSS/video/poster/"+request.getAttribute("game").toString().replace("%20", " ").replace(":", " ")+"/"+v.getVideo_name()+".jpg'></a></td><td><a href='video/game="+request.getAttribute("game")+"&video_name="+v.getVideo_name()+"'>"+v.getVideo_name()+"</a></td></tr>");
					out.print("<tr><td>upload:"+v.getUpdate_date()+"</td></tr>");
					out.print("<tr><td>view:"+v.getView_time()+"</td></tr>");
					out.print("</table>");
  				}

  			 %>
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
	<script src="JavaScript/game_video.js"></script>
	<script src="video/js/videojs-ie8.min.js"></script>
	<script src="JavaScript/view&likeUpdate.js" charset="utf-8"></script>
	<script type="text/javascript" src="../JavaScript/PromptBox.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function (){
			if(${requestScope.hasSensitiveWords}=="true")
				sAlert("the comment has sensitive words", "alert", "");
		});
	</script>
</html>
