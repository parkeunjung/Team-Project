<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
		

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
	String name = "";
	String birth = "";
	String debut = "";
	String award = "";
	String famous = "";
	String image = "";
	
	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {
	}

	if (id > 0) {
		actionUrl = "directorUpdate.jsp";
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// DB 접속
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);

			// 질의 준비
			stmt = conn
					.prepareStatement("SELECT * FROM directors WHERE id = ?");
			stmt.setInt(1, id);

			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				name = rs.getString("name");			
				birth = rs.getString("birth");
				debut = rs.getString("debut");
				award = rs.getString("award");
				famous = rs.getString("famous");
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
		actionUrl = "directorRegister.jsp";
	} 
%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화감독 쓰기</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="wrap">
	<div class="container">
	<%
 if (errorMsg != null && errorMsg.length() > 0 ) {
		// SQL 에러의 경우 에러 메시지 출력
		out.print("<div class='alert'>" + errorMsg + "</div>");
 }
 %>
 <div>
		  <form class="form-horizontal" action="<%=actionUrl%>" method="post">
			<fieldset>
        <legend class="legend">영화감독 작성</legend>
			  	<%
			  	if (id > 0) {
			  		out.println("<input type='hidden' name='id' value='"+id+"'>");
			  	}
			  	%>

				<div class="form-group ">
					<label class="col-sm-2 control-label" for="name">감독명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="홍길동" name="name" value="<%=name%>">
					</div>
				</div>

				<div class="form-group ">
					<label class="col-sm-2 control-label" for="birth">출생</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="꼭입력하시오." name="birth" value="<%=birth%>">
					</div>
				</div>

				<div class="form-group ">
					<label class="col-sm-2 control-label" for="debut">데뷔</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="꼭입력하시오." name="debut" value="<%=debut%>">
					</div>
				</div>
				
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="award">수상</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="꼭입력하시오." name="award" value="<%=award%>">
					</div>
				</div>
								
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="famous">대표작</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="꼭입력하시오." name="famous" value="<%=famous%>">
					</div>
				</div>
								
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="image">이미지</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="꼭입력하시오." name="image" value="<%=image%>">
					</div>
				</div>
				
				<div class="form-group">
					<a href="directorList.jsp" class="col-sm-offset-2 btn btn-default">목록으로</a>
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