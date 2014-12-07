<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"
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
	String title = "";
	String year = "";
	String award="";
	String name="";

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {
	}

	if (id > 0) {
		actionUrl = "awardUpdate.jsp";
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// DB 접속
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);

			// 질의 준비
			stmt = conn
					.prepareStatement("SELECT * FROM awards WHERE id = ?");
			stmt.setInt(1, id);

			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				title = rs.getString("title");
				year = rs.getString("year");
				award = rs.getString("award");
				name = rs.getString("name");
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
		actionUrl = "awardRegister.jsp";
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수상작쓰기</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<script src="../js/jquery-1.8.2.min.js"></script>
</head>
<body>
<div class="wrap">
<jsp:include page="../Share/manage_Header.jsp"/>
	<div class="content">
	
 <div>
<<<<<<< HEAD
		  <form accept-charset="UTF-8" class="form-horizontal" action="awardRegister.jsp" method="post" >
=======
		  <form accept-charset="UTF-8" class="form-horizontal" action="awardRegister.jsp" method="post" enctype="multipart/form-data">
>>>>>>> 9573db6a4fb372138c74696b8909e75eda763cee
				<legend class="legend">영화제 수상작 작성</legend>
				<fieldset>
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="title">영화제명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"  name="title" value="<%=title%>">
					</div>
				</div>

				<div class="form-group ">
					<label class="col-sm-2 control-label" for="year">수상년도</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="year" value="<%=year%>">
					</div>
				</div>

				<div class="form-group ">
					<label class="col-sm-2 control-label" for="award">상이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="award" value="<%=award%>">
					</div>
				</div>
				
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="name">수상작</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="name" value="<%=name%>">
					</div>
				</div>
			
				<div class="form-group">
					<a href="awardList.jsp" class="col-sm-offset-2 btn btn-default">목록으로</a>
					<% if (id <= 0) { %>
						<input type="submit" class="btn btn-default btn-primary" value="등록">
					<% } else { %>
						<input type="submit" class="btn btn-default btn-primary" value="수정">
					<% } %>
				</div>
				</fieldset>
		  </form>
    </div>

	</div>
</div>
</body>
</html>