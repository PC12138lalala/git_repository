<%@page import="com.model.Role"%>
<%@page import="com.model.Userset"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
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
	<script charset="utf-8" src="../JavaScript/ChangeUserStatus.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/PromptBox.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/pageing.js" ></script>
  
  </head>
  
  <body>
  
  <h1>User Info</h1>
    <%
    	List<Userset> userset=(List<Userset>)request.getAttribute("userset");
    	List<Role> role=(List<Role>)request.getAttribute("role");
    	if(userset!=null)
    	{
    		out.print("<table border=\"1\">");
    		out.print("<thead><th>UserName</th><th>Email</th><th>phone</th><th>isLocked</th><th>isDeleted</th><th>Role Info</th></thead>");
    		for(Userset u:userset)
    		{
    			out.print("<tr><td>"+u.getUsername()+"</td><td>"+u.getEmail()+"</td><td>"+u.getPhone()+"</td>");
    			if(u.getIsLocked().toString().equals("Y"))
    			{
    				out.print("<td><select onchange=\"changeStatus('"+u.getUserid()+"','ISLOCKED')\" name=\""+u.getUserid()+"l\"><option value=\"N\">No</option><option selected value=\"Y\">Yes</option></select></td>");
    			}
    			else
    			{
    				out.print("<td><select onchange=\"changeStatus('"+u.getUserid()+"','ISLOCKED')\" name=\""+u.getUserid()+"l\"><option selected value=\"N\">No</option><option value=\"Y\">Yes</option></select></td>");
    			}
    			if(u.getIsDelete().toString().equals("Y"))
    			{
    				out.print("<td><select onchange=\"changeStatus('"+u.getUserid()+"','ISDELETE')\" name=\""+u.getUserid()+"d\"><option value=\"N\">No</option><option selected value=\"Y\">Yes</option></select></td>");
    			}
    			else
    			{
    				out.print("<td><select onchange=\"changeStatus('"+u.getUserid()+"','ISDELETE')\" name=\""+u.getUserid()+"d\"><option selected value=\"N\">No</option><option value=\"Y\">Yes</option></select></td>");
    			}
    			String sel="";
    			sel="<td><select onchange=\"changeStatus('"+u.getUserid()+"','roleid')\" name=\""+u.getUserid()+"i\"><option selected value=\""+u.getRole().getRoleid()+"\">default:"+u.getRole().getRolename()+"</option>";
    			for(Role r:role)
    			{
    				sel+="<option value=\""+r.getRoleid()+"\">"+r.getRolename()+"</option>";
    			}
    			sel+="</select></td></tr>";
    			out.print(sel);
    		}
    		out.print("</table>");
    	}
    
     %>
     <input type="hidden" id="totalNum" value="${pageing.totalNum} ">
	  <input type="hidden" id="totalPage" value="${pageing.totalPage}">
	  <input type="hidden" id="pageSize" value="${pageing.pageSize}">
	  <input type="hidden" id="current" value="${pageing.current}">
	  <input type="hidden" id="target" value="user">
     <div id="pageing">
     	<left>
     		<button id="pre" onclick="window.location.href='manager/user?target=user&current=${pageing.current -1}'">pre</button>
     		<span id="span"></span>
     		<button id="next" onclick="window.location.href='manager/user?target=user&current=${pageing.current+1}'" >next</button>
     		totalNum:${pageing.totalNum}
     	</left>
     	<right>
     	totalPage:<span id="total"></span>,jump to <input type="text" id="jumpTo" > <input type="button" value="  To  " id="jump" onclick="TO()">
     </div>
  </body>
</html>
