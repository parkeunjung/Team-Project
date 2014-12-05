<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		%>
    <%
    		String userNumber =(String)session.getAttribute("userNumber");
    
    	request.setCharacterEncoding("utf-8");
   	    String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String pwd_confirm =request.getParameter("pwd_confirm");
		String email = request.getParameter("email");
		
		
		// DB 접속을 위한 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
		String dbUser = "kbc13";
		String dbPassword = "a12345";

		List<String> errorMsgs = new ArrayList<String>();
		int result = 0;
		
		
		
		if (pwd == null || pwd.length() < 6) {
			errorMsgs.add("비밀번호는 6자 이상 입력해주세요.");
		} 
		
		if (!pwd.equals(pwd_confirm)) {
			errorMsgs.add("비밀번호가 일치하지 않습니다.");
		}
		
		if (name == null || name.trim().length() == 0) {
			errorMsgs.add("이름을 반드시 입력해주세요.");
		}
		if (email == null || email.trim().length() == 0) {
			errorMsgs.add("이메일을 반드시 입력해주세요.");
		}
		
		
		if (errorMsgs.size() == 0) {
			try {
				
	    	Class.forName("com.mysql.jdbc.Driver");
	
	    // DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	
			// 질의 준비
		stmt = conn.prepareStatement("SELECT * FROM members WHERE usernumber = ?");
		stmt.setString(1, userNumber);
		
		// 수행
			rs = stmt.executeQuery();
		
		if (rs.next()) {
			
			stmt = conn.prepareStatement(
					"UPDATE members " +
					"SET   name=?, pwd=? ,email=? " +
					"WHERE usernumber=?"
					);
			stmt.setString(1,  name);
			stmt.setString(2,  pwd);
			stmt.setString(3,  email);
			stmt.setString(4,  userNumber);

			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("변경에 실패하였습니다.");
			}else{
			
				session.setAttribute("userName", name);
				session.setAttribute("userPwd",pwd);
				session.setAttribute("userEmail",email);

			}
		}
		
	}catch (SQLException e) {
		errorMsgs.add( "SQL 에러: " + e.getMessage());
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
<title>update</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.8.2.min.js"></script>
</head>
<body>
	<jsp:forward page="mypage.jsp"/>

</body>
</html>
