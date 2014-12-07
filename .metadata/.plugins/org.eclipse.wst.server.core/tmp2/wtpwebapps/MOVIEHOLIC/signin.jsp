
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.sql.*"%>
<%
	String errorMsg = null;

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	// DB 접속을 위한 준비
	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";;
	String dbPassword = "a12345";

	//사용자 정보를 위한 변수 초기화
	String userid = "";
	String name = "";
	String password = "";
	String usernumber="";
	
	
	//post
	String id = request.getParameter("id");	
	String pwd = request.getParameter("pwd");
	//관리자 아이디, 비밀번호
	String managerid = "kbc13";
	String managerpwd = "a12345";
	int a =10;
	boolean signin = false;
	String actionurl ="";
	try {
		Class.forName("com.mysql.jdbc.Driver");

		//DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		//질의준비
		stmt = conn
				.prepareStatement("SELECT * FROM members ");		
		//수행
		rs = stmt.executeQuery();

		while(rs.next()) {
			userid = rs.getString("userid");
			name = rs.getString("name");
			password = rs.getString("pwd");
			usernumber=rs.getString("usernumber");
			
			
			if (userid.equals(id) && password.equals(pwd)) {
				// 로그인 성공
				
				session.setAttribute("userId", userid);
				session.setAttribute("userName", name);
				session.setAttribute("userNumber", usernumber);
				session.setAttribute("userPwd",password);
				signin = true;
				actionurl="./index.jsp";
				
				break;
			}else if(managerid.equals(id)&& managerpwd.equals(pwd)){
				actionurl="./manager/index_manager.jsp";
				signin = true;
				session.setAttribute("userName", "관리자");


			}
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signin</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<div class="wrap">
	<jsp:include page="Share/Header.jsp"/>
			
			<%
				if (request.getMethod() == "POST") {
					if (id == null || pwd == null || id.length() == 0
							|| pwd.length() == 0) {
			%>
					<div class="error">아이디와 비밀번호를 입력하세요.</div>
			<%
					} else if (signin) {
						// 로그인 성공
						response.sendRedirect(actionurl);
						
					} else {
			%>
						<div class="error">아이디나 비밀번호가 잘못되었습니다.</div>
			<%
					}

				}
			%>
	<div class="content">	
		<div class="signin">
			<form method="post">
				<br> 
				ID: <input type="text" name="id">
				Password: <input type="password" name="pwd"> 
				<input type="submit" value="Sign in">
			
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="Share/footer.jsp" />
</html>

