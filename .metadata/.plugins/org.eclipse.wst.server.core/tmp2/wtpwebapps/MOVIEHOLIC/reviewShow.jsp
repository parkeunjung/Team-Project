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
	String imagename="";
	int pageNo = 1;
	
	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex){}
	
	int numInPage = 9 ;
	int startPos = (pageNo - 1)*numInPage;
	int numItems,numPages;

	String m_name = "";

	try {
		m_name = (request.getParameter("M_name"));
	} catch (Exception e) {
	}

	

	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평론가평보기</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="wrap">
<jsp:include page="Share/Header.jsp"/>
	<div class="content">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");

				// DB 접속
				conn = DriverManager.getConnection(dbUrl, dbUser,
						dbPassword);

				// 질의 준비
				stmt = conn
						.prepareStatement("SELECT * FROM reviews WHERE M_name = ?");
				stmt.setString(1,m_name);
		
				// 수행
				rs = stmt.executeQuery();

				while(rs.next()) {
					M_name = rs.getString("M_name");			
					C_name = rs.getString("C_name");
					content = rs.getString("content");
					%>
					<div class ="review">
						평론가 :<%=C_name %>
						<br>
						평론가 평: <%=content %>
					</div>
					<% 
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
		<div class="form-group">
			<a href="review.jsp" class="btn btn-default">목록으로</a>
		</div>
	</div>
</div>
<jsp:include page="Share/footer.jsp"/>
</body>
</html>