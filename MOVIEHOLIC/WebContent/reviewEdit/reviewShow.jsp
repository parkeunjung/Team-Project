<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
		%>
		
<%
	String errorMsg = null;

	String actionUrl;
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";
	String dbPassword = "a12345";
	

	// 사용자 정보를 위한 변수 초기화
	String M_name = "";
	String C_name = "";
	String content = "";
	String image="";
	
	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {
	}

	if (id > 0) {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// DB 접속
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);

			// 질의 준비
			stmt = conn
					.prepareStatement("SELECT * FROM reviews WHERE id = ?");
			stmt.setInt(1, id);

			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				M_name = rs.getString("M_name");			
				C_name = rs.getString("C_name");
				content = rs.getString("content");
				image = rs.getString("image");
			}
		} catch (SQLException e) {
			errorMsg = "SQL 에러: " + e.getMessage();
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
		  if (rs != null) try{rs.close();} catch(SQLException e) {}
		  if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		  if (conn != null) try{conn.close();} catch(SQLException e) {}
		    }
	} else {
		errorMsg = "ID가 지정되지 않았습니다.";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평론가평보기</title>
	<link href="../stylesheets/bootstrap.min.css" rel="stylesheet">
	<link href="../stylesheets/main.css" rel="stylesheet">
	<script src="../js/jquery-1.8.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

</head>
<body>
<div class="wrap">
<jsp:include page="../Share/Header.jsp"/>
	<div class="container">
		<%
 			if (errorMsg != null && errorMsg.length() > 0 ) {
    		// SQL 에러의 경우 에러 메시지 출력
    		out.print("<div class='alert'>" + errorMsg + "</div>");
 			} else {
 		%>
			<div>
			<h3><%=M_name%></h3>
			<ul>
				<li><%=C_name %></li>
				<li>내      용 : <%=content %></li>
			</ul>
		</div>
		<% } %>
		<div class="form-group">
			<a href="../review.jsp" class="btn btn-default">목록으로</a>
		</div>
	</div>
</div>
<jsp:include page="../Share/footer.jsp"/>
</body>
</html>