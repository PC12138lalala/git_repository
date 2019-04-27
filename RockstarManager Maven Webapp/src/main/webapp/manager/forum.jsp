<%@page import="com.model.Forum"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'forum.jsp' starting page</title>
    
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
		@import URL(../CSS/user.css);
		@import URL(../CSS/pageing.css);
	-->
	</style>
	<script src="../JavaScript/jquery-1.4.js"></script>
	<script charset="utf-8" src="../JavaScript/changeForumStatus.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/PromptBox.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/pageing.js" ></script>
  
  </head>
  
  <body>
    <h1>Forum Info</h1>
    <% 
    List<Forum> forum=(List<Forum>)request.getAttribute("forum");
    if(forum!=null)
    	{
    		out.print("<table border=\"1\">");
    		out.print("<thead><th>title</th><th>content</th><th>mdate</th><th>isLocked</th><th>isDeleted</th><th>istop</th><th>user</th><th>game</th></thead>");
    		for(Forum f:forum)
    		{
    			out.print("<tr><td>"+f.getTitle()+"</td><td>"+f.getContent()+"</td><td>"+f.getMdate()+"</td>");
    			if(f.getIslocked().toString().equals("Y"))
    			{
    				out.print("<td><select onchange=\"changeStatus('"+f.getId()+"','ISLOCKED')\" name=\""+f.getId()+"l\"><option value=\"N\">No</option><option selected value=\"Y\">Yes</option></select></td>");
    			}
    			else
    			{
    				out.print("<td><select onchange=\"changeStatus('"+f.getId()+"','ISLOCKED')\" name=\""+f.getId()+"l\"><option selected value=\"N\">No</option><option value=\"Y\">Yes</option></select></td>");
    			}
    			if(f.getIsdelete().toString().equals("Y"))
    			{
    				out.print("<td><select onchange=\"changeStatus('"+f.getId()+"','ISDELETE')\" name=\""+f.getId()+"d\"><option value=\"N\">No</option><option selected value=\"Y\">Yes</option></select></td>");
    			}
    			else
    			{
    				out.print("<td><select onchange=\"changeStatus('"+f.getId()+"','ISDELETE')\" name=\""+f.getId()+"d\"><option selected value=\"N\">No</option><option value=\"Y\">Yes</option></select></td>");
    			}
    			if(f.getIstop().toString().equals("Y"))
    			{
    				out.print("<td><select onchange=\"changeStatus('"+f.getId()+"','ISTOP')\" name=\""+f.getId()+"t\"><option value=\"N\">No</option><option selected value=\"Y\">Yes</option></select></td>");
    			}
    			else
    			{
    				out.print("<td><select onchange=\"changeStatus('"+f.getId()+"','ISTOP')\" name=\""+f.getId()+"t\"><option selected value=\"N\">No</option><option value=\"Y\">Yes</option></select></td>");
    			}
    			out.print("<td>"+f.getUserset().getUsername()+"</td><td>"+f.getGameinfo().getName()+"</td></tr>");
    			
    		}
    		out.print("</table>");
    	}
    
     %>
     <input type="hidden" id="totalNum" value="${pageing.totalNum} ">
	  <input type="hidden" id="totalPage" value="${pageing.totalPage}">
	  <input type="hidden" id="pageSize" value="${pageing.pageSize}">
	  <input type="hidden" id="current" value="${pageing.current}">
	  <input type="hidden" id="target" value="forum">
     <div id="pageing">
     	<left>
     		<button id="pre" onclick="window.location.href='manager/forum?target=forum&current=${pageing.current -1}'">pre</button>
     		<span id="span"></span>
     		<button id="next" onclick="window.location.href='manager/forum?target=forum&current=${pageing.current+1}'" >next</button>
     		totalNum:${pageing.totalNum}
     	</left>
     	<right>
     	totalPage:<span id="total"></span>,jump to <input type="text" id="jumpTo" > <input type="button" value="  To  " id="jump" onclick="TO()">
     </div>
  </body>
</html>
