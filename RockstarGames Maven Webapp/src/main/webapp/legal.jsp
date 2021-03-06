<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix= "spring" uri= "http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>legal</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" type="image/x-icon" href="CSS/image/small_icon.jpg" />
	
	<style type="text/css">
	<!--
		@import URL(CSS/homepage.css);
		@import URL(CSS/text.css);
	-->
	</style>

  </head>
  
  <body>
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
  	<div id="textbox">
  		<h1>TERMS OF SERVICE</h1>
  		<h3>TERMS & CONDITIONS</h3>
  		<center><div id="newhr"></div></center>
  		<p>This document constitutes an agreement (the “Agreement”) between you and the United States company Rockstar Games, Inc., its parents, subsidiaries, and affiliates, (the “Company,” “we,” “us,” and “our”) that governs the relationship between you and the Company with respect to your use of the Online Services. The Company provides access to the Online Services and any related services subject to your compliance with this Agreement. Thus, it is important that you carefully read and understand this Agreement.

This Internet website is the property of Rockstar Games, a wholly owned subsidiary of Take Two Interactive (collectively, the "Company").

The terms and conditions herein are in addition to and supplement the End User License Agreement at www.rockstargames.com/eula that governs the use of all software and services distributed by the Company.

Description Of Online Services
Trademark And Copyright Information
Submissions
Code Of Conduct
Limited License By The Company
License To The Company
Making Purchases
Ringtones, Wallpapers, And Other Mobile Device Services & Products
Virtual Currency And Virtual Goods
Warranty Disclaimer
Void Where Prohibited
Indemnification
Litigation Issues
Termination
Miscellaneous
Designated Agent Under the Digital Millenium Copyright Act
Repeat Infringer Policy
  		</p>
  		<h3>DISCRIPTION OF ONLINE SERVICES</h3>
  		<center><div id="newhr"></div></center>
  		<p>Subject to full compliance with this Agreement, the Company may offer to provide certain products, services, and websites accessed through internet-capable hardware platforms including gaming consoles, personal computers, mobile computers, or smart phones, or in-game applications or software platforms including third-party hosts (collectively the "Online Services"). Online Services shall include, but not be limited to, any service or content the Company provides to you, including any materials displayed or performed. The Company may change, suspend or discontinue the Online Services for any reason, at any time, including the availability of any feature or content. The Company may also impose limits on certain features and services or restrict your access to parts or all of the Online Services without notice or liability.</p>
  		<h3>TRADEMARK AND COPYRIGHT INFOMATION</h3>
  		<center><div id="newhr"></div></center>
  		<p>All Online Services material, including, but not limited to, text, data, graphics, logos, button icons, images, audio clips, video clips, links, digital downloads, data compilations, and software is owned, controlled by, licensed to, or used with permission by the Company and is protected by copyright, trademark, and other intellectual property rights. The Online Services material is made available solely for your personal, non-commercial use and may not be copied, reproduced, republished, modified, uploaded, posted, transmitted, or distributed in any way, including by email or other electronic means, without the express prior written consent of the Company in each instance. You may download material intentionally made available for downloading through the Online Services for your personal, non-commercial use only, provided that you keep intact any and all copyright and other proprietary notices that may appear on such materials.</p>
  		<h3>SUBMISSIONS</h3>
  		<center><div id="newhr"></div></center>
  		<p>PLEASE NOTE: The Company welcomes input from the gaming community. However, any submissions to the Company of any nature whatsoever, whether through a posting on a Company website, email to the Company, mail, or any other means, becomes the sole and exclusive property of the Company, which shall have full right, title and interest thereto, including all copyrights(including the right to create a derivative work and the right of the original author in the exploitation of a derivative work), in all mediums now existing or hereafter created, and without any obligation to account, credit, or make any payment to the submitter for any use thereof. No purported reservation of rights incorporated in or accompanying any submission shall have any force or effect. By making a submission of any kind to the Company, you hereby agree to all of the foregoing.</p>
  		<h3>CODE OF CONDUCT</h3>
  		<center><div id="newhr"></div></center>
  		<p>The following rules, policies, and disclaimers shall govern and/or apply to your use of the Online Services.

You agree, by using the Online Services, that: (1) you will only use the Online Services for lawful purposes, in compliance with applicable laws, for your own personal, non-commercial use; (2) you will not restrict or inhibit any other user from using and enjoying the Online Services (for example, by means of harassment, hacking or defacement); (3) you will not use the Online Services to create, upload, or post any material that is knowingly false and/or defamatory, inaccurate, abusive, vulgar, obscene, profane, hateful, harassing, sexually oriented, threatening, invasive of one’s privacy, in violation of any law, or is inconsistent with community standards; (4) you will not post, upload, or create any copyrighted material using the Online Services unless you own the copyright in and to such material; (5) you will not post, upload, or transmit any information or software that contains a virus, worm, timebomb, cancelbot, trojan horse or other harmful, disruptive, or deleterious component; (6) you will not post, upload, create, or transmit materials in violation of another party’s copyright or other intellectual property rights; (7) you will not cheat or utilize any unauthorized robot, spider, or other program in connection with the Online Services; and (8) you will not impersonate any other individual or entity in connection with your use of the Online Services. All determinations will be made by the Company in its sole discretion.

When we provide Online Services involving user-created content (“UGC”), we do not review every piece of UGC, nor do we confirm the accuracy, validity, or originality of the UGC posted. We do not actively monitor the contents of the postings, nor are we responsible for the content of any postings. We do not vouch for, nor do we warrant the validity, accuracy, completeness, or usefulness of any UGC. The contents of the postings do not represent the views of the Company, its subsidiaries, or any person or property associated with the Company, the Online Services, or any website in the Company’s family of websites. If you feel that any posting is objectionable, we encourage you to use associated report functions or contact us by visiting www.rockstargames.com/support. We will remove objectionable content if we deem removal to be warranted. Please understand that removal or editing of any content is a manual process and might not occur immediately. We reserve the right to remove (or not) any UGC or content for any (or no) reason whatsoever. You remain solely responsible for your UGC, and you agree to indemnify and hold harmless the Company and its agents with respect to any claim based upon the transmission of your UGC. Posting of advertisements, chain letters, pyramid schemes, solicitations, and the like, are inappropriate and forbidden on the Online Services (including bulletin boards and chat rooms).

We reserve the right to reveal your identity (including whatever information we know about you) without notice to you in certain circumstances set forth in our Privacy Policy. Please visit www.rockstargames.com/privacy for more details.</p>
  		<h3>LIMITED LICENSE BY THE COMPANY</h3>
  		<center><div id="newhr"></div></center>
  		<p>The Company grants you a limited, non-sublicensable license to access and use the Online Services. Such license is subject to this Agreement and, as applicable, the software EULA located at www.rockstargames.com/eula, and specifically conditioned upon the following: (i) you may only view, copy and print portions of the Online Services for your own informational, personal and non-commercial use; (ii) you may not modify or otherwise make derivative uses of the Online Services, or any portion thereof; (iii) you may not remove or modify any copyright, trademark, or other proprietary notices that have been placed in the Online Services; (iv) you may not use any data mining, robots or similar data gathering or extraction methods; (v) you may not use the Online Services other than for their intended purpose; (vi) you may not reproduce, prepare derivative works from, distribute or display the Online Services, except as provided herein; and (vii) you must not violate the Code of Conduct set forth above.

Except as expressly permitted above, any use of any portion of the Online Services without the prior written permission of the Company is strictly prohibited and will terminate the license granted herein. Any such unauthorized use may also violate applicable laws, including without limitation copyright and trademark laws and applicable communications regulations and statutes. Unless explicitly stated herein, nothing in this Agreement may be construed as conferring any license to intellectual property rights, whether by estoppel, implication or otherwise. This license is revocable at any time.

You represent and warrant that your use of the Online Services will be consistent with this license, the EULA, and any other applicable agreements or policies, and will not infringe or violate the rights of any other party or breach any contract or legal duty to any other parties, or violate any applicable law. You expressly agree to indemnify the Company against any liability to any person arising out of your use of Online Services not in accordance with this Agreement. To request permission for uses of the Online Services not included in the foregoing license, you may write to the Company at webmaster@take2games.com.</p>
  		<h3>LICENSE TO THE COMPANY</h3>
  		<center><div id="newhr"></div></center>
  		<p>By creating UGC, posting messages, uploading files, creating files, inputting data, or engaging in any form of communication with or through the Online Services, you are granting the Company a royalty-free, perpetual, non-exclusive, unrestricted, worldwide license to: (1) use, copy, sublicense, adapt, transmit, publicly perform, or display any such material; and (2) sublicense to third parties the unrestricted right to exercise any of the foregoing rights granted with respect to the material. The foregoing grants shall include the right to exploit any proprietary rights in such material, including but not limited to rights under copyright, trademark, service mark, or patent laws under any relevant jurisdiction. Please consult the EULA at www.rockstargames.com/eula for additional license terms related to our software.</p>
  		<h3>MARKING PURCHASES</h3>
  		<center><div id="newhr"></div></center>
  		<p>If you wish to purchase products or services described in the Online Services, you may be asked to supply certain information including credit card or other payment information. You agree that all information that you provide will be accurate, complete, and current. You agree to pay all charges, including shipping and handling charges, incurred by users of your credit card or other payment mechanism at the prices in effect when such charges are incurred. You will also be responsible for paying any applicable taxes relating to your purchases. Please review the the Company’s privacy policy at www.rockstargames.com/privacy before submitting such information.</p>
  		<h3>RINGTONES, WALLPAPERS, AND OTHER MOBILE DEVICE SERVICES & PRODUCTS</h3>
  		<center><div id="newhr"></div></center>
  		<p>Certain mobile phone handsets and carriers offer services that enable consumers to select and purchase directly through their mobile devices various digital mobile products. The Online Services may also offer the ability to select and purchase various digital mobile products that will be delivered to your mobile device. These digital mobile products offerings and products may enable the consumer to customize their mobile device or mobile device service (for example with ringtones or wallpaper), or allow the consumer to select certain video or audio files that can be viewed or listened to whenever the consumer chooses. All or some of the digital mobile products offerings may not be available on, transmissible to, or compatible with all mobile devices. As a result, consumers may not be able to access, purchase or make use of all the services or offerings. Any attempt to purchase these products or services may result in mobile carrier charges being separately billed to your mobile device account for SMS messaging or other communications. In addition, the consumer may be separately billed by the mobile carrier for the actual product, service or offering selected. In the event the consumer has a call waiting and an incoming call is received while accessing or ordering any mobile product or service, such product, service or other offering may be interrupted or may not completely download. You can unsubscribe from any subscription service by following the instructions in the message or on the website related to the product. Please see http://www.rockstargames.com/support for support information regarding our other products.</p>
  		<h3>VIRTUAL CURRENCY AND VIRTUAL GOODS</h3>
  		<center><div id="newhr"></div></center>
  		<p>The Online Services, including software, may offer the ability to purchase and/or earn via gameplay a limited license to use virtual currency and/or virtual goods exclusively within applicable software and services provided by the Company. Such license is subject to and specifically conditioned upon your acceptance of, and compliance with, the EULA, this Agreement and any other applicable policies or agreements. All in-game Virtual Currency and/or Virtual Goods may be consumed or lost by players in the course of gameplay according to the game’s rules applicable to currency and goods, which may vary. See the EULA at www.rockstargames.com/eula for more details.</p>
  		<h3>WARRANTY DISCLAIMER</h3>
  		<center><div id="newhr"></div></center>
  		<p>THE COMPANY MAY PROVIDE LINKS AND POINTERS TO INTERNET WEBSITES MAINTAINED BY THIRD PARTIES (“THIRD-PARTY SITES”) AND MAY, FROM TIME TO TIME, PROVIDE THIRD-PARTY MATERIALS ON ITS WEBSITES. NEITHER THE COMPANY, ITS PARENT OR SUBSIDIARY COMPANIES, NOR THEIR AFFILIATES, ENDORSE, TAKE RESPONSIBILITY FOR, OPERATE OR CONTROL IN ANY RESPECT ANY INFORMATION, PRODUCTS, OR SERVICES ON THESE THIRD-PARTY SITES. THE MATERIALS ON COMPANY WEBSITES AND THE THIRD-PARTY SITES ARE PROVIDED “AS IS” AND “AS AVAILABLE” WITH NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT. YOU ASSUME TOTAL RESPONSIBILITY AND RISK FOR YOUR USE OF COMPANY WEBSITES AND THE ONLINE SERVICES.</p>
  		<h3>VOID WHERE PROHIBITED</h3>
  		<center><div id="newhr"></div></center>
  		<p>Although Company Online Services are accessible worldwide, not all products or services are available to all persons or in all geographic locations. The Company reserves the right to limit, in its sole discretion, the provision and quantity of any product or service to any person or geographic area it so desires. Any offer for any product or service made is void where prohibited.</p>
  		<h3>INDEMNIFICATION</h3>
  		<center><div id="newhr"></div></center>
  		<p>You agree to indemnify, defend, and hold harmless the Company and its affiliated companies, officers, directors, employees, agents, licensors, and suppliers from and against all losses, expenses, damages, and costs, including reasonable attorneys’ fees, resulting from any violation by you of this Agreement. The Company reserves the right to assume the exclusive defense and control of any matter subject to indemnification by you.</p>
  		<h3>LITIGATION ISSUES</h3>
  		<center><div id="newhr"></div></center>
  		<p>This Agreement is entered into in the State of New York and shall be governed by, and construed in accordance with, the laws of the State of New York, exclusive of its choice of law rules. You and the Company agree to submit to the exclusive jurisdiction of the state and federal courts sitting in the Borough of Manhattan in the City of New York in the State of New York, and waive any jurisdictional, venue, or inconvenient forum objections to such courts. You and the Company further agree as follows: (i) any claim brought to enforce this Agreement must be commenced within two (2) years of the cause of action accruing; (ii) no recovery may be sought or received for damages other than out-of-pocket expenses, except that the prevailing party will be entitled to costs and attorneys’ fees; and (iii) any claim must be brought individually and not consolidated as part of a group or class action complaint.</p>
  		<h3>TERMINATION</h3>
  		<center><div id="newhr"></div></center>
  		<p>The Company may terminate or suspend any and all Online Services and any registered account immediately, without prior notice or liability, for any reason, including if you breach any terms and conditions of this Agreement. Upon termination of your account, your right to use the Online Services will immediately cease. If you wish to terminate your account, you may simply discontinue using the Online Services. All provisions of this Agreement which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>
  		<h3>MISCELLANEOUS</h3>
  		<center><div id="newhr"></div></center>
  		<p>In the event that any of the provisions of this Agreement are held by a court or other tribunal of competent jurisdiction to be unenforceable, such provisions shall be limited or eliminated to the minimum extent necessary so that this Agreement shall otherwise remain in full force and effect. This Agreement, along with the Privacy Policy located at www.rockstargames.com/privacy and the EULA, constitutes the entire agreement between you and the Company pertaining to the subject matter hereof, and any and all written or oral agreements heretofore existing between you and the Company with respect to the subject matter of this Agreement are expressly canceled. The Company may modify the terms of this Agreement at any time in its sole discretion by posting a revised Agreement or, in the case of a material modification, by posting notice of such modification on the website page entitled “Legal Notices” or “Legal Information” (or similar title) before the modification takes effect.</p>
  		<h3>DESIGNATED AGENT UNDER THE DIGITAL MILLENNIUM COPYRIGHT ACT</h3>
  		<center><div id="newhr"></div></center>
  		<p>The Digital Millennium Copyright Act (“DMCA”) provides a mechanism for notifying service providers of claims of unauthorized use of copyrighted materials. Under the DMCA, a claim must be sent to the service provider’s designated agent. If you believe in good faith that the Company should be notified of a possible online copyright infringement involving any Online Service, please notify the Company’s designated agent:

Service Provider: Take-Two Interactive Software, Inc.
Address of Designated Agent:
Take-Two Interactive Software, Inc.
622 Broadway
New York, New York 10012
Attention: General Counsel

Telephone Number of Designated Agent: 646-536-2842
Facsimile Number of Designated Agent: 646-941-3566

Email Address of Designated Agent: copyright@take2games.com

Please be aware that, in order to be effective, your notice of claim must comply with the detailed requirements set forth in the DMCA. You are encouraged to review them (see 17 U.S.C. Sec. 512(c)(3)) before sending your notice of claim.

To meet the notice requirements under the DMCA, the notification must be a written communication that includes the following: To meet the notice requirements under the DMCA, the notification must be a written communication that includes the following: (1) A physical or electronic signature of a person authorized to act on behalf of the owner of an exclusive right that is allegedly infringed; (2) Identification of the copyrighted work claimed to have been infringed, or, if multiple copyrighted works at a single online site are covered by a single notification, a representative list of such works at that site; (3) Identification of the material that is claimed to be infringing or to be the subject of infringing activity and that is to be removed or access to which is to be disabled, and information reasonably sufficient to permit us to locate the material; (4) Information reasonably sufficient to permit us to contact the complaining party, such as an address, telephone number and, if available, an electronic mail address at which the complaining party may be contacted; (5) A statement that the complaining party has a good-faith belief that use of the material in the manner complained of is not authorized by the copyright owner, its agent or the law; and (6) A statement that the information in the notification is accurate, and under penalty of perjury, that the complaining party is authorized to act on behalf of the owner of an exclusive right that is allegedly infringed.</p>
  		<h3>REPEAT INFRINGER POLICY</h3>
  		<center><div id="newhr"></div></center>
  		<p>In accordance with the DMCA and other applicable law, the Company has adopted a policy of terminating, in appropriate circumstances and at Company’s sole discretion, registered accounts deemed to be repeat infringers. The Company may also at its sole discretion limit access to the Online Services and/or terminate the account of anyone who infringes any intellectual property rights of others, whether or not there is any repeat infringement.</p>
  	</div>
  	<hr style="width:100%;height:4px;background-color:black;border:0;margin:0 0 0 0;"></hr>
  	<div id="foot">
  		<div id="bottom_icon"></div>
  		<div id="bottom">
  			<div id="s_nav">
  				<ul>
  					<li><a href="support"><spring:message code="support"/></a></li>
  					<li><a href="privacy"><spring:message code="privacy"/></a></li>
  					<li><spring:message code="legal"/></li>
  				</ul>
  			</div>
  		</div>
  	</div>
  </body>
</html>
