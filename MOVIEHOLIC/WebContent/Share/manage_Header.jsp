<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>


<%

	String [][] navbarImages  = {{"Manage members","../manager/manage_members.jsp"},{"Manage director","../directorEdit/directorList.jsp"},{"Manage review","../reviewEdit/reviewList.jsp"}
	,{"Manage filmaward","./filmaward.jsp"}};


	String currentMenu = request.getParameter("current");
	

	String	username=(String)session.getAttribute("userName");
		
%>
<!--  Navbar -->


<div id="top">
	<div id="memberbar">
		<p id='name'><%= username%></p> 
		<div class="memberbar_inner">
			<a href='../signout.jsp'>sign out</a>
			</div>
	</div>
</div>
<div class="left">
	<div id="title">
		<a href="#"><img src="../images/logo.png"></a>
	</div>
	<div id="managepagemenu" style="float: left">
		<ul>
			<%
							for(String menuItem[] : navbarImages) {
								if(currentMenu != null ) {
									out.println("<li class = 'active'>");
									}
									else{
										out.println("<li class = ''>");
									}

									out.println("<a href ='"+menuItem[1]+"'>"+ menuItem[0]+ "</a>");

									out.println("</li>");
							}
						%>
		</ul>
	</div>
</div>





