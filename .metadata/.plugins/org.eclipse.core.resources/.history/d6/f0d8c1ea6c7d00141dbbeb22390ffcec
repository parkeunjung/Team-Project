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
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String debut = request.getParameter("debut");
	String award = request.getParameter("award");
	String famous = request.getParameter("famous");
	String image = request.getParameter("image");
	
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	if (name == null || name.trim().length() == 0) {
		errorMsgs.add("이름을 반드시 입력해주세요.");
	}
	if (birth == null || birth.trim().length() == 0) {
		errorMsgs.add("출생을 반드시 입력해주세요.");
	}
	if (debut == null || debut.trim().length() == 0) {
		errorMsgs.add("데뷔를 반드시 입력해주세요.");
	}
	if (award == null || award.trim().length() == 0) {
		errorMsgs.add("수상을 반드시 입력해주세요.");
	}
	if (famous == null || famous.trim().length() == 0) {
		errorMsgs.add("데뷔작을 반드시 입력해주세요.");
	}
	if (image == null || image.trim().length() == 0) {
		errorMsgs.add("이미지를 반드시 입력해주세요.");
	}
	
	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO directors(name,birth,debut,award,famous,image) " +
					"VALUES(?, ?, ?, ?, ?, ?)"
					);
			stmt.setString(1, name);
			stmt.setString(2, birth);
			stmt.setString(3, debut);
			stmt.setString(4, award);
			stmt.setString(5, famous);
			stmt.setString(6, image);
			
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
<title>영화감독 등록</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<script src="../js/jquery-1.8.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="wrap">
<jsp:include page="../Share/Header.jsp"/>
	<div class="container">
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
	 			<b><%= name %></b>님 등록해주셔서 감사합니다.
	 		</div>
		 	<div class="form-group">
		 		<a href="directorList.jsp" class="btn">목록으로</a>
		 	</div>
	 		
	 	<%}%>
	</div>
</div>
<jsp:include page="../Share/footer.jsp"/>
</body>
</html>