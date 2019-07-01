<%@page import="com.model.Forum_comment"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <title>Content</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" type="image/x-icon" href="CSS/image/small_icon.jpg">
	
	<link rel="stylesheet" type="text/css" href="../CSS/homepage.css" />
	<link rel="stylesheet" type="text/css" href="../CSS/text.css" />
	<link rel="stylesheet" type="text/css" href="../CSS/content.css" />
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
  			<table>
  				<tr><td><h2>${requestScope.forum.title} </h2></td></tr>
  				<tr><td><h3>${requestScope.forum.userset.username} | ${requestScope.forum.mdate}</h3></h3></td></tr>
  				<tr><td><textarea disabled>${requestScope.forum.content}</textarea></td></tr>
  			</table>
  			<form action="forum/comment_submit" methdo="post" onsubmit="return check(${sessionScope.userid})">
  				<input type="hidden" name="id" value="${requestScope.forum.id }">
				<table width="70%">
					<tbody>
						<tr><td>your comment:</td></tr>
						<tr><td><textarea name="newcontent" id="newcontent"></textarea></td></tr>
						<tr align="right"><td><input type="submit" value="submit" id="button"></td></tr>
					</tbody>
				</table>
			</form>
			<%
				List<Forum_comment> list2=(List<Forum_comment>)request.getAttribute("forumComment");
				if(list2.size()>0)
				{
					out.print("<table width='70%' style='border:solid 1px gray;'><tbody>");
					for(Forum_comment f:list2)
					{
						out.print("<tr style='height:80px;'><td width='40px'><img src='CSS/image/userPhoto/"+f.getUserset().getUserid()+"HP.png' style='height:40px;width:40px;' onerror=this.src='CSS/image/userPhoto/none_s.png'></td><td> :"+f.getContent()+"</td></tr>");
						out.print("<tr align='right'><td colspan=2 ><p>"+f.getUserset().getUsername()+" | "+f.getCdate()+" | <a href='javascript:void(0)' onclick=\"UpdateForumCommentLike('"+f.getSeq()+"')\" id='"+f.getSeq()+"'>"+f.getLikes()+" likes</a></p></td></tr>");
						out.print("<tr><td colspan=2><hr style='width:100%;height:2px;background-color:gray;border:0;margin:0 0 0 0;'></hr></td></tr>");
					}
				}
				out.print("</tbody></table>");
			 %>
			</div>
			<input type="hidden" id="totalNum" value="${pageing.totalNum} ">
			  <input type="hidden" id="totalPage" value="${pageing.totalPage}">
			  <input type="hidden" id="pageSize" value="${pageing.pageSize}">
			  <input type="hidden" id="current" value="${pageing.current}">
			  <input type="hidden" id="target" value="forum/content?id=${requestScope.forum.id }">
		     <div id="pageing">
		     	<left>
		     		<button id="pre" onclick="window.location.href='forum/content?id=${requestScope.forum.id }&current=${pageing.current -1}'">pre</button>
		     		<span id="span"></span>
		     		<button id="next" onclick="window.location.href='forum/content?id=${requestScope.forum.id }&current=${pageing.current+1}'" >next</button>
		     		totalNum:${pageing.totalNum}
		     	</left>
		     	<right>
		     	totalPage:<span id="total"></span>,jump to <input type="text" id="jumpTo" > <input type="button" value="  To  " id="jump" onclick="TO()">
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
	<script type="text/javascript" src="../JavaScript/forum_content.js" charset="utf-8"></script>
	<script type="text/javascript" src="../JavaScript/PromptBox.js"></script>
	<script type="text/javascript" src="../JavaScript/pageing.js"></script>
	<script type="text/javascript" src="../JavaScript/view&likeUpdate.js" charset="utf-8"></script>
</html>
