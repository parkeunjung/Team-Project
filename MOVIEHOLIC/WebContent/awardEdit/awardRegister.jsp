<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"
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
	String award = request.getParameter("award");
	String name = request.getParameter("name");
	
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	if (title == null || title.trim().length() == 0) {
		errorMsgs.add("영화제명을 반드시 입력해주세요.");
	}
	if (year == null || year.trim().length() == 0) {
		errorMsgs.add("년도를 반드시 입력해주세요.");
	}
	if (award == null || award.trim().length() == 0) {
		errorMsgs.add("상이름을 반드시 입력해주세요.");
	}
	if (name == null || name.trim().length() == 0) {
		errorMsgs.add("수상작을 반드시 입력해주세요.");
	}
	
	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO awards(title,year,award,name) " +
					"VALUES(?, ?, ?, ?)"
					);
			stmt.setString(1,  title);
			stmt.setString(2,  year);
			stmt.setString(3,  award);
			stmt.setString(4,  name);
			
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
</head>
<body>
<div class="wrap">
<jsp:include page="../Share/manage_Header.jsp"/>
	<div class="content">
	<% if (errorMsgs.size() > 0) { %>
 			<div class="alert alert-danger">
 				<h3>Errors:</h3>
 				<ul>
 					<% for(String msg: errorMsgs) { %>
 						<li><%=msg %></li>
 					<% } %>
 				</ul>
 			</div>
		 	<div class="form-group">
		 		<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
		 	</div>
	 	<% } else if (result == 1) { %>
	 		<div class="alert alert-success">
	 			<b><%= title %></b>영화제 정보 등록완료.
	 		</div>
		 	<div class="form-group">
		 		<a href="awardList.jsp" class="btn">목록으로</a>
		 	</div>
	 		
	 	<%}%>
	</div>
</div>
</body>
</html>