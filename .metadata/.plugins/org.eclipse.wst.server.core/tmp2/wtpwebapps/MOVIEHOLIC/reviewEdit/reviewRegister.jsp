<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
%>
		
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";;
	String dbPassword = "a12345";
	String M_name="";
	String C_name="";
	String content="";
	String imagename ="";
	String m_fileFullPath="";
	
	
	String path = application.getRealPath("/upload");
	try{
	MultipartRequest mr = new MultipartRequest(
			request, path, 1024*1024*5, "utf-8", 
			new DefaultFileRenamePolicy());
	
	M_name = mr.getParameter("M_name");
	C_name = mr.getParameter("C_name");
	content = mr.getParameter("content");		
	imagename = mr.getFilesystemName("image"); 
	m_fileFullPath = path + "/" + imagename;
    }catch(IOException e){
       out.print("<h2>IOException이 발생했습니다 <h2>");
    }
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	if (M_name == null || M_name.trim().length() == 0) {
		errorMsgs.add("영화 이름을 반드시 입력해주세요.");
	}
	if (C_name == null || C_name.trim().length() == 0) {
		errorMsgs.add("평론가명을 반드시 입력해주세요.");
	}
	if (content == null || content.trim().length() == 0) {
		errorMsgs.add("내용을 반드시 입력해주세요.");
	}
	if (imagename == null || imagename.trim().length() == 0) {
		errorMsgs.add("이미지를 반드시 첨부해주세요.");
	}
	
	if (errorMsgs.size() == 0) {
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO reviews(M_name,C_name,content,image,imagename) " +
					"VALUES(?, ?, ?, ?,?)"
					);
			stmt.setString(1, M_name);
			stmt.setString(2, C_name);
			stmt.setString(3, content);
			stmt.setString(4, m_fileFullPath);
			stmt.setString(5, imagename);

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
<title>평론가평 등록</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<script src="../js/jquery-1.8.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</head>
<body>

<div class="wrap">
	<div class="container">
		<% if (errorMsgs.size() > 0) { %>
 			<div class="alert alert-danger">
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
	 		<div class="alert alert-success">
	 			<b><%= M_name %></b>의 평론이 등록되었습니다.
	 		</div>
		 	<div class="form-group">
		 		<a href="reviewList.jsp" class="btn">목록으로</a>
		 	</div>
	 		
	 	<%}%>
	
	</div>
</div>

</body>
</html>