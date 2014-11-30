<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
   

<%
<<<<<<< HEAD

	String [][] navbarImages  = {{"./images/boxoffice.png","./boxoffice.jsp"},{"./images/review.png","./review.jsp"}};
=======
	String [][] navbarImages  = {{"images/boxoffice.png","./boxoffice.jsp"},{"images/review.png","./review.jsp"}};
>>>>>>> 3948346b52bebabf26a244da743ec9551dd4252d

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
<<<<<<< HEAD
	<div class="container navbar " role="navigation">
		<div class = "title">
			<a href = "index.jsp"><img src = "./images/logo.png"></a>

			</div>
			
=======

	<div id="top">
	<div id="title">
	<a href = "index.jsp"><img src = "./images/logo.png"></a>
	</div>
	<div id="memberbar">			
>>>>>>> 3948346b52bebabf26a244da743ec9551dd4252d
	<%	if (flag) { %>

		<%	out.println(username+"님"); %>
		<a href = './signout.jsp'>sign out</a>
		<br>
		<a href = './mypage.jsp'>my page</a>
	
	<% } else{ %>
	
		<a href ='./signup.jsp'>sign up</a>
		<a href ='./signin.jsp'>sign in</a>
			
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
<<<<<<< HEAD

=======
>>>>>>> 3948346b52bebabf26a244da743ec9551dd4252d
									out.println("</li>");
							}
						%>
					</ul>
				</div>	
			
			
		
				
			
				
	