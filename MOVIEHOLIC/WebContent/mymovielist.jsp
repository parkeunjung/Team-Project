<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		%>
		
<%
	String errorMsg = null;

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	// DB 접속을 위한 준비
	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";;
	String dbPassword = "a12345";
	List<String> movielist = new ArrayList<String>();
	
	
	String userNumber =(String)session.getAttribute("userNumber");
	try {
		Class.forName("com.mysql.jdbc.Driver");

		//DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		//질의준비
		stmt = conn
				.prepareStatement("SELECT M_name FROM selectedmovie,movie where usernumber="+userNumber+
									"&& selectedmovie.movienumber=movie.movienumber");		
		//수행
		rs = stmt.executeQuery();

		while(rs.next()) {
			movielist.add(rs.getString("M_name"));			
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.8.2.min.js"></script>
<title>Mymovielist</title>
</head>
<body>
<div class="wrap">
 <jsp:include page="Share/Header.jsp"/>
	
	<div class="content">
		<div id="mymovie">
			<ul>
			<%for(String movie: movielist){%>
			<li><p><%=movie %></p></li>
			<%} %>
			</ul>
		</div>	
	</div>
</div>
<jsp:include page="Share/footer.jsp" />
	

</body>
</html>