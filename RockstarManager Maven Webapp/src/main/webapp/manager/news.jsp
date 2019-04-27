<%@page import="com.model.News"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'NEW.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script src="../JavaScript/jquery-1.4.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/news.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/PromptBox.js"></script>
  	<script type="text/javascript" charset="utf-8" src="../JavaScript/pageing.js" ></script>
	<style type="text/css">
	<!--
		@import URL(../CSS/game.css);
		@import URL(../CSS/news.css);
		@import URL(../CSS/pageing.css);
	-->
	</style>
  </head>
  
  <body>
    <h1>News Manager</h1>
    <form action="manager/addNews" method="post" enctype="multipart/form-data" onsubmit="return check()">
  		<table border="1" id="table1">
  			<tr><td width="200px">title-1</td><td><input type="search" id="title_1" name="title_1" placeholder="title_1"></td></tr>
  			<tr><td >title-2</td><td><input type="search" id="title_2" name="title_2" placeholder="title_2"></td></tr>
  			<tr><td >title-3</td><td><input type="search" id="title_3" name="title_3" placeholder="title_3"></td></tr>
  			<tr><td >rank</td><td><select id="rank" name="rank"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></td></tr>
  			<tr><td >create_date</td><td><input type="search" id="create_date" name="create_date" placeholder="yyyy-mm-dd 24hh:mi:ss"></td></tr>
  			<tr><td colspan="2"><button type="button" onclick="addSymbol('&lt;')">&lt;</button>
  								<button type="button" onclick="addSymbol('&gt;')">&gt;</button>
  								<button type="button" onclick="addSymbol('&amp;')">&amp;</button>
  								<button type="button" onclick="addSymbol('\&apos;')">&apos;</button>
  								<button type="button" onclick="addSymbol('&quot;')">&quot;</button>
  								<button type="button" onclick="addTag('img')">&lt;img&gt;</button>
  								<button type="button" onclick="addTag('/img')">&lt;/img&gt;</button>
  								<button type="button" onclick="addTag('p')">&lt;p&gt;</button>
  								<button type="button" onclick="addTag('/p')">&lt;/p&gt;</button>
  								<button type="button" onclick="addList()">list</button>
  								<button type="button" onclick="addTag('/a')">&lt;a&gt;</button>
  								<button type="button" onclick="addTag('/a')">&lt;/a&gt;</button></td></tr>
  			<tr><td colspan="2"><textarea id="content" name="content" placeholder="content"></textarea></td></tr>
  			<tr><td colspan="2"><input type="submit" id="sub" value="submit" ></td></tr>
  		</table>
  	</form>
  	
  	<%
    	List<News> newses=(List<News>)request.getAttribute("news");
    	if(newses!=null)
    	{
    		out.print("<table border=\"1\" id=\"table2\">");
    		out.print("<thead><th></th><th>ID</th><th>CREATE_TIME</th><th>UPLOAD_TIME</th><th>LIKES</th><th>UPLOADER_NAME</th></thead>");
    		for(News n:newses)
    		{
    			out.print("<tr id=\""+n.getID()+"\"><td><input type=\"button\" onclick=\"del('"+n.getID()+"')\" value=\"delete\"></td><td>"+n.getID()+"</td><td>"+n.getCREATE_DATE()+"</td><td>"+n.getUPLOAD_DATE()+"</td><td>"+n.getLikes()+"</td><td>"+n.getUserset().getUsername()+"</td></tr>");
    		}
    		out.print("</table>");
    	}
    
     %>
     <input type="hidden" id="totalNum" value="${pageing.totalNum} ">
	  <input type="hidden" id="totalPage" value="${pageing.totalPage}">
	  <input type="hidden" id="pageSize" value="${pageing.pageSize}">
	  <input type="hidden" id="current" value="${pageing.current}">
	  <input type="hidden" id="target" value="news">
     <div id="pageing">
     	<left>
     		<button id="pre" onclick="window.location.href='manager/news?target=news&current=${pageing.current -1}'">pre</button>
     		<span id="span"></span>
     		<button id="next" onclick="window.location.href='manager/news?target=news&current=${pageing.current+1}'" >next</button>
     		totalNum:${pageing.totalNum}
     	</left>
     	<right>
     		totalPage:<span id="total"></span>,jump to <input type="text" id="jumpTo" > <input type="button" value="  To  " id="jump" onclick="TO()">
     	</right>
     </div>
  </body>
</html>
