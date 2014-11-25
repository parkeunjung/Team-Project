<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>

<%
	String [][] navbarImages  = {{"BOXOFFICE","./boxoffice.jsp"},{"REVIEW","./review.jsp"}};
	String currentMenu = request.getParameter("current");
%>
	<!--  Navbar -->
	<div class="container navbar " role="navigation">
		<div class = "title">
			<a href = "index.jsp">MOVIEHOLIC</a>

	<div class="memberbar">
		<a href ='./signup.jsp'>sign up</a>
		<a href ='./signin.jsp'>sign in</a>
	</div>		
	
		
		<div class = "menubar">
					<ul>
						<%
							for(String menuItem[] : navbarImages) {
								if(currentMenu != null ) {
									out.println("<li class = 'active'>");
									}
									else{
										out.println("<li class = ''>");
									}
									out.println("<a href ='"+menuItem[1]+"'>" +menuItem[0]+ "</a>");
									out.println("</li>");
							}
						%>
					</ul>
				</div>		
			</div>
				
		</div>
			
				
	