<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
%>

<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";
	String dbPassword = "a12345";
	
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String year = request.getParameter("year");
	String award1 = request.getParameter("award1");
	String name1 = request.getParameter("name1");
	String award2 = request.getParameter("award2");
	String name2 = request.getParameter("name2");
	String award3 = request.getParameter("award3");
	String name3 = request.getParameter("name3");
	String award4 = request.getParameter("award4");
	String name4 = request.getParameter("name4");
	String award5 = request.getParameter("award5");
	String name5 = request.getParameter("name5");
	
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	if (title == null || title.trim().length() == 0) {
		errorMsgs.add("영화제명을 반드시 입력해주세요.");
	}
	if (year == null || year.trim().length() == 0) {
		errorMsgs.add("년도를 반드시 입력해주세요.");
	}
	if (award1 == null || award1.trim().length() == 0) {
		errorMsgs.add("상이름을 반드시 입력해주세요.");
	}
	if (name1 == null || name1.trim().length() == 0) {
		errorMsgs.add("수상작을 반드시 입력해주세요.");
	}
	
	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO awards(title,year,award1,name1,award2,name2,award3,name3,award4,name4,award5,name5) " +
					"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
					);
			stmt.setString(1,  title);
			stmt.setString(2,  year);
			stmt.setString(3,  award1);
			stmt.setString(4,  name1);
			stmt.setString(5,  award2);
			stmt.setString(6,  name2);
			stmt.setString(7,  award3);
			stmt.setString(8,  name3);
			stmt.setString(9,  award4);
			stmt.setString(10,  name4);
			stmt.setString(11,  award5);
			stmt.setString(12,  name5);
			
			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("등록에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화제 등록</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<script src="../js/jquery-1.8.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</head>
<body>

</body>
</html>