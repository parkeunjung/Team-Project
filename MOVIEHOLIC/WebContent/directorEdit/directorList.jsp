<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";
	String dbPassword = "a12345";
	
	int pageNo = 1;
	
	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex){}
	
	int numInPage = 9 ;
	int startPos = (pageNo - 1)*numInPage;
	int numItems,numPages;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화감독 목록</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="wrap">
	<div class="container">
	<%
		try {
		Class.forName("com.mysql.jdbc.Driver");

		// DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		stmt = conn.createStatement();

		// users 테이블: user 수 페이지수 개산
		rs = stmt.executeQuery("SELECT COUNT(*) FROM directors");
		rs.next();
		numItems = rs.getInt(1);
		numPages = (int) Math.ceil((double) numItems
				/ (double) numInPage);
		rs.close();
		stmt.close();

		// users 테이블 SELECT
		stmt = conn.createStatement();
		rs = stmt
				.executeQuery("SELECT * FROM directors ORDER BY name LIMIT "
						+ startPos + ", " + numInPage);
	%>
	
	<div class="row">
			<div class="col-md-12 page-info">
				<div class="pull-left">
					Total <b><%=numItems%></b> users
				</div>
				<div class="pull-right">
					<b><%=pageNo%></b> page / total <b><%=numPages%></b> pages
				</div>
			</div>
		</div>
		
		<table class="table table-bordered table-stripped">
			<thead>
				<tr>
					<th>감독명</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<% while(rs.next()) { %>
				<tr>
					<td><%=rs.getString("name")%></td>
					<td><a href="./director.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a></td>
					<td><a href="directorWrite.jsp?id=<%=rs.getInt("id")%>"
						class="btn btn-xs">수정</a> <a href="#"
						class="btn btn-xs btn-danger" data-action="delete"
						data-id="<%=rs.getInt("id")%>">삭제</a></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	
	<nav class="pagination_centered">
			<ul class="pagination">
				<%
					// 페이지 네비게이션을 위한 준비
						int startPageNo, endPageNo;
						int delta = 5;
						startPageNo = (pageNo <= delta) ? 1 : pageNo - delta;
						endPageNo = startPageNo + (delta * 2) + 1;

						if (endPageNo > numPages) {
							endPageNo = numPages;
						}

						// 이전 페이지로
						if (pageNo <= 1) {
				%>
				<li class="disabled"><a href="#">&laquo;</a></li>
				<%
					} else {
				%>
				<li><a href="index.jsp?page=<%=pageNo - 1%>">&laquo;</a></li>
				<%
					}

						// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
						String className = "";
						for (int i = startPageNo; i <= endPageNo; i++) {
							className = (i == pageNo) ? "active" : "";
							out.println("<li class='" + className + "'>");
							out.println("<a href='directorList.jsp?page=" + i + "'>" + i
									+ "</a>");
							out.println("</li>");
						}

						// 다음 페이지로
						if (pageNo >= numPages) {
				%>
				<li class="disabled"><a href="#">&raquo;</a></li>
				<%
					} else {
				%>
				<li><a href="index.jsp?page=<%=pageNo + 1%>">&raquo;</a></li>
				<%
					}
				%>
			</ul>
		</nav>
		
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
		<div class="form-group">
			<a href="directorWrite.jsp" class="btn btn-primary">글쓰기</a>
		</div>
	
	</div>
</div>
</body>
</html>