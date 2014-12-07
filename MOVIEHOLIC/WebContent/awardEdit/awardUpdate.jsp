<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
	
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";
	String dbPassword = "a12345";

	request.setCharacterEncoding("utf-8");

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {
	}
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
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);
			stmt = conn
					.prepareStatement("UPDATE awards "
							+ "SET  title=?, year=?, award1=?, name1=?, award2=?, name2=?, award3=?, name3=?, award4=?, name4=?, award5=?, name5=?"
							+ "WHERE id=?");
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
			stmt.setInt(13, id);
			
			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("등록에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수상작 수정</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<script src="../js/jquery-1.8.2.min.js"></script>
</head>
<body>
<div class="wrap">
<jsp:include page="../Share/manage_Header.jsp"/>
	<div class="container">
		<%
			if (errorMsgs.size() > 0) {
		%>
		<div class="alert alert-danger">
			<h3>Errors:</h3>
			<ul>
				<%
					for (String msg : errorMsgs) {
				%>
				<li><%=msg%></li>
				<%
					}
				%>
			</ul>
		</div>
		
				<div class="form-group">
			<a onclick="history.back();" class="btn btn-default">뒤로 돌아가기</a>
		</div>
		<%
			} else if (result == 1) {
		%>
		<div class="alert alert-success">
			<b><%=title%></b>의 내용이 수정되었습니다.
		</div>
		<div class="form-group">
			<a href="awardList.jsp" class="btn btn-default">목록으로</a>
		</div>
		<%
			}
		%>
	
	</div>
</div>
</body>
</html>