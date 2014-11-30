<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
   

<%

	String [][] navbarImages  = {{"images/boxoffice.png","./boxoffice.jsp"},{"images/review.png","./review.jsp"},{"images/director.png","./director.jsp"}};


	String currentMenu = request.getParameter("current");
	
	String username=null;
	String userid=null;
	boolean flag = false;
	if(session.getAttribute("userName")!=null){
		username=(String)session.getAttribute("userName");
		userid=(String)session.getAttribute("userId");
		flag=true;
		
	}
%>
	<!--  Navbar -->

	

	<div id="top">
	<div id="title">
	<a href = "index.jsp"><img src = "./images/logo.png"></a>
	</div>
	<div id="memberbar">			

	<%	if (flag) { %>

		<%	out.println("<p id='name'>"+username+"</p>"); %>
		<div class="memberbar_inner">
		<a href = './signout.jsp'>sign out</a>
		<a href = './mypage.jsp'>my page</a>
		</div>
	<% } else{ %>
		<div class="memberbar_inner">
		<br><br>
		<a href ='./signup.jsp'>sign up</a>
		<a href ='./signin.jsp'>sign in</a>
		</div>
	<% }%>
	</div>	

	</div>
			
		<div id="menubar">
					<ul>
						<%
							for(String menuItem[] : navbarImages) {
								if(currentMenu != null ) {
									out.println("<li class = 'active'>");
									}
									else{
										out.println("<li class = ''>");
									}

									out.println("<a href ='"+menuItem[1]+"'><img src=" +menuItem[0]+ "></a>");

									out.println("</li>");
							}
						%>
					</ul>
				</div>	
			
			
		
				
			
				
	