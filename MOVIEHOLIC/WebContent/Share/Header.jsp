<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
   

<%
<<<<<<< HEAD
	String [][] navbarImages  = {{"boxoffice.png","./boxoffice.jsp"},{"review.png","./review.jsp"}};
=======
	String [][] navbarImages  = {{"./images/boxoffice.png","./boxoffice.jsp"},{"./images/review.png","./review.jsp"}};
>>>>>>> 63fc5466a0e20eb19c24af87deb622c48afbdbb7
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
	<div class="container navbar " role="navigation">
		<div class = "title">
<<<<<<< HEAD
			<a href = "index.jsp"><img src="../images/logo.png"></a>
=======
			<a href = "index.jsp"><img src = "./images/logo.png"></a>
>>>>>>> 63fc5466a0e20eb19c24af87deb622c48afbdbb7
			</div>
			
	<%	if (flag) { %>
	<div class="memberbar">
		<%	out.println(username+"님"); %>
		<a href = './signout.jsp'>sign out</a>
		<br>
		<a href = './mypage.jsp'>my page</a>
	</div>
	<% } else{ %>
	<div class="memberbar">
		<a href ='./signup.jsp'>sign up</a>
		<a href ='./signin.jsp'>sign in</a>
	</div>		
	<% }%>
	
		
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
<<<<<<< HEAD
									out.println("<a href ='"+menuItem[1]+"'>" +"<img src='../images/'"+menuItem[0]+">"+ "</a>");
=======
									out.println("<a href ='"+menuItem[1]+"'><img src=" +menuItem[0]+ "></a>");
>>>>>>> 63fc5466a0e20eb19c24af87deb622c48afbdbb7
									out.println("</li>");
							}
						%>
					</ul>
				</div>		
			</div>
		
				
		</div>	 
			
				
	