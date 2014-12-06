<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
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
		actionUrl = "reviewUpdate.jsp";
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
		actionUrl = "reviewRegister.jsp";
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewWrite</title>
	<link href="../stylesheets/manage.css" rel="stylesheet">
	
	<script src="../js/jquery-1.8.2.min.js"></script>
</head>

<body>

	<div class="wrap">
			<div class="content">
				<form  method="post" enctype="mulipart/form-data">
						<legend class="legend">평론가평 추가</legend><br>
						<%
							if (errorMsg != null && errorMsg.length() > 0) {
								// SQL 에러의 경우 에러 메시지 출력
								out.print("<div class='alert'>" + errorMsg + "</div>");
							}
						%>
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="M_name">영화이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="영화이름을 입력해주세요" name="M_name" value="<%=M_name%>">
					</div>
				</div>

				<div class="form-group ">
					<label class="col-sm-2 control-label" for="C_name">평론가명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="평론가명을 입력해주세요" name="C_name" value="<%=C_name%>">
					</div>
				</div>
				
				<div class="content_review ">
					<label class="col-sm-2 control-label" for="content">내  용</label>
					<div class="col-sm-3">
						<textarea name="content" cols="30" rows="15"><%=content%></textarea>
					</div>
				</div>
				</form>
				<div class="form-group ">
				<form  action="imageupload.jsp" method = "post" enctype="multipart/form-data">
					포스터 불러오기 <br/>
					<input type="file" name="s_file"/><input type="submit" value="확인"/>
				</form>				
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-default btn-primary" value="등록">
					<a href="reviewList.jsp" class="col-sm-offset-2 btn btn-default">목록으로</a>

				</div>
				
			
		</div>
	</div>
		



</body>
</html>
