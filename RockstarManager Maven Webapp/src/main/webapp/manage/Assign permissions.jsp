<%@page import="com.model.RoleNav"%>
<%@page import="com.model.Nav"%>
<%@page import="com.model.Role"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Assign permissions.jsp' starting page</title>
    
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
			@import URL(../CSS/AssignPermissions.css);
		-->
	</style>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/jquery-1.4.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/AssignPermissions.js"></script>
	<script type="text/javascript" charset="utf-8" src="../JavaScript/PromptBox.js"></script>
  
  </head>
  
  <body>
    <h1>Permissions Info</h1>
    <%
    	List<Nav> nav=(List<Nav>)request.getAttribute("nav");
    	List<Role> role=(List<Role>)request.getAttribute("role");
    	List<RoleNav> navrole=(List<RoleNav>)request.getAttribute("navrole");
    	if(role!=null)
    	{
    		out.print("<table border=\"1\">");
    		out.print("<thead><th></th><th>RoleName</th><th>Permissions</th></thead><tbody>");
    		for(Role r:role)
    		{
    			out.print("<tr><td width=\"53px\"><input type=\"button\" onclick=\"upd('"+r.getRoleid()+"')\" value=\"submit\"></td><td id=\"td1\">"+r.getRolename()+"</td><td id=\"td2\">");
    			for(Nav n:nav)
    			{
    				out.println("<input type=\"checkbox\" name=\"'"+r.getRoleid()+"'\" value=\"'"+n.getNavid()+"'\" ");
    				int i=0;
    				for(RoleNav nr:navrole)
    				{
    					if(nr.getRole().getRoleid().equals(r.getRoleid()) && nr.getNav().getNavid().equals(n.getNavid()))
    					{
    						i=1;
    						break;
    					}
    				}
    				if(i==1)
    				{
    					out.print("checked >"+n.getNavname());
    				}
    				else
    				{
    					out.print(">"+n.getNavname());
    				}
    				
    			}
    			out.print("</td></tr>");
    		}
    		out.print("</tbody></table>");
    	}
     %>
  </body>
</html>
