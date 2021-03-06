<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
		%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>

		
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";
	String dbPassword = "a12345";
	
	request.setCharacterEncoding("utf-8");
	String name = "";
	String birth = "";
	String debut = "";
	String award = "";
	String famous = "";
	String imagename ="";
	String imagepath="";
	
	
	String path = application.getRealPath("/upload");
	try{
	MultipartRequest mr = new MultipartRequest(
			request, path, 1024*1024*5, "utf-8", 
			new DefaultFileRenamePolicy());
	
	name = mr.getParameter("name");
	birth = mr.getParameter("birth");
	award = mr.getParameter("award");
	famous = mr.getParameter("famous");		
	debut = mr.getParameter("debut");		
	imagename = mr.getFilesystemName("image"); 
	imagepath = path + "/" + imagename;
    }catch(IOException e){
       out.print("<h2>IOException이 발생했습니다 <h2>");
    }
	
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
	if (imagename == null || imagename.trim().length() == 0) {
		errorMsgs.add("이미지를 반드시 입력해주세요.");
	}
	
	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO directors(name,birth,debut,award,famous,imagename,imagepath) " +
					"VALUES(?, ?, ?, ?, ?, ?,?)"
					);
			stmt.setString(1, name);
			stmt.setString(2, birth);
			stmt.setString(3, debut);
			stmt.setString(4, award);
			stmt.setString(5, famous);
			stmt.setString(6, imagename);
			stmt.setString(7, imagepath);
			
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
	<div class="content">
	<% if (errorMsgs.size() > 0) { %>
 			<div >
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
	 		<div >
	 			<b><%= name %></b>감독 정보 등록완료.
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