<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("id");	
String pwd = request.getParameter("pwd");
String managerid = "kbc13";
String managerpwd = "a12345";
boolean signin = false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>manager login</title>
</head>
<body>
			<%	
				if (request.getMethod() == "POST") {
					if((managerid.equals(id))&&(managerpwd.equals(pwd))){
						signin=true;
					}
					if (id == null || pwd == null || id.length() == 0
							|| pwd.length() == 0) {
			%>
					<div class="error">아이디와 비밀번호를 입력하세요.</div>
			<%
					} else if (signin) {
						// 로그인 성공
						response.sendRedirect("index_manager.jsp");
						
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

	

</body>
</html>