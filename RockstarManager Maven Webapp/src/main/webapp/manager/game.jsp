<%@page import="com.model.Gameinfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'game.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="../JavaScript/jquery-1.4.js"></script>
	<script charset="utf-8" src="../JavaScript/ChangeUserStatus.js"></script>
  	<style type="text/css">
	<!--
		@import URL(../CSS/game.css);
		@import URL(../CSS/pageing.css);
	-->
	</style>
	<script src="../JavaScript/jquery-1.4.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/Game.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/PromptBox.js"></script>
  	<script type="text/javascript" charset="utf-8" src="../JavaScript/pageing.js" ></script>
  
  </head>
  
  <body>
  <h1>Game Info</h1>
  	<form action="manager/addGame" method="post" onsubmit="return check()" enctype="multipart/form-data">
  		<table border="1" id="table1">
  			<tr><td width="260px">Name:</td><td><input type="search" id="name" name="name" placeholder="name"></td></tr>
  			<tr><td>Developer:</td><td><input type="search" id="developer" name="developer" placeholder="developer"></td></tr>
  			<tr><td>Platform:</td><td><input type="search" id="platform" name="platform" placeholder="platform"></td></tr>
  			<tr><td>ReleaseDate:</td><td><input type="search" id="releaseDate" name="releaseDate" placeholder="yyyy-mm-dd 24hh:mi:ss"></td></tr>
  			<tr><td>INFO:</td><td><textarea id="info" name="info"></textarea></td></tr>
  			<tr><td>SELECT PHOTO(307*379,png):</td><td><input type="file" accept="image/png" id="phtot" name="photo"></td></tr>
  			<tr><td colspan="2"><input type="submit" id="sub" value="submit"></td></tr>
  		</table>
  	</form>
    <%
    	List<Gameinfo> game=(List<Gameinfo>)request.getAttribute("game");
    	if(game!=null)
    	{
    		out.print("<table border=\"1\" id=\"table2\">");
    		out.print("<thead><th></th><th>Name</th><th>Developer</th><th>Platform</th><th>ReleaseDate</th><th>Info</th></thead>");
    		for(Gameinfo g:game)
    		{
    			out.print("<tr id=\""+g.getName()+"\"><td><input type=\"button\" onclick=\"del('"+g.getName()+"')\" value=\"delete\"></td><td>"+g.getName()+"</td><td>"+g.getDeveloper()+"</td><td>"+g.getPlatform()+"</td><td>"+g.getReleasedate()+"</td><td>"+g.getInfo()+"</td></tr>");
    		}
    		out.print("</table>");
    	}
    
     %>
     <input type="hidden" id="totalNum" value="${pageing.totalNum} ">
	  <input type="hidden" id="totalPage" value="${pageing.totalPage}">
	  <input type="hidden" id="pageSize" value="${pageing.pageSize}">
	  <input type="hidden" id="current" value="${pageing.current}">
	  <input type="hidden" id="target" value="game">
     <div id="pageing">
     	<left>
     		<button id="pre" onclick="window.location.href='manager/game?target=game&current=${pageing.current -1}'">pre</button>
     		<span id="span"></span>
     		<button id="next" onclick="window.location.href='manager/game?target=game&current=${pageing.current+1}'" >next</button>
     		totalNum:${pageing.totalNum}
     	</left>
     	<right>
     		totalPage:<span id="total"></span>,jump to <input type="text" id="jumpTo" > <input type="button" value="  To  " id="jump" onclick="TO()">
     	</right>
     </div>
  </body>
</html>
