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
	
	int numInPage = 3 ;
	int startPos = (pageNo - 1)*numInPage;
	int numItems,numPages;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>director</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-1.8.2.min.js"></script>
</head>

<body>
	<div class="wrap">
		<jsp:include page="Share/Header.jsp" />
			<div class="content">
	<%
		try {
		Class.forName("com.mysql.jdbc.Driver");

		// DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		stmt = conn.createStatement();

		// reviews 테이블: review 수 페이지수 개산
		rs = stmt.executeQuery("SELECT COUNT(*) FROM directors");
		rs.next();
		numItems = rs.getInt(1);
		numPages = (int) Math.ceil((double) numItems
				/ (double) numInPage);
		rs.close();
		stmt.close();

		// reviews 테이블 SELECT
		stmt = conn.createStatement();
		rs = stmt
				.executeQuery("SELECT * FROM directors ORDER BY id LIMIT "
						+ startPos + ", " + numInPage);
	%>
		
			
		<div id="directortable">
		<table class="table table-bordered table-stripped">
			<tbody>
				<tr>

				<% while(rs.next()) { 
					String name= rs.getString("name");
					String birth= rs.getString("birth");
					String debut= rs.getString("debut");
					String award= rs.getString("award");
					String famous= rs.getString("famous");
					String imagename=rs.getString("imagename");

				%>
						<tr><td>
						<div class="director_image">
						<img src="upload/<%=imagename%>" id="directorimage">
						</div>
						<div class="director_content">
						<ul>
						<li><b>이름:</b> <%=name %></li>
						<li><b>출생:</b> <%=birth %></li>
						<li><b>데뷔작:</b> <%=debut %></li>
						<li><b>수상작:</b> <%=award %></li>
						<li><b>대표작:</b> <%=famous %></li>						
						</ul>
						</div>
						</td>
						</tr>
				<%}	%>
			</tbody>
		</table>
		</div>

	
	<nav class="pagination_centered">
			<table class="pagination">
					<tr>

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
				<td class="disabled"><a href="#">&laquo;</a></td>
				<%
					} else {
				%>
				<td><a href="director.jsp?page=<%=pageNo - 1%>">&laquo;</a></td>
				<%
					}

						// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
						String className = "";
						for (int i = startPageNo; i <= endPageNo; i++) {
							className = (i == pageNo) ? "active" : "";
							out.println("<td class='" + className + "'>");
							out.println("<a href='director.jsp?page=" + i + "'>" + i
									+ "</a>");
							out.println("</td>");
						}

						// 다음 페이지로
						if (pageNo >= numPages) {
				%>
				<td class="disabled"><a href="#">&raquo;</a></td>
				<%
					} else {
				%>
				<td><a href="director.jsp?page=<%=pageNo + 1%>">&raquo;</a></td>
				<%
					}
				%>
			</tr>
			</table>
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
	</div>
</div>
<jsp:include page="Share/footer.jsp"/>
</body>

</html>

