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
	String title = "";
	String year = "";
	String award1="";
	String name1="";
	String award2="";
	String name2="";
	String award3="";
	String name3="";
	String award4="";
	String name4="";
	String award5="";
	String name5="";

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
				award1 = rs.getString("award1");
				name1 = rs.getString("name1");
				award2 = rs.getString("award2");
				name2 = rs.getString("name2");
				award3 = rs.getString("award3");
				name3 = rs.getString("name3");
				award4 = rs.getString("award4");
				name4 = rs.getString("name4");
				award5 = rs.getString("award5");
				name5 = rs.getString("name5");
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
		  <form accept-charset="UTF-8" class="form-horizontal" action="awardRegister.jsp" method="post" enctype="multipart/form-data">
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
					<label class="col-sm-2 control-label" for="award1">상이름1/수상작1</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="award1" value="<%=award1%>">
						<input type="text" class="form-control" name="name1" value="<%=name1%>">
					</div>
				</div>
				
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="award2">상이름2/수상작2</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="award2" value="<%=award2%>">
						<input type="text" class="form-control" name="name2" value="<%=name2%>">
					</div>
				</div>
				
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="award3">상이름3/수상작3</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="award3" value="<%=award3%>">
						<input type="text" class="form-control" name="name3" value="<%=name3%>">
					</div>
				</div>
				
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="award4">상이름4/수상작4</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="award4" value="<%=award4%>">
						<input type="text" class="form-control" name="name4" value="<%=name4%>">
					</div>
				</div>
				
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="award5">상이름5/수상작5</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="award5" value="<%=award5%>">
						<input type="text" class="form-control" name="name5" value="<%=name5%>">
					</div>
				</div>
			
				<div class="form-group">
					<a href="awardList.jsp" class="col-sm-offset-2 btn btn-default">목록으로</a>
						<input type="submit" class="btn btn-default btn-primary" value="등록">
				</div>
		  </form>
    </div>

	</div>
</div>
</body>
</html>