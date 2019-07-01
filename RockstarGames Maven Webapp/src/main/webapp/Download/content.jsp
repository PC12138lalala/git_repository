<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.model.Video"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'content.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		<!--
			@import URL(CSS/downloadCont.css);
		-->
	</style>
  </head>
  
  <body>
    <%
    	if(request.getAttribute("target").equals("video"))
    	{
			List<Video> list=(List<Video>)request.getAttribute("video");
			Iterator<Video> iterator=list.iterator();
			while(iterator.hasNext() )
			{
				Video video=iterator.next();
				out.print("<div id='block'>");
				out.print("<div id='video_block' ><a href='Download/toDownload?videoName="+video.getVideo_name()+"&type=video&game="+video.getGameinfo().getName()+"'><img src='CSS/video/poster/"+video.getGameinfo().getName().replace(":", " ").toString()+"/"+video.getVideo_name().toString()+".jpg'></a></div>");
				out.print("<div id='text'><a href='Download/toDownload?videoName="+video.getVideo_name()+"&type=video&game="+video.getGameinfo().getName()+"'>"+video.getVideo_name()+".mp4</a></div>");
				out.print("</div>");
			}
		}
  	 %>	
    
  </body>
</html>
