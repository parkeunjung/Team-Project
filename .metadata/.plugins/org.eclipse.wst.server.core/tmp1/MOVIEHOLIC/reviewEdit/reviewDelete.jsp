<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>

<%
	// 현재 메뉴
	String errorMsg = null;
	int result = 0;

	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";;
	String dbPassword = "a12345";
	
	request.setCharacterEncoding("utf-8");

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("DELETE FROM reviews WHERE id=?");
		stmt.setInt(1,  id);
		
		result = stmt.executeUpdate();
		if (result != 1) {
			errorMsg = "삭제에 실패했습니다.";
		}
	} catch (SQLException e) {
		errorMsg = "SQL 에러: " + e.getMessage();
	} finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평론가평 삭제</title>
	<link href="../stylesheets/base.css" rel="stylesheet">
	<script src="../js/jquery-1.8.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="wrap">
<div class="container">
		<% if (errorMsg != null) { %>
		<div class="alert alert-danger">
			<h3>Errors:</h3>
			<%= errorMsg %>
		</div>
		<% } else { %>
		<div class="alert alert-success">평론을 삭제하였습니다.</div>
		<%}%>
		<div class="form-group">
			<a href="reviewWrite.jsp" class="btn btn-default">목록으로</a>
		</div>
	</div>
</div>
</body>
</html>