<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.sql.*" import="java.util.*"%>
<%
	String errorMsg = null;

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	// DB 접속을 위한 준비
	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";;
	String dbPassword = "a12345";

	//사용자 정보를 위한 변수 초기화
	
	List<String> usernumber = new ArrayList<String>();
	List<String> userid = new ArrayList<String>();
	List<String> username = new ArrayList<String>();

	
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberlist</title>
<link href="../stylesheets/manage.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<% 
try {
		Class.forName("com.mysql.jdbc.Driver");

		//DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		//질의준비
		stmt = conn
				.prepareStatement("SELECT * FROM members ");		
		//수행
		rs = stmt.executeQuery();

		while(rs.next()) {
			userid.add(rs.getString("userid"));
			username.add(rs.getString("name"));
			usernumber.add(rs.getString("usernumber"));
		}
	} catch (SQLException e) {
		errorMsg = "SQL 에러 : " + e.getMessage();
	} finally {
		//리소스를 종료
		if (rs != null)try {rs.close();} catch (SQLException e) {}
		if (stmt != null)try {stmt.close();} catch (SQLException e) {}
		if (conn != null)try {conn.close();} catch (SQLException e) {}
	}
%>
	<div id="memberlist">
			<ul>
			<% for(String number:usernumber){%>
					<li><%=number %></li>
			<%}%>
			</ul>
			<ul>
			<% for(String id:userid){%>
				<li><%=id %></li>
			<%}%>
			</ul>
			<ul>
			<% for(String id:userid){%>
				<li><%=id %></li>
			<%}%>
			</ul>
	
	
		
	</div>
</body>

</html>

