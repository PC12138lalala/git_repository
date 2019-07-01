<%@page import="org.springframework.web.servlet.i18n.SessionLocaleResolver"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<a href="homepage?language=en_US">english</a> &nbsp;&nbsp;&nbsp;<a href="homepage?language=zh_CN">简体中文</a><br>

<%	Object now = request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
	out.print(now);
	if(now==null)
		response.sendRedirect("homepage");
	else if (now.toString().equals("zh_CN".toString())){
		response.sendRedirect("homepage?language=zh_CN");
	}else{
		response.sendRedirect("homepage?language=en_US");
	}
	
%>