<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>

<%
	String errorMsg = null;

	String actionUrl;
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";;
	String dbPassword = "a12345";
	//페이지
	int pageNo = 1;
	
	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex){}
	
	int numInPage = 10 ;
	int startPos = (pageNo - 1)*numInPage;
	int numItems,numPages;
	
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

<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.8.2.min.js"></script>
</head>

<body>

<div class="wrap">
	<div class="container">
		<style type="text/css">
#tab {
	border-collapse: collapse;
	border-spacing: 0;
}

td, th {
	border: 1px solid #444;
	font: 12px/18px "맑은 고딕", "Malgun Gothic";
	padding: 5px;
}

thead tr, tfoot tr {
	background: #888;
	color: #fff;
}

tbody tr {
	background: #EEE;
}

span.price {
	display: box;
	text-align: right;
	width: 200px;
	font-weight: bold;
}
</style>
	 <%
	 if (errorMsg != null && errorMsg.length() > 0 ) {
		// SQL 에러의 경우 에러 메시지 출력
		out.print("<div class='alert'>" + errorMsg + "</div>");
		}
	 %>
		<div>
		<form class="form-horizontal" action="<%=actionUrl%>" method="post">
			<fieldset>
        <legend class="legend">평론가평 추가</legend>
			<table id="tab" border="1">
				<thead>
					<tr>
						<th>영화이름</th>
						<th>평론가명</th>
						<th>내용</th>
						<th>이미지</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
				</tbody>

				<tfoot>
				</tfoot>

			</table>
			<input type="button" value="평론추가" id="add">
			</fieldset>
		  </form>
		</div>

		<div id="row" style="display: none">
			<table>
				<tr>
					<td><input type="text" size='10' name="M_name"
						value="<%=M_name%>"></td>
					<td><input type="text" size='15' name="C_name"
						value="<%=C_name%>"></td>
					<td><input type="text" size='10' name="content"
						value="<%=content%>"></td>
					<td><input type="text" size='10' name="image"
						value="<%=image%>"></td>
					<td>
					<% if (id <= 0) { %>
						<input type="submit" class="btn btn-default btn-primary" value="등록">
					<% } else { %>
						<input type="submit" class="btn btn-default btn-primary" value="수정">
					<% } %>		
						<input type="submit" class="btn btn-xs btn-danger" data-action="delete"
						data-id="<%=rs.getInt("id")%>">
					</td>
			</table>
		</div>
			<nav class="pagination_centered">
			<ul class="pagination">
				<%
					// 페이지 네비게이션을 위한 준비
						int startPageNo, endPageNo;
						int delta = 5;
						startPageNo = (pageNo <= delta) ? 1 : pageNo - delta;
						endPageNo = startPageNo + (delta * 2) + 1;

						if (endPageNo > numPages) {
							endPageNo = numPages;
						}

						// 이전 페이지로
						if (pageNo <= 1) {
				%>
				<li class="disabled"><a href="#">&laquo;</a></li>
				<%
					} else {
				%>
				<li><a href="reviewWrite.jsp?page=<%=pageNo - 1%>">&laquo;</a></li>
				<%
					}

						// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
						String className = "";
						for (int i = startPageNo; i <= endPageNo; i++) {
							className = (i == pageNo) ? "active" : "";
							out.println("<li class='" + className + "'>");
							out.println("<a href='index.jsp?page=" + i + "'>" + i
									+ "</a>");
							out.println("</li>");
						}

						// 다음 페이지로
						if (pageNo >= numPages) {
				%>
				<li class="disabled"><a href="#">&raquo;</a></li>
				<%
					} else {
				%>
				<li><a href="reviewWrite.jsp?page=<%=pageNo + 1%>">&raquo;</a></li>
				<%
					}
				%>
			</ul>
		</nav>
	</div>
</div>
</body>
</html>

<script type="text/javascript">
	$(function() {
		$('#add').click(
				function() {
					$('#tab').find("tbody").append(
							"<tr>" + $('#row').find('tr').html() + "</tr>");
			});
		$("a[data-action='delete']").click(function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location = 'reviewDelete.jsp?id=' + $(this).attr('data-id');
			}
			return false;
		});
	});
</script>