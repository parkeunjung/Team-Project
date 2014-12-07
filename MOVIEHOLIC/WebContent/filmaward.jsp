<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";
	String dbPassword = "a12345";

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
	
	<%
		String errorMsg = null;

		try {

		Class.forName("com.mysql.jdbc.Driver");

		// DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		stmt = conn.createStatement();

		// reviews 테이블 SELECT
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * from awards group by M_name limit "
						+ startPos + ", " + numInPage);
		
	
		%>
		<div class="content">
		<div id="reviewtable">
		<table class= "review">
			<tbody>
				<tr>
				<% while(rs.next()) { 
				year=rs.getString("M_name");
				%>
				<td><a href="reviewShow.jsp?M_name=<%=m_name%>"><img src="upload/<%=rs.getString("imagename")%>" id="movieposter"></a></td>
				<% }%>
				
				</tr>
			</tbody>
		</table>
		</div>
		
		</div>
		</div>
		
</body>
</html>