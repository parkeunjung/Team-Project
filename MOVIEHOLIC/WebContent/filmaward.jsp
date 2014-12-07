<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";
	String dbPassword = "a12345";

	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String year = request.getParameter("year");
	String award = request.getParameter("award");
	String name = request.getParameter("name");
	String awardname="";
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select *from awards where title=\"busan\"");
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화제</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-1.8.2.min.js"></script>
</head>
<body>
	<div class="wrap">
	<jsp:include page="Share/Header.jsp"/>
<div class="content">
		<div class="outer">
		<table>
		<tr><th>
			<div class="award">
				<div class="award_logo">
					<img src="./images/busanawards.jpg">
				</div>
				<div class="award_content">
				<%while(rs.next()){
				%>
				<ul>
				<li><%=rs.getString("year") %></li>
				<li><%=rs.getString("award") %></li>
				<li><%=rs.getString("name") %></li>
				</ul>
				<% }%>
				</div>
			</div>
			</th><th>
			<%
			rs = stmt.executeQuery("select *from awards where title=\"bluedragon\"");

			%>
			<div class="award">
				<div class="award_logo">
					<img src="./images/bluedragonawards.jpg">
					
				</div>			
				<div class="award_content">
				<%while(rs.next()){
				%>
				<ul>
				<li><%=rs.getString("year") %></li>
				<li><%=rs.getString("award") %></li>
				<li><%=rs.getString("name") %></li>
				</ul>
				<% }%>
				</div>
			</div>
			<div class="award">
			</th><th>
			<%
			rs = stmt.executeQuery("select *from awards where title=\"daejong\"");

			%>	
				<div class="award_logo">
					<img src="./images/daejongfileaward.jpg">

				</div>
				<div class="award_content">
				<%while(rs.next()){
				%>
				<ul>
				<li><%=rs.getString("year") %></li>
				<li><%=rs.getString("award") %></li>
				<li><%=rs.getString("name") %></li>
				</ul>
				<% }%>
				</div>
			</th>			
			</tr>
				</table>
		
		</div>
		
		
		
		</div>
		<%
			} catch (SQLException e) {
				// SQL 에러의 경우 에러 메시지 출력
				out.print("<div class='alert'>" + e.getLocalizedMessage()
						+ "</div>");
			} finally {
				// 무슨 일이 있어도 리소스를 제대로 종료
				if (rs != null) try {rs.close();} catch (SQLException e) {}
				if (stmt != null) try {stmt.close();} catch (SQLException e) {}
				if (conn != null) try {conn.close();} catch (SQLException e) {}
			}
		%>
	</div>	
	<jsp:include page="Share/footer.jsp" />	
</body>
</html>