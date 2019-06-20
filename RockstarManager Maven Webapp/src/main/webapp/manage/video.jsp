<%@page import="com.model.Gameinfo"%>
<%@page import="com.model.Video"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'video.jsp' starting page</title>
    
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
		@IMPORT url("../CSS/video.css");
		@import URL(../CSS/pageing.css);
	-->
	</style>
	<script src="../JavaScript/jquery-1.4.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/video.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/PromptBox.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/pageing.js" ></script>
  
  </head>
  
  <body>
    <h1>Video Info</h1>
    <form action="manage/addVideo" method="post" onsubmit="return check()" enctype="multipart/form-data">
  		<table border="1" id="table1">
  			<tr><td width="260px">Name:</td><td><input type="search" id="video_name" name="video_name" placeholder="name"></td></tr>
  			<%
  				List<Gameinfo> game=(List<Gameinfo>)request.getAttribute("game");
  				String l="";
  				for(Gameinfo g:game )
  				{
  					l+="<option value=\""+g.getName()+"\">"+g.getName()+"</option>";
  				}	
  				
  				out.print("<tr><td>Game:</td><td><select name=\"name\" id=\"name\">"+l+"</select></td></tr>");
  			 %> 
  			 <tr><td>select a video:(mp4)</td><td><input type="file" id="video" name="video" accept="video/mp4"></td></tr>
  			 <tr><td>select a poster:(jpg)</td><td><input type="file" id="photo" name="photo" accept="image/jpeg"></td></tr>		
  			<tr><td colspan="2"><input type="submit" id="sub" value="submit"></td></tr>
  		</table>
  	</form>
  	<%
    	List<Video> video=(List<Video>)request.getAttribute("video");
    	if(video!=null)
    	{
    		out.print("<table border=\"1\" id=\"table2\">");
    		out.print("<thead><th></th><th>VideoName</th><th>View</th><th>UploadDate</th><th>Game</th><th>UploadUser</th></thead>");
    		for(Video v:video)
    		{
    			out.print("<tr id=\""+v.getId()+"\"><td><input type=\"button\" onclick=\"del('"+v.getId()+"')\" value=\"delete\"></td><td>"+v.getVideo_name()+"</td><td>"+v.getView_time()+"</td><td>"+v.getUpdate_date()+"</td><td>"+v.getGameinfo().getName()+"</td><td>"+v.getUserset().getUsername()+"</td></tr>");
    		}
    		out.print("</table>");
    	}
    
     %>
     <input type="hidden" id="totalNum" value="${pageing.totalNum} ">
	  <input type="hidden" id="totalPage" value="${pageing.totalPage}">
	  <input type="hidden" id="pageSize" value="${pageing.pageSize}">
	  <input type="hidden" id="current" value="${pageing.current}">
	  <input type="hidden" id="target" value="video">
     <div id="pageing">
     	<left>
     		<button id="pre" onclick="window.location.href='manage/video?target=video&current=${pageing.current -1}'">pre</button>
     		<span id="span"></span>
     		<button id="next" onclick="window.location.href='manage/video?target=video&current=${pageing.current+1}'" >next</button>
     		totalNum:${pageing.totalNum}
     	</left>
     	<right>
     		totalPage:<span id="total"></span>,jump to <input type="text" id="jumpTo" > <input type="button" value="  To  " id="jump" onclick="TO()">
     	</right>
     </div>
  </body>
</html>
