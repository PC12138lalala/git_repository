<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.model.Forum"%>
<%@page import="java.io.File"%>
<%@page import="com.model.Userset"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix= "spring" uri= "http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Forum</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" type="image/x-icon" href="CSS/image/small_icon.jpg" />
	
	<link rel="stylesheet" type="text/css" href="../CSS/homepage.css" />
	<link rel="stylesheet" type="text/css" href="../CSS/text.css" />
	<link rel="stylesheet" type="text/css" href="../CSS/forum.css" />
	<link rel="stylesheet" type="text/css" href="../CSS/pageing.css" />
	<link rel="stylesheet" type="text/css" href="../CSS/load_pad.css" />
	
	
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
  	<div id="container">
  		<div id="content">
  			<leftArea id="newdis">
  				<ul>
					<%
						List<Forum> forum=(List<Forum>)request.getAttribute("forum");
						if(forum!=null)
						{
							for(Forum f:forum)
							{
								out.print("<li>");
								out.print("<table >");
								out.print("<tr><td rowspan=\"2\" width=\"18px\">");
								if(f.getIstop().equals("Y"))
								{
									out.print("<img src=\"../CSS/image/forum/pin.png\"></td><td width=\"70%\"><div id=\"of\"><span id=\"span1\">top:</span>");
								}
								else
								{
									out.print("<img src=\"../CSS/image/forum/message.png\"></td><td width=\"70%\"><div id=\"of\"><span id=\"span1\"></span>");
								}
								out.print("<a href=\"forum/content?id="+f.getId()+"&current=1\">"+f.getTitle()+"</div></td><td rowspan=\"2\" width=\"30%\"><img src=\"../CSS/image/forum/chat.png\">"+f.getComments().size()+"</tr>");
								out.print("<tr><td><span id=\"span2\">"+f.getUserset().getUsername()+"</span></td></tr>");
								out.print("</table>");
								out.print("</li>");
							}
						}
					
					
					 %>
  				</ul>
  			<input type="hidden" id="totalNum" value="${pageing.totalNum} ">
			  <input type="hidden" id="totalPage" value="${pageing.totalPage}">
			  <input type="hidden" id="pageSize" value="${pageing.pageSize}">
			  <input type="hidden" id="current" value="${pageing.current}">
			  <input type="hidden" id="target" value="forum/forum?n=0">
		     <div id="pageing">
		     	<left>
		     		<button id="pre" onclick="window.location.href='forum/forum?current=${pageing.current -1}'">pre</button>
		     		<span id="span"></span>
		     		<button id="next" onclick="window.location.href='forum/forum?current=${pageing.current+1}'" >next</button>
		     		totalNum:${pageing.totalNum}
		     	</left>
		     	<right>
		     	totalPage:<span id="total"></span>,jump to <input type="text" id="jumpTo" > <input type="button" value="  To  " id="jump" onclick="TO()">
		     </div>
  			</leftArea>
  			<rightArea>
  				<search>
  					<input type="search" id="condition"><input type="button" value="search" id="toSearch">
  				</search>
  				<block>
  					
  					<%
  						if(session.getAttribute("userid")==null || session.getAttribute("userid").equals(""))
  						{
  							out.print("<input type=\"button\" value=\"log In\" id=\"logIn\" onclick=\"location='LogIn' \"><input type=\"button\" value=\"Sign In\" id=\"logIn\" onclick=\"location='SignIn' \">");
  						}
  						else
  						{	
				  			Userset userset=(Userset)request.getAttribute("userset");
				  			String savePath=application.getRealPath(request.getRequestURI());
							savePath=savePath.substring(0,savePath.lastIndexOf("forum\\forum"));
							savePath+="\\CSS\\image\\userPhoto\\"+session.getAttribute("userid")+"BHP.png";
							File userPhoto=new File(savePath);
							out.print("<input type=\"button\" value=\"Start a new discussion\" id=\"newButton\" ><hr style=\"width:100%;height:4px;background-color:black;border:0;margin:0 0 0 0;\"></hr>");
							out.print("<table>");
							if(userPhoto.exists())
							{
								out.print("<tr><td style=\"width:50%;height:120px;\" rowspan=3><img src='../CSS/image/userPhoto/"+session.getAttribute("userid")+"BHP.png'></td><td>user: <span id=\"span1\">"+userset.getUsername()+"</span></td></tr>");
							}
							else
							{
								out.print("<tr><td style='width:50%;height:120px;' rowspan=3><img src='../CSS/image/userPhoto/none.png'></td><td>user: <span id=\"span1\">"+userset.getUsername()+"</span></td></tr>");
							}
							double y1=1.0*(userset.getLastSign().getTime()-userset.getSignDate().getTime())/60/60/1000/24/365;
							out.print("<tr><td>Use Age: <span id=\"span1\">"+ new DecimalFormat("#.00").format(y1) +" years</span></td></tr>");
							out.print("<tr><td>posts: <span id=\"span1\">"+request.getAttribute("posts")+"</span></td></tr>");
							out.print("</table>");
		  				}
  					 %>
  				</block>
  			</rightArea>
  		</div>
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
	<script type="text/javascript" src="../JavaScript/forum.js" charset="utf-8"></script>
	<script type="text/javascript" src="../JavaScript/PromptBox.js"></script>
	<script type="text/javascript" src="../JavaScript/pageing.js"></script>
</html>