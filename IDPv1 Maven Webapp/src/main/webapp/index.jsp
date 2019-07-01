<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="JavaScript/jquery-1.4.js" charset="utf-8"></script>
	<frameset cols="*" rows="0,0,*" noresize="noresize" frameborder="no">
		<%
			ResourceBundle res = ResourceBundle.getBundle("webapp");
			out.print("<frame src='"+res.getString("URL")+":"+res.getString("PORT")+"/UserLogIn?account=");%>${requestScope.account}<%out.print("&pwd=");%>${requestScope.password}<%out.print("' noresize='noresize' frameborder='0'/>");
			res = ResourceBundle.getBundle("manager");
			out.print("<frame src='"+res.getString("URL")+":"+res.getString("PORT")+"/UserLogIn?account=");%>${requestScope.account}<%out.print("&pwd=");%>${requestScope.password}<%out.print("' noresize='noresize' frameborder='0' name='view'/>");
		 %>
		<frame src="a" frameborder="0" name="view"/>	
	
	</frameset>
  </head>
  
  <body>
  
  </body>
</html>
